# Vagrant-Docker VM #

Ubuntu16.04-based Virtualbox VM prepared for development
with Docker.

It uses Virtualbox and Vagrant to create and provision
a virtual machine. The machine has docker with docker-compose.
It additionally has PHP7.2

### Prerequisites ###

This Vagrantfile uses ``vagrant-disksize`` plugin. To install the plugin use the
following command

```
vagrant plugin install vagrant-disksize
```

### Usage ###

1. 
    Copy ```Vagrantfile.dist``` to ```Vagrantfile``` and customize the
    variables in ```Vagrantfile```
    
    * ```HOST_PROJECTS_PATH``` - path of the shared folder on the host machine
    * ```VM_PROJECTS_PATH``` - path of the shared folder on the VM
    * ```VM_IP``` - IP address of the VM

2. Add the IP of the VM to your ```/etc/hosts```

3. Run:
  * ```vagrant up``` to simply start Vagrant
  * ```vagrant halt``` to stop Vagrant
  * ```./start``` to start Vagrant and limit CPU usage of the Vagrant process


