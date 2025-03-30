lock "~> 3.19.2"
set :application, "portfolio"
set :repo_url, "git@github.com:pankajroy4/portfolio.git"
set :rvm_type, :user
set :rvm_ruby_version, "3.2.0"

set :branch, "main" 
set :deploy_to, "/home/ubuntu/apps/#{fetch(:application)}"

set :default_env, {
  PATH: "/home/ubuntu/.nvm/versions/node/v18.20.5/bin:$PATH"
}

append :linked_files, "config/database.yml", 'config/master.key' ,'config/credentials/production.key'
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage", "public/uploads"

set :keep_releases, 1

set :ssh_options, {
  keys: %w(/Users/pankajroy/.ssh/pankaj_deploy.pem),
  forward_agent: true,
  auth_methods: %w(publickey)
}

namespace :deploy do
  desc "Build assets"
  task :build_assets do
    on roles(:web) do
      within release_path do
        execute :yarn, "install --frozen-lockfile"
        execute :yarn, "build"
        #execute :yarn, "build:css"  #Getting tailwind error so, need to run manually after deployment
      end
    end
  end

  after "deploy:updated", "deploy:build_assets"
end

#NOTE: After deployment, goto current folder at server and run the command to build the css:
# yarn build:css