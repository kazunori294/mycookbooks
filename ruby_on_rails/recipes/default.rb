#
# Cookbook Name:: ruby_on_rails
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "install ruby_on_rails" do
  command <<-EOF
  	yum install -y sqlite-devel
	curl -L get.rvm.io | bash -s stable
	source /etc/profile.d/rvm.sh
	rvm requirements
	rvm install 2.1.2
	rvm use 2.1.2 --default
	rvm rubygems current
	gem install rails --no-ri --no-rdoc
  EOF
end

#yum install -y mysql-server
#yum install -y mysql-devel

# add vi /etc/my.cnf
#character-set-server = utf8
#default-storage-engine=InnoDB

# service mysqld start
# chkconfig mysqld on
# mysqladmin -u root password 'password'


#mysql> grant all privileges on *.* to infraweb@localhost identified by 'infraweb';
#mysql> select user,host from mysql.user;
#+----------+------------------+
#| user     | host             |
#+----------+------------------+
#| root     | 127.0.0.1        |
#| root     | ::1              |
#|          | ip-172-31-14-121 |
#| root     | ip-172-31-14-121 |
#|          | localhost        |
#| infraweb | localhost        |
#| root     | localhost        |
#+----------+------------------+

#fail... need to fix


#rails new infraweb -d mysql
#add gem 'therubyracer'  to  Gemfile
#bundle install

#rails g controller hosts index

#vi config/database.yml
#default: &default
#  adapter: mysql2
#  encoding: utf8
#  pool: 5
#  username: infraweb
#  password: infraweb
#  socket: /var/lib/mysql/mysql.sock
