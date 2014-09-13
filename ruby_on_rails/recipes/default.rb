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
	curl -L get.rvm.io | bash -s stable
	source /etc/profile.d/rvm.sh
	rvm requirements
	rvm install 2.1.2
	rvm use 2.1.2 --default
	rvm rubygems current
	gem install rails --no-ri --no-rdoc
  EOF
end
