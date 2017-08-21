# -*- mode: ruby -*-
# vi: set ft=ruby :

#require_relative './provisioners/key_auth.rb'

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  #authorize_key_for_root config, '~/.ssh/id_rsa.pub'

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
  end

  config.vm.synced_folder ".", "/srv/ansible"

  config.vm.define "vmzed" do |host|
    host.vm.hostname = "vmzed.nihilsum.dev"
    # host.vm.provision :shell, inline: 'cat /vagrant/provisioners/squeakytest.pub >> /home/vagrant/.ssh/authorized_keys'
    host.vm.provision :shell, path: "provisioners/vmzed.sh"
    host.vm.network 'private_network', ip: "192.168.56.200"
    host.vm.network "forwarded_port", guest: 445, host: 4450
    host.vm.network "forwarded_port", guest: 548, host: 5480
    host.vm.network "forwarded_port", guest: 5353, host: 5353
  end

end
