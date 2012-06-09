require 'bundler/capistrano'
require "delayed/recipes" 
require "rvm/capistrano" 

set :rvm_ruby_string, '1.9.2@cm'
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

desc "remotely console"
task :console, :roles => :app do
  input = ''
  run "cd #{current_path} && rvm use 1.9.2@cm && rails console #{ENV['RAILS_ENV']}" do |channel, stream, data|
    next if data.chomp == input.chomp || data.chomp == ''
    print data
    channel.send_data(input = $stdin.gets) if data =~ /:\d{3}:\d+(\*|>)/
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

 
after "deploy:update_code", "customs:config"
after "deploy:symlink","customs:symlink"
after "deploy", "deploy:cleanup"
after "deploy:stop",    "delayed_job:stop"
after "deploy:start",   "delayed_job:start"
after "deploy:restart", "delayed_job:restart"
