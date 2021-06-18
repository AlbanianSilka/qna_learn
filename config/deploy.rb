# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

require 'capistrano-db-tasks'

set :application, "qna_learn"
set :repo_url, "https://github.com/AlbanianSilka/qna_learn.git"
set :deploy_to, '/home/deploy/aws-rails'
set :branch, ENV['Lesson19']

set :linked_files, %w{config/database.yml config/master.key}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 3
set :keep_assets, 3

set :db_local_clean, true
set :db_remote_clean, true

namespaces :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
