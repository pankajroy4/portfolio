server "13.233.151.117", user: "ubuntu", roles: %w{app db web}
set :rails_env, 'production'
set :deploy_to, '/home/ubuntu/apps/portfolio'

set :tmp_dir, "/home/ubuntu/apps/tmp"
set :rvm_ruby_version, 'ruby-3.2.0@portfolio --create'
