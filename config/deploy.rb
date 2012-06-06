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
set :deploy_to, "/srv/www/vhosts/rdi-tools-inventory"
set :deploy_via, :remote_cache
set :use_sudo, false


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

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
