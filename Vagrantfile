# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

domain = "demo.me"

nodes = [
  { :hostname => 'nfr', :ip => '172.16.0.0', :box => 'precise64', :fwhost => 8000, :fwguest => 80, :ram => 512 },
#  { :hostname => 'flask', :ip => '172.16.0.1', :box => 'precise64' },
#  { :hostname => 'redis', :ip => '172.16.0.2', :box => 'precise64' },
]
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      # Box name
      node_config.vm.box = node[:box]
      # Provider box url
      node_config.vm.box_url = 'http://files.vagrantup.com/' + node[:box] + '.box'
      # Hostname
      node_config.vm.host_name = node[:hostname]+'.'+domain
      # Port forwarding
      if node[:fwhost]
        node_config.vm.network :forwarded_port,guest: node[:fwguest], host: node[:fwhost]
      end
      # Host-only access private network
      config.vm.network :private_network, ip: node[:ip]
      # Shared folders
      node_config.vm.synced_folder "src/", "/var/www/#{node[:hostname]}.#{domain}/src"
      # VM memory 
      memory = node[:ram] ? node[:ram] : 256;
      node_config.vm.provider :virtualbox do |vb|
        vb.customize [
          'modifyvm', :id,
          '--name', node[:hostname],
          '--memory', memory.to_s
        ]
      end
      # Puppet config
      config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file  = "site.pp"
        puppet.module_path = "puppet/modules"
      end
    end
  end
end
