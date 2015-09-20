
require 'yaml'
params = YAML.load_file('params.yml')

Vagrant.require_version ">= 1.5"
Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |v|
        v.name = params['name']
        v.customize [
            "modifyvm", :id,
            "--name", params['name'],
            "--memory", 1024,
            "--natdnshostresolver1", "on",
            "--cpus", 1,
        ]
    end

    config.vm.box = "ubuntu/trusty64"
    config.vm.network :private_network, ip: params['ip']
    config.ssh.forward_agent = true

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "ansible/provision.yml"
        ansible.inventory_path = "ansible/inventories/dev"
        ansible.limit = 'all'
    end

    config.vm.synced_folder "./code", "/var/www/vhosts/" + params['name'], type: "nfs"
end
