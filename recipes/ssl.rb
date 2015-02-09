#
# Cookbook Name:: lxc-web-panel
# Recipe:: ssl
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

include_recipe "nginx"
include_recipe "chef-vault"

databag = node['lwp']['cert']['databag']

begin
  databag = chef_vault_item(databag['name'], databag['item'])
rescue
  secret_file = Chef::EncryptedDataBagItem.load_secret(databag['encrypted_file'])
  databag = Chef::EncryptedDataBagItem.load(databag['name'], databag['item'], secret_file)
end

directory "#{node['nginx']['dir']}/ssl" do
  owner "root"
  group node['nginx']['group']
  mode 0770
end

%w{ cert key}.each do |i|
  file "#{node['nginx']['dir']}/ssl/lwp_#{i}.pem" do
    owner "root"
    group node['nginx']['group']
    mode 0640
    content databag[i]
    sensitive true
    notifies :reload, 'service[nginx]'
  end
end

template "#{node['nginx']['dir']}/sites-available/lwp" do
  source "nginx_site.erb"
  owner  'root'
  group  node['root_group']
  mode   '0644'
  notifies :reload, 'service[nginx]'
end

nginx_site "lwp" do
 enable "lwp"
end
