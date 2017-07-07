#!/bin/sh
if [ ! -f "/home/vagrant/.ssh/id_rsa" ]; then
  /usr/bin/ssh-keygen -t rsa -N "" -f /home/vagrant/.ssh/id_rsa
fi
/bin/cp /home/vagrant/.ssh/id_rsa.pub /srv/ansible/provisioners/squeaky.pub

/bin/cat << 'SSHEOF' > /home/vagrant/.ssh/config
Host *
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
SSHEOF

/bin/cat << 'HOSTSEOF' >> /etc/hosts
127.0.0.1       squeakytest squeakytest
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
HOSTSEOF

/bin/chown -R vagrant:vagrant /home/vagrant/.ssh/
