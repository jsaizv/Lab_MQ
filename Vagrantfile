# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "mqClient" do |mqClient|
    mqClient.vm.box = "geerlingguy/centos8"
    mqClient.vm.define "MQClient"
    mqClient.vm.hostname = "mqClient"    
    mqClient.vm.network "private_network", ip: "10.0.0.7"
    mqClient.vm.network "public_network", type: "dhcp", bridge: "enp0s3"
    mqClient.vm.provider :virtualbox do |vb|
            vb.name = "mqClient"
    end
    mqClient.vm.synced_folder "provision", "/provision"
    mqClient.vm.provision "shell" do |s|
            s.inline = "sudo chmod a+x /provision/provision.sh && sudo /bin/bash /provision/provision.sh cliente"
            s.binary = true
    end        
  end

  config.vm.define "mqServer" do |mqServer|
    mqServer.vm.box = "geerlingguy/centos8"
    mqServer.vm.define "mqServer"
    mqServer.vm.hostname = "mqServer"
    mqServer.vm.network "forwarded_port", guest: 9443, host: 9443
    mqServer.vm.network "private_network", ip: "10.0.0.8"
    mqServer.vm.network "public_network", type: "dhcp", bridge: "enp0s3"
    mqServer.vm.provider :virtualbox do |vb|
            vb.name = "mqServer"
    end
    mqServer.vm.synced_folder "provision", "/provision"
    mqServer.vm.provision "shell" do |s|
            s.inline = "sudo chmod a+x /provision/provision.sh && sudo /bin/bash /provision/provision.sh server"
            s.binary = true
    end 
  end
end
