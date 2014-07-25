# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "trusty-server-cloudimg-amd64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.provision "shell", path: "shell/1-apt.sh"
  config.vm.provision "shell", path: "shell/2-ruby.sh"
  config.vm.provision "shell", path: "shell/3-chef.sh"

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "cookbooks"

    chef.add_recipe "postgresql::ruby"
  end

end
