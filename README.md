# Features

This code starts a basic Ubuntu machine using Vagrant and provisioning it with ansible. The files have been generated from http://phansible.com.

## Installed tools:
* Apache
* PHP 5.6
* MySQL
* Redis
* Composer

## How to start
To start using it, modify the variables that can be found in:
* params.yml
* ansible/inventories/dev
* ansible/vars/all

And just start vagrant:
```
vagrant up
```