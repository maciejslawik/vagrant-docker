# Vagrant-Docker VM #

Ubuntu-based Virtualbox VM prepared for development
with Docker.

It uses Virtualbox and Vagrant to create and provision
a virtual machine. The machine has docker with docker-compose.
It additionally has Nginx and PHP7 with Adminer running 
under `` http://<<IP>>:8080 ``

By default:
 - The IP is `` 192.168.100.12 ``
 - The memory allocated to the VM is 4gb
 - The number of CPUs allocated to the VM is 2


The above can be changed in the Vagranfile.
