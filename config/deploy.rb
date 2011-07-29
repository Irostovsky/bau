set :application, "bau"

set :scm, :git

set :repository,  "git@github.com:Irostovsky/bau.git"

set :deploy_via, :copy
set :copy_strategy, :export

set :deploy_to, "/home/nika/bau"
set :deploy_by_user, 'nika@'

set :use_sudo, false

# set :ip, '173.203.201.62' 
# 69.175.35.2 - new
set :ip, '69.175.35.2'
role :app, "#{deploy_by_user}#{ip}"
role :web, "#{deploy_by_user}#{ip}"
role :db,  "#{deploy_by_user}#{ip}", :primary => true

after 'deploy:symlink', 'deploy:shared_data'

namespace :deploy do

  task :shared_data do
    shared_avatars_dir = "#{shared_path}/assets"
    run "mkdir -p #{shared_avatars_dir}" # make dir if it doesn't exist
    # run "chown  -R www-data #{shared_avatars_dir}"
    run "ln -s #{shared_avatars_dir} #{current_path}/public/assets"
  end

  task :restart, :roles => :app do
    # run "chown  -R www-data #{current_path}/"
    run "touch #{current_path}/tmp/restart.txt"
  end
end

