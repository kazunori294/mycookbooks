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

# add vi /etc/my.cnf
#character-set-server = utf8
#default-storage-engine=InnoDB

# service mysqld start
# chkconfig mysqld on
# mysqladmin -u root password 'password'


#fail... need to fix
