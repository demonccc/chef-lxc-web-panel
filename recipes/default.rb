#
# Cookbook Name:: lxc-web-panel
# Recipe:: default
#
# Copyright 2015, Claudio César Sánchez Tejeda
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node['lwp']['ssl']['enabled']

  node.set['nginx']['default_site_enabled'] = false
  node.set['lwp']['conf']['global']['address'] = "127.0.0.1"
  include_recipe "lxc-web-panel::ssl" 

end

if node["lsb"]["codename"].eql?("precise")

  apt_repository "ubuntu-lxc-stable" do
    uri "http://ppa.launchpad.net/ubuntu-lxc/stable/ubuntu"
    distribution "precise"
    components ["main"]
    keyserver "keyserver.ubuntu.com"
    key "7635B973"
  end

  apt_repository "chris-lea-python-flask" do
    uri "http://ppa.launchpad.net/chris-lea/python-flask/ubuntu"
    distribution "precise"
    components ["main"]
    keyserver "keyserver.ubuntu.com"
    key "C7917B12"
  end

  apt_repository "chris-lea-python-itsdangerous" do
    uri "http://ppa.launchpad.net/chris-lea/python-itsdangerous/ubuntu"
    distribution "precise"
    components ["main"]
    keyserver "keyserver.ubuntu.com"
    key "C7917B12"
  end

end

apt_repository "lxc-web-panel" do
  uri "http://claudyus.github.io/LXC-Web-Panel/"
  distribution "debian/"
  key "http://claudyus.github.io/LXC-Web-Panel/claudyus.gpg.key"
end

package node['lwp']['package']['name'] do
  action :install
  version node['lwp']['package']['version'] if node['lwp']['package']['version']
  options node['lwp']['package']['options'] if node['lwp']['package']['options']
end

template "#{node['lwp']['dir']['conf']}/lwp.conf" do
  variables( :conf => node['lwp']['conf'] )
  notifies :restart, "service[lwp]" 
end

service "lwp" do
  supports :restart => true
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
end

