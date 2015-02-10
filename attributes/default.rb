# Package attributes
default['lwp']['package']['name'] = "lwp"
#default['lwp']['package']['version'] = "0.6-9-g9c015d6"
#default['lwp']['package']['options'] = "-y --force-yes"

# Path attributes
default['lwp']['dir']['conf'] = "/etc/lwp"

# SSL attributes
default['lwp']['ssl']['enabled'] = false
default['lwp']['ssl']['log']['access'] = "/var/log/nginx/lwp_ssl_access.log"
default['lwp']['ssl']['log']['error'] = "/var/log/nginx/lwp_ssl_error.log"
default['lwp']['nginx']['proxy_read_timeout'] = 300
default['lwp']['cert']['databag']['name'] = "lwp"
default['lwp']['cert']['databag']['item'] = "cert"
default['lwp']['cert']['databag']['encrypted_file'] = "/etc/chef/encrypted_file"

# Configuration attributes (the ['lwp']['conf'] hash is used to create the configuration file)
default['lwp']['conf']['global']['address'] = "0.0.0.0"
default['lwp']['conf']['global']['port'] = 5000
default['lwp']['conf']['global']['debug'] = "false"
default['lwp']['conf']['global']['secret_key'] = "90d0eb95a22e54292ecb095554b0cb975eb8c357"
default['lwp']['conf']['global']['auth'] = "database" # or "ldap" or "pam" or "htpasswd"
default['lwp']['conf']['global']['buckets'] = false
default['lwp']['conf']['database']['file'] = "/var/lwp/lwp.db"
default['lwp']['conf']['htpasswd']['file'] = "/var/lwp/htpasswd"
default['lwp']['conf']['session']['time'] = 10
default['lwp']['conf']['overview']['partition'] = "/"
default['lwp']['conf']['storage_repository']['local'] = "/var/lxc-backup"
default['lwp']['conf']['storage_repository']['nfs'] = "/mnt/lxc-backup"
default['lwp']['conf']['ldap']['host'] = "ldap_server_ip"
default['lwp']['conf']['ldap']['port'] = 389 # or 636
default['lwp']['conf']['ldap']['ssl'] = "false" # or "true"
default['lwp']['conf']['ldap']['base'] = "dc=example,dc=com"
default['lwp']['conf']['ldap']['bind_method'] = "anon" #or "user"
default['lwp']['conf']['ldap']['bind_dn'] = "ou=people,dc=example,dc=com"
default['lwp']['conf']['ldap']['password'] = "auth_user_password"
default['lwp']['conf']['ldap']['id_mapping'] = "uid"
default['lwp']['conf']['ldap']['display_mapping'] = "cn"
default['lwp']['conf']['ldap']['object_class'] = "posixAccount"
default['lwp']['conf']['ldap']['required_group'] =  "" # or "some_group"
default['lwp']['conf']['buckets']['buckets_host'] = "remote_lan_ip"
default['lwp']['conf']['buckets']['buckets_port'] = 1234
default['lwp']['conf']['pam']['service'] = "login"
