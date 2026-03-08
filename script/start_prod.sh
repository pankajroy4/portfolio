#!/bin/bash
set -e

echo "Installing Gems and Dependencies..."
bundle check || bundle install

# Precompile assets and migrate only in production
if [ "$RAILS_ENV" = "production" ]; then
  echo "Precompiling Rails assets..."
  bundle exec rails assets:precompile

  echo "Running database migrations..."
  bundle exec rails db:migrate
fi

echo "Starting Puma server..."
exec bundle exec puma -C config/puma.rb