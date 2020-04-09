# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
    # The most common configuration options are documented and commented below.
    # For a complete reference, please see the online documentation at
    # https://docs.vagrantup.com.

    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://atlas.hashicorp.com/search.

    # Docker EE node for ubuntu 16.04
    config.vm.define "ucp" do |ubuntu_ucp_node1|
      ubuntu_ucp_node1.vm.box = "ubuntu/xenial64"
      ubuntu_ucp_node1.vm.network "private_network", ip: "172.28.128.31"
      ubuntu_ucp_node1.landrush.tld = 'local'
      ubuntu_ucp_node1.vm.hostname = "ucp.local"
      ubuntu_ucp_node1.landrush.enabled = true
      ubuntu_ucp_node1.landrush.host 'dtr.local', '172.28.128.33'
      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "4096"]
        vb.customize ["modifyvm", :id, "--cpus", "4"]
      end
      ubuntu_ucp_node1.vm.provision "shell", inline: <<-SHELL
        set -e
        sudo apt-get update
        sudo apt-get install -y apt-transport-https ca-certificates jq
        sudo cp /vagrant/scripts/install_ee.sh .
        sudo cp /vagrant/scripts/install_ucp.sh .
        sudo chmod +x install_ee.sh
        sudo chmod +x install_ucp.sh
        ./install_ee.sh
        ./install_ucp.sh
      SHELL
    end

    # Docker EE node for ubuntu 16.04
    config.vm.define "worker-node1" do |ubuntu_worker_node1|
      ubuntu_worker_node1.vm.box = "ubuntu/xenial64"
      ubuntu_worker_node1.vm.network "private_network", ip: "172.28.128.32"
      ubuntu_worker_node1.landrush.tld = 'local'
      ubuntu_worker_node1.vm.hostname = "worker-node1.local"
      ubuntu_worker_node1.landrush.enabled = true
      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
        vb.customize ["modifyvm", :id, "--cpus", "2"]
      end
      ubuntu_worker_node1.vm.provision "shell", inline: <<-SHELL
        set -e
        sudo apt-get update
        sudo apt-get install -y apt-transport-https ca-certificates jq
        sudo cp /vagrant/scripts/install_ee.sh .
        sudo chmod +x install_ee.sh
        ./install_ee.sh
      SHELL
    end

    # Docker EE DTR node for ubuntu 16.04
    config.vm.define "dtr" do |ubuntu_dtr_node1|
      ubuntu_dtr_node1.vm.box = "ubuntu/xenial64"
      ubuntu_dtr_node1.vm.network "private_network", ip: "172.28.128.33"
      ubuntu_dtr_node1.landrush.tld = 'local'
      ubuntu_dtr_node1.vm.hostname = "dtr.local"
      ubuntu_dtr_node1.landrush.enabled = true
      ubuntu_dtr_node1.landrush.host 'ucp.local', '172.28.128.31'
      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
        vb.customize ["modifyvm", :id, "--cpus", "2"]
      end
      ubuntu_dtr_node1.vm.provision "shell", inline: <<-SHELL
        set -e
        sudo apt-get update
        sudo apt-get install -y apt-transport-https ca-certificates jq
        sudo cp /vagrant/scripts/install_ee.sh .
        sudo chmod +x install_ee.sh
        ./install_ee.sh
      SHELL
    end
end
