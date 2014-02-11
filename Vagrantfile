# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"

  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end

  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.ssh.forward_agent = true

  config.vm.synced_folder "salt/roots/", "/srv/salt/"
  config.vm.synced_folder "salt/pillar/", "/srv/pillar/"

  config.vm.provision :salt do |salt|
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
  end
end
