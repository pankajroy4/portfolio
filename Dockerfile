# Stage 1: Build
FROM ruby:3.2.0 AS build

WORKDIR /app
ENV RAILS_ENV=production \
    BUNDLE_PATH=/usr/local/bundle

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
      build-essential \
      curl \
      git \
      libpq-dev \
      libvips \
      pkg-config \
      python-is-python3 && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install --no-install-recommends -y nodejs && \
    npm install -g yarn@1.22.22 && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .

RUN bundle exec bootsnap precompile app/ lib/

# Runtime image
FROM ruby:3.2.0

WORKDIR /app
ENV RAILS_ENV=production \
    BUNDLE_PATH=/usr/local/bundle

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
      curl \
      libvips && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install --no-install-recommends -y nodejs && \
    npm install -g yarn@1.22.22 && \
    rm -rf /var/lib/apt/lists/*

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /app /app

RUN chmod +x script/start_prod.sh

EXPOSE 3000

ENTRYPOINT ["./script/start_prod.sh"]