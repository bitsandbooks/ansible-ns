# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
  end
  config.vm.box = "kaorimatz/ubuntu-16.04-amd64"

  config.vm.define "squeakytest" do |squeakytest|
    squeakytest.vm.hostname = "squeakytest"
    squeakytest.vm.synced_folder "./", "/srv/ansible"
    squeakytest.vm.provision :shell, inline: 'cat /vagrant/provisioners/squeakytest.pub >> /home/vagrant/.ssh/authorized_keys'
    squeakytest.vm.provision :shell, path: "provisioners/squeakytest.sh"
  end

end
