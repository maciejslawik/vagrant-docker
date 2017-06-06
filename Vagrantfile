VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.ssh.forward_agent = true
  config.vm.define "ubuntu-xenial"
  config.vm.hostname = "ubuntu-xenial"
  config.vm.network :private_network, ip: "192.168.100.12"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "ubuntu16"
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
  end
  config.vm.provision "shell", path: "./provision.sh", privileged: true
end
