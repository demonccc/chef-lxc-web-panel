name             'lxc-web-panel'
maintainer       'Claudio César Sánchez Tejeda'
maintainer_email 'demonccc@gmail.com'
license          'All rights reserved'
description      'Installs/Configures LXC Web Panel'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.3'

depends "chef-vault"
depends "nginx"
depends	"apt"

%w{ ubuntu debian }.each do |os|
  supports os
end

recipe 'lxc-web-panel', 'Installs and configures LXC Web Panel'
recipe 'lxc-web-panel::ssl', 'Set up HTTPS service layer for LXC Web Panel'
