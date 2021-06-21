mkdir ~/.ssh
$ ls ~/.ssh/*.pub
ls ~/.ssh/*.pub
ssh-keygen -o
ls ~/.ssh/
exit
sudo apt-get update
sudo apt-get upgrade
date
sudo dpkg-reconfigure tzdata
date
sudo reboot
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo add-apt-repository ppa:chris-lea/redis-server
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev dirmngr gnupg apt-transport-https ca-certificates redis-server redis-tools nodejs yarn
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
git clone https://github.com/rbenv/rbenv-vars.git ~/.rbenv/plugins/rbenv-vars
exec $SHELL
rbenv install 3.0.1
rbenv global 3.0.1
ruby -v
gem install bundler
export GEM_HOME="$HOME/.gem"
brew install ruby
gem install rails
gem install bundler
gem install bundler -v 1.17.3
bundle -v
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger focal main > /etc/apt/sources.list.d/passenger.list'
/Users/andriikhavriuta/Downloads/GitHub\ Desktop.app 
sudo apt-get update
sudo apt-get install -y nginx-extras libnginx-mod-http-passenger
if [ ! -f /etc/nginx/modules-enabled/50-mod-http-passenger.conf ]; then sudo ln -s /usr/share/nginx/modules-available/mod-http-passenger.load /etc/nginx/modules-enabled/50-mod-http-passenger.conf ; fi
sudo ls /etc/nginx/conf.d/mod-http-passenger.conf
sudo nano /etc/nginx/conf.d/mod-http-passenger.conf
sudo service nginx start
sudo nginx 
sudo service nginx restart
service nginx status
sudo nano /etc/hosts
sudo service nginx stop
service nginx status
sudo service nginx start
service nginx status
asdasd
sudo nano /etc/hosts
sudo rm /etc/nginx/sites-enabled/default
sudo nano /etc/nginx/sites-enabled/TestProjectRails
su service nginx reload
sudo service nginx reload
sudo apt-get install postgresql postgresql-contrib libpq-dev
sudo su - postgres
psql -U deployer -W -H 127.0.0.1 -d TestProjectRails
cap install STAGES=production
apt install capistrano
rbenv rehash
cap install STAGES=production
cap install 
exit
cap install STAGES=production
apt install capistrano
git init
exit
