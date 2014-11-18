# general components for server

# Configure the proper timezone
execute 'configure timezone' do
  command 'echo "America/Los_Angeles" > /etc/timezone; dpkg-reconfigure --frontend noninteractive tzdata'
end

# fix the locale
execute "locale-gen" do
  command "locale-gen en_US.UTF-8"
end

# create some swapping space
swap_file '/mnt/swap' do
  size 1024
end

# recipes
include_recipe "apt"
include_recipe "nodejs"
include_recipe "memcached"
include_recipe "nginx"
include_recipe "rbenv"

# base packages
package 'htop'
package 'git-core'
package 'ssl-cert'

# install image processing libraries
%w{imagemagick libmagick++-dev libmagickcore-dev libmagickwand-dev advancecomp gifsicle jpegoptim libjpeg-progs optipng pngcrush}.each do |pkg|
  package pkg
end

# install monit
package "monit" do
  action :install
end

service "nginx" do
  supports :reload => true
end

# some system magick
service 'procps' do
  supports :restart => true
  action :nothing
end

template "/etc/sysctl.conf" do
  source "sysctl.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[procps]"
end
