set :application, "The Choice Matrix"
set :repository,  "git@github.com:bradreid/cm.git"
set :user, "btc"
set :scm, :git
set :branch, "master"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "rditools.brandonu.ca"                          # Your HTTP server, Apache/etc
role :app, "rditools.brandonu.ca"                          # This may be the same as your `Web` server
role :db,  "rditools.brandonu.ca", :primary => true # This is where Rails migrations will run

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/srv/www/vhosts/rdi-tools-inventory/"
set :deploy_via, :remote_cache
set :use_sudo, false


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

namespace(:customs) do
  task :config, :roles => :app do
    run <<-CMD
      ln -nfs #{shared_path}/system/database.yml #{release_path}/config/database.yml
    CMD
  end
  task :symlink, :roles => :app do
    run <<-CMD
      ln -nfs #{shared_path}/system/uploads #{release_path}/public/uploads
    CMD
  end
end

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end
 
  task :bundle_new_release, :roles => :app do
    bundler.create_symlink
    run "cd #{release_path} && bundle install --without test"
  end
end
 
after "deploy:update_code", "customs:config", 'bundler:bundle_new_release'
after "deploy:symlink","customs:symlink"
after "deploy", "deploy:cleanup"
