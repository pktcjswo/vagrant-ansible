# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "boxcutter/ubuntu1604-desktop"
  #config.vm.box = "jUbuntu1604-desktop-ansibled"
  config.vm.box_check_update = false
  
  config.vm.hostname = "va-default-ud1404"
  config.vm.synced_folder ".", "/vagrant", disabled: false, mount_options: ["dmode=775,fmode=774"]
  config.vm.synced_folder "D:/vbox/data", "/data", disabled: false, mount_options: ["dmode=775,fmode=774"]
  config.vm.synced_folder "D:/vbox/data/archive", "/home/vagrant/archive", disabled: false, mount_options: ["dmode=755,fmode=764"]
  config.vm.synced_folder "D:/vbox/data/opt", "/home/vagrant/opt", disabled: false, mount_options: ["dmode=755,fmode=764"]
  config.vm.synced_folder "D:/vbox/data/ws", "/home/vagrant/ws", disabled: false, mount_options: ["dmode=755,fmode=764"]
  config.vm.network :private_network, ip: "192.168.33.90"

  config.ssh.insert_key = false
  config.vbguest.auto_update = false

  config.vm.provider :virtualbox do |v|
    v.memory = 1536
    v.cpus = 2
    v.gui = true
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.provision "shell", path: "provisioning.sh"
  #config.vm.provision "shell", path: "devtools.sh"

end
