# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    # Box definitions
    config.vm.box = "base"
    config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box"

    # Setup ssh forwarding. Refer to https://help.github.com/articles/using-ssh-agent-forwarding
    config.ssh.forward_agent = true

    # Configure network and ports to forward to host
    config.vm.network :private_network, ip: "192.168.12.34"
    config.vm.network :forwarded_port, guest: 3000, host: 3000

    # Share additional folders
    config.vm.synced_folder "~/Dropbox/Photos 0001-0097/", "/home/vagrant/Photos/"

    # Configure VM name and memory required
    config.vm.provider :virtualbox do |vb|
        vb.name = "vag"
        vb.customize ["modifyvm", :id, "--memory", "2048"]
    end

    # Pre-requisites for provisioning via Chef
    config.berkshelf.enabled = true # https://github.com/riotgames/vagrant-berkshelf
    config.omnibus.chef_version = :latest # https://github.com/schisamo/vagrant-omnibus

    # Provisioning via Chef
    config.vm.provision "chef_solo" do |chef|

        # Recipes to be run are set here per role
        chef.roles_path = "roles"

        # Required by homesick::data_bag recipe where homesick castle user and source are defined
        chef.data_bags_path = "data_bag"

        # Roles and the recipes to be run
        chef.run_list = ["role[base]", "role[ruby_dev]", "role[database]", "recipe[development::git_repo]", "role[python_dev]"]

        # parameters while running specific recipes. 'users' is for homesick
        chef.json = {
        :users => ['vagrant'],
        :rvm => {
            :user_installs => [
                {   :user => 'vagrant',
                    :default_ruby => '2.0.0'
                }
            ]
        },
        :mysql => {
            :server_root_password => 'password',
            :server_debian_password => 'password',
            :server_repl_password => 'password'
        }
    }
  end
end
