# -*- mode: ruby -*-
# vi: set ft=ruby :

$puppetmaster = <<PUPPETMASTER
sudo yum -y install https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
sudo yum -y install http://yum.theforeman.org/releases/latest/el6/x86_64/foreman-release.rpm
sudo yum -y install rhscl-ruby193-epel-6-x86_64.noarch
sudo yum -y install puppet-server
sudo yum -y install foreman-installer
sudo yum -y install foreman
PUPPETMASTER

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.define "master" do |master|
    master.vm.box = "chef/centos-6.6"
    master.vm.hostname = "puppetmaster.domandlinda.ca"
    master.vm.network "public_network", ip: "10.25.14.180", bridge: "enp0s20f0"
    master.vm.provision "shell",
      inline: $puppetmaster
    master.vm.provision "puppet" do |puppet|
      puppet.synced_folder_type = "rsync"
    end
  end

  config.vm.define "slave" do |slave|
    slave.vm.box = "chef/centos-6.6"
  end

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  # config.vm.box = "chef/centos-6.6"
  #  config.vm.box_download_insecure = true
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline <<-SHELL
  #   sudo apt-get install apache2
  # SHELL
end
