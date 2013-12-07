require './config/boot'
require 'airbrake/capistrano'
require "bundler/capistrano"
require "capistrano_colors"
set :branch_name do
    Capistrano::CLI.ui.ask 'Enter branch name to deploy: '
end

set :branch do
    branch_name ? "#{branch_name}" : 'master'
end
set :bundle_cmd, "LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8' bundle"
set :application, "app"
set :deploy_to, "/home/app/#{application}"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

set :scm, :git
set :repository,  "git@github.com:darron/frozen-cdn_fe.git"

default_run_options[:pty] = true
set :use_sudo, false
set :user, "app"
set :password, ""
set :domain, "app.example.net"
set :normalize_asset_timestamps, false

role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :unicorn do
  desc "start unicorn"
  task :start, :roles => :app, :except => { :no_release => true } do 
    run "cd #{deploy_to}/current && bundle exec unicorn_rails -c #{deploy_to}/current/unicorn.rb -E production -D"
  end
  desc "stop unicorn"
  task :stop, :roles => :app, :except => { :no_release => true } do 
    run "kill `cat #{unicorn_pid}`"
  end
  desc "graceful stop unicorn"
  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "kill -s QUIT `cat #{unicorn_pid}`"
  end
  desc "reload unicorn"
  task :reload, :roles => :app, :except => { :no_release => true } do
    run "kill -s USR2 `cat #{unicorn_pid}`"
  end

  after "deploy:restart", "unicorn:stop", "unicorn:start"
end

#after "deploy:symlink", "deploy:restart_workers"

##
# Rake helper task.
# http://pastie.org/255489
# http://geminstallthat.wordpress.com/2008/01/27/rake-tasks-through-capistrano/
# http://ananelson.com/said/on/2007/12/30/remote-rake-tasks-with-capistrano/
def run_remote_rake(rake_cmd)
  rake_args = ENV['RAKE_ARGS'].to_s.split(',')
  cmd = "cd #{fetch(:latest_release)} && #{fetch(:rake, "rake")} RAILS_ENV=#{fetch(:rails_env, "production")} #{rake_cmd}"
  cmd += "['#{rake_args.join("','")}']" unless rake_args.empty?
  run cmd
  set :rakefile, nil if exists?(:rakefile)
end

namespace :deploy do
  desc "Restart Resque Workers"
  task :restart_workers, :roles => :db do
    run_remote_rake "resque:restart_workers"
  end
end
