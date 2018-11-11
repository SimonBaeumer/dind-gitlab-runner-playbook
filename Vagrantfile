Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "runner-playbook.yml"
    ansible.limit = "runner"
    ansible.inventory_path = "inventory_vagrant"
  end
end
