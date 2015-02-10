lxc-web-panel Cookbook
======================

This cookbook installs and configures [LXC Web Panel](http://claudyus.github.io/LXC-Web-Panel/) application. It also installs and conigures Nginx in order to add HTTPS service layer to this application.

Requirements
------------

#### Chef
Tested on 11.12.8 but newer and older version should work just fine.

#### Platform
The following platforms have been tested with this cookbook, meaning that the recipes run on these platforms without error:
- `Ubuntu`
- `Debian`

#### Cookbooks
- `nginx` - Used to install Nginx if you need to configure HTTPS service layer.
- `chef-vault` - This cookbook is used to install chef-vault and permit to the cookbook use vaults instead databags.
- `apt` - It is used to configures some repositories in order to install the necesaries packages.

Attributes
----------

#### lxc-web-panel::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['lwp']['package']['name']</tt></td>
    <td>String</td>
    <td>Package name</td>
    <td><tt>lwp</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['package']['version']</tt></td>
    <td>String</td>
    <td>Package version</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['package']['options']</tt></td>
    <td>String</td>
    <td>Package install options</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['dir']['conf']</tt></td>
    <td>String</td>
    <td>Path of the directory where are the configuration files</td>
    <td><tt>/etc/lwp</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['ssl']['enabled']</tt></td>
    <td>boolean</td>
    <td>Enable or disable SSL protocol</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['ssl']['log']['access']</tt></td>
    <td>String</td>
    <td>Nginx access log file</td>
    <td><tt>/var/log/nginx/lwp_ssl_access.log</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['log']['error']</tt></td>
    <td>String</td>
    <td>Nginx error log file</td>
    <td><tt>/var/log/nginx/lwp_ssl_error.log</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['nginx']['proxy_read_timeout']</tt></td>
    <td>Numeric</td>
    <td>Nginx proxy read timeout value</td>
    <td><tt>300</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['cert']['databag']['name']</tt></td>
    <td>String</td>
    <td>Databag name where is located the certificate data. It could be the vault name if you are using chef-vault in order to store your sensible data.</td>
    <td><tt>lwp</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']'cert']['databag']['item']</tt></td>
    <td>String</td>
    <td>Databag item that contains the certificate data. It could be the vault item if you are using chef-vault in order to store your sensible data.</td>
    <td><tt>cert</tt></td>
  </tr> 
  <tr>
    <td><tt>['lwp']['cert']['databag']['encrypted_file']</tt></td>
    <td>String</td>
    <td>The path of the encrypted file if you are using encrypted databags</td>
    <td><tt>/etc/chef/encrypted_file</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['global']['address']</tt></td>
    <td>String</td>
    <td>Listen IP</td>
    <td><tt>0.0.0.0</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['global']['port']</tt></td>
    <td>String</td>
    <td>Listen port</td>
    <td><tt>5000</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['global']['debug']</tt></td>
    <td>Boolean</td>
    <td>Enable log debug</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['global']['secret_key']</tt></td>
    <td>String</td>
    <td>Secret key</td>
    <td><tt>70c0af95a33e54292ecb095664b0fb975eb8c641</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['global']['auth']</tt></td>
    <td>String</td>
    <td>Auth method. The posible values are: database, ldap or pam</td>
    <td><tt>database</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['global']['buckets']</tt></td>
    <td>Boolean</td>
    <td>Enable buckets feature</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['database']['file']</tt></td>
    <td>String</td>
    <td>Database file path</td>
    <td><tt>/var/lwp/lwp.db</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['htpasswd']['file']</tt></td>
    <td>String</td>
    <td>Htpasswd file path</td>
    <td><tt>/var/lwp/htpasswd</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['session']['time']</tt></td>
    <td>String</td>
    <td>Session time</td>
    <td><tt>10</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['overview']['partition']</tt></td>
    <td>String</td>
    <td>Overview partition path</td>
    <td><tt>/</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['storage_repository']['local']</tt></td>
    <td>String</td>
    <td>Local storahe repository path</td>
    <td><tt>/var/lxc-backup</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['storage_repository']['nfs']</tt></td>
    <td>String</td>
    <td>NFS storage repository path</td>
    <td><tt>/mnt/lxc-backup</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['ldap']['host']</tt></td>
    <td>String</td>
    <td>LDAP server host or ip</td>
    <td><tt>ldap.example.com</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['ldap']['port']</tt></td>
    <td>String</td>
    <td>LDAP server port</td>
    <td><tt>389</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['ldap']['ssl']</tt></td>
    <td>String</td>
    <td>Enable LDAP SSL protocol</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['ldap']['base']</tt></td>
    <td>String</td>
    <td>LDAP base</td>
    <td><tt>dc=example,dc=com</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['ldap']['bind_method']</tt></td>
    <td>String</td>
    <td>LDAP bind method. It could be: anon or user</td>
    <td><tt>anon</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['ldap']['bind_dn']</tt></td>
    <td>String</td>
    <td>LDAP bind dn</td>
    <td><tt>ou=people,dc=example,dc=com</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['ldap']['password']</tt></td>
    <td>String</td>
    <td>LDAP password of the user used to log in in the LDAP server</td>
    <td><tt>auth_user_password</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['ldap']['id_mapping']</tt></td>
    <td>String</td>
    <td>LDAP field used to identify the user</td>
    <td><tt>uid</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['ldap']['display_mapping']</tt></td>
    <td>String</td>
    <td>LDAP field used to identify the real name of the user</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['ldap']['object_class']</tt></td>
    <td>String</td>
    <td>LDAP objectclass to filter the users objects</td>
    <td><tt>posixAccount</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['ldap']['required_group']</tt></td>
    <td>String</td>
    <td>Group of the users that could authenticate in the application</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['buckets']['buckets_host'] </tt></td>
    <td>String</td>
    <td>Buckets server host or IP</td>
    <td><tt>buckets.example.com</tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['buckets']['buckets_port'] </tt></td>
    <td>String</td>
    <td>Buckets server port</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['lwp']['conf']['pam']['service']</tt></td>
    <td>String</td>
    <td>Pam service</td>
    <td><tt>login</tt></td>
  </tr>
</table>

*NOTE:* The hash ['lwp']['conf'] is used to create the configuration file, so you can add new entries in order to add configuration parameters dynamically.

Recipes
-------

#### lxc-web-panel::default
This recipe installs and configures LXC Web Panel in the node.

#### lxc-web-panel::ssl
This recipe installs and configures Nginx in order to use LXC Web Panel with HTTPS service layer.

Usage
-----

Just include `lxc-web-panel` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[lxc-web-panel]"
  ]
}
```
Set the attributes in order to configure LXC Web Panel, for example:
```json
"lwp": {
  "package": {
    "version": "0.7-18-g2747d90",
    "options": "--force-yes"
  },
  "ssl": {
    "enabled": true
  },
  "conf": {
    "global": {
      "auth": "ldap"
    },
    "ldap": {
      "host": "ldap.example.com",
      "port": 636,
      "ssl": "true",
      "base": "ou=people,dc=example,dc=com",
      "bind_method": "anon",
      "required_group": "lwp-users"
    }
  }
}
```

Development
-----------

- Source hosted at [GitHub][repo]
- Report issues/Questions/Feature requests on [GitHub Issues][issues]

Contributing
------------

1. Fork the repository on [Github][repo]
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

Author:: Claudio Cesar Sanchez Tejeda <demonccc@gmail.com>

Copyright:: 2014, Claudio Cesar Sanchez Tejeda

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[repo]: https://github.com/demonccc/chef-lxc-web-panel
[issues]: https://github.com/demonccc/chef-lxc-web-panel/issues
