# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rbenv'
set :rbenv_type, :user
set :rbenv_ruby, '3.0.1'
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
