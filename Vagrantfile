# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

required_plugins = %w( vagrant-berkshelf vagrant-omnibus omnibus vagrant-vbguest )
required_plugins.each do |plugin|
  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.hostname = 'my-stack-berkshelf'

  # Set the version of chef to install using the vagrant-omnibus plugin
  # NOTE: You will need to install the vagrant-omnibus plugin:
  #
  #   $ vagrant plugin install vagrant-omnibus
  #
  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = '11.18.6'
  end

  # Every Vagrant virtual environment requires a box to build off of.
  # If this value is a shorthand to a box in Vagrant Cloud then
  # config.vm.box_url doesn't need to be specified.
  config.vm.box = 'chef/ubuntu-14.04'

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  # config.vm.network :private_network, type: 'dhcp'

  # These get tweaked often
  # config.vm.network :forwarded_port, guest: 3000, host: 3000
  # config.vm.network :forwarded_port, guest: 5000, host: 5000
  # config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.network :forwarded_port, guest: 5050, host: 5050

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.

  # Note: these are the default rsync options: 
  # ["--verbose", "--archive", "--delete", "-z", "--copy-links"].

  # Canvas Services`
  config.vm.synced_folder "../canvas-org/gromit", "/srv/gromit",
                          type:        "rsync", 
                          rsync__args: ["--verbose", "--archive", "--delete", "-z"], 
                          rsync__auto: false
  config.vm.synced_folder "../canvas-org/productivity", "/srv/productivity", 
                          type: "rsync"
  config.vm.synced_folder "../canvas-org/growbag/shared", "/srv/gromit/repo/shared", 
                          type: "rsync"
  config.vm.synced_folder "../canvas-org/wallace", "/srv/wallace", 
                          type: "rsync", 
                          rsync__args: ["--verbose", "--archive", "--delete", "-z"], 
                          rsync__auto: false
  # config.vm.synced_folder "../skeuos-hermes", "/srv/skeuos", 
  #                        type: "rsync"

  # Canvas Applications
  config.vm.synced_folder "../canvas-applications", "/srv/gromit/repo/projects", type: "rsync"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #  vb.customize ["modifyvm", :id, "--memory", "2048`"]
  end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # The path to the Berksfile to use with Vagrant Berkshelf
  # config.berkshelf.berksfile_path = "./Berksfile"

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []


  config.vm.provision :chef_solo do |chef|
    chef.json = {
      'rbenv' => {
        'user_installs' => [{
          'user'   => "vagrant",
          'rubies' => ["2.1.5"],
          'global' => "2.1.5",
          'gems'   => {
            '2.1.5' => [
              { 'name' => 'bundler' }
            ]
          }
        }]
      },
      anaconda: {
        version: '2.1.0',
        flavor: 'x86_64',
        accept_license: 'yes',
        installer: {
          '2.1.0' => {
            'x86_64' => '191fbf290747614929d0bdd576e330c944b22a67585d1c185e0d2b3a3e65e1c0'
          }
        } 
      },
      "java" => {
        "install_flavor" => "openjdk",
        "jdk_version" => "7"
      }
    }

    chef.run_list = [
      'recipe[my-stack::default]'
    ]
  end
end


