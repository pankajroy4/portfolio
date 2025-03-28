# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :application, "portfolio"
set :repo_url, "git@github.com:pankajroy4/portfolio.git"

# set :rbenv_type, :user
# set :rbenv_ruby, "3.2.0"  

set :rvm_type, :user  # Tells Capistrano you're using RVM
set :rvm_ruby_version, "3.2.0"  # The Ruby version you installed with RVM


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, "main" 

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
set :deploy_to, "/home/ubuntu/apps/#{fetch(:application)}"

set :default_env, {
  PATH: "/home/ubuntu/.nvm/versions/node/v18.20.5/bin:$PATH"
}




# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", 'config/master.key' ,'config/credentials/production.key'

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :default_env, { path: "~/.rvm/bin:$PATH" }


# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 2

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :ssh_options, {
  keys: %w(/Users/pankajroy/.ssh/pankaj_deploy.pem),
  forward_agent: true,
  auth_methods: %w(publickey)
}
