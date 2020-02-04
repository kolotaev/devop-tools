#!/usr/bin/env bash

# Update sources
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y

# Install git
apt-get install git -y

# Install curl
apt-get install curl software-properties-common -y

# Install g++ and friends
apt-get install g++ autoconf libtool build-essential automake -y


# Install python3
apt-get install python3 -y


# Install Golang
wget https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz
tar -xvf go1.12.6.linux-amd64.tar.gz
mv go /usr/local
mkdir -p ~/goprojects
echo GOROOT=/usr/local/go >> /home/vagrant/.bashrc
echo GOPATH=~/goprojects >> /home/vagrant/.bashrc
echo PATH=\$GOPATH/bin:\$GOROOT/bin:$PATH >> /home/vagrant/.bashrc
go version


# install PHP5
apt-get install php5 php5-dev php-pear phpunit -y && \
curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer


# install Ruby via RVM
apt install curl g++  gcc  autoconf  automake  bison  libc6-dev  libffi-dev  libgdbm-dev  libncurses5-dev  libsqlite3-dev  libtool  libyaml-dev  make  pkg-config  sqlite3  zlib1g-dev  libgmp-dev  libreadline-dev  libssl-dev -y
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.5.1
rvm use 2.5.1 --default
ruby -v
gem install bundler


# Install Postgres 9.4
apt-get install postgresql-9.4 postgresql-client-9.4 -y


# Configure Postgres
sudo -u postgres psql -c "ALTER USER \"postgres\" WITH PASSWORD 'root';"
mkdir -p /etc/postgresql/9.4/main/conf.d
cp /shared/postgres_custom.conf /etc/postgresql/9.4/main/conf.d/00postgres_custom.conf
echo "include_dir 'conf.d'" >> /etc/postgresql/9.4/main/postgresql.conf
echo "host    all             all              0.0.0.0/0                       md5" >> /etc/postgresql/9.4/main/pg_hba.conf
echo "host    all             all              ::/0                            md5" >> /etc/postgresql/9.4/main/pg_hba.conf
service postgresql restart


# Install Docker
if [ -x "$(command -v docker)" ]; then
    echo "Docker is already installed"
else
    echo "Install docker"
    cd /tmp
    curl -fsSL get.docker.com -o get-docker.sh
    sh get-docker.sh
    usermod -aG docker vagrant
fi
