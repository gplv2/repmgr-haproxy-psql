# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # DB1
  config.vm.define "db1" do |db|
    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://atlas.hashicorp.com/search.
    db.vm.box = "generic/rhel7"

    # Configure Local Variable To Access Scripts From Remote Location
    scriptDir = File.dirname(__FILE__)
    localscriptDir = "/home/vagrant/scripts"
    dbUser = "postgres"
    dbName = "cluster"

    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # db.vm.box_check_update = false

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # db.vm.network "forwarded_port", guest: 6432, host: 5432

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    # db.vm.network "private_network", ip: "192.168.33.10"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    db.vm.network "public_network"

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # db.vm.synced_folder "../data", "/vagrant_data"
    db.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", 2048 ]
      v.customize ["modifyvm", :id, "--cpus", 2 ]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
    end

#    db.vm.provision "fix-no-tty", type: "shell" do |s|
#      s.privileged = false
#      s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
#    end

    # apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
#    db.vm.provision "shell", :inline => 'DEBIAN_FRONTEND=noninteractive apt-get update --fix-missing -y -q -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'
#    db.vm.provision "shell", :inline => 'DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -q -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'

    db.vm.provision "file", source: "scripts", destination: "/home/vagrant/"

    #db.vm.provision "shell", :inline => "apt-get -o 'Dpkg::Options::=--force-confnew' -f install"
    db.vm.provision "shell", :inline => localscriptDir + "/upgrade.sh"

    #db.vm.provision "shell", :inline => "exit 1"

    db.vm.provision "shell" do |s|
      s.name = "Installing vagrant bootstrap"
      s.inline = localscriptDir + "/install_db.sh"
    end

    db.vm.provision "shell" do |s|
      s.name = "Restarting postgres"
      s.inline = "sudo service postgresql restart"
    end

    db.vm.provision "shell" do |s|
      s.name = "Creating Postgres Database"
      s.inline = localscriptDir + "/create-postgres.sh " + dbName + " " + dbUser
    end


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
    # config.vm.provision "shell", inline: <<-SHELL
    #   apt-get update
    #   apt-get install -y apache2
    # SHELL
  end

  # DB2
  config.vm.define "db2" do |db|
    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://atlas.hashicorp.com/search.
    db.vm.box = "generic/rhel7"

    # Configure Local Variable To Access Scripts From Remote Location
    scriptDir = File.dirname(__FILE__)
    localscriptDir = "/home/vagrant/scripts"
    dbUser = "postgres"
    dbName = "cluster"

    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # db.vm.box_check_update = false

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # db.vm.network "forwarded_port", guest: 6432, host: 5432

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    # db.vm.network "private_network", ip: "192.168.33.10"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    db.vm.network "public_network"

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # db.vm.synced_folder "../data", "/vagrant_data"
    db.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", 2048 ]
      v.customize ["modifyvm", :id, "--cpus", 2 ]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
    end

 #   db.vm.provision "fix-no-tty", type: "shell" do |s|
 #     s.privileged = false
 #     s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
 #   end

    # apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
#    db.vm.provision "shell", :inline => 'DEBIAN_FRONTEND=noninteractive apt-get update --fix-missing -y -q -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'
#    db.vm.provision "shell", :inline => 'DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -q -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'

    db.vm.provision "file", source: "scripts", destination: "/home/vagrant/"

    #db.vm.provision "shell", :inline => "apt-get -o 'Dpkg::Options::=--force-confnew' -f install"
    db.vm.provision "shell", :inline => localscriptDir + "/upgrade.sh"

    #db.vm.provision "shell", :inline => "exit 1"

    db.vm.provision "shell" do |s|
      s.name = "Creating Postgres Database"
      s.inline = localscriptDir + "/create-postgres.sh " + dbName + " " + dbUser
    end

    db.vm.provision "shell" do |s|
      s.name = "Installing vagrant bootstrap"
      s.inline = localscriptDir + "/install_db.sh"
    end

    db.vm.provision "shell" do |s|
      s.name = "Restarting postgres"
      s.inline = "sudo service postgresql restart"
    end

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
    # config.vm.provision "shell", inline: <<-SHELL
    #   apt-get update
    #   apt-get install -y apache2
    # SHELL
  end

  # balancers
  # HAPROXY 1
  config.vm.define "haproxy1" do |haproxy|
    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://atlas.hashicorp.com/search.
    haproxy.vm.box = "ubuntu/trusty64"

    # Configure Local Variable To Access Scripts From Remote Location
    scriptDir = File.dirname(__FILE__)
    localscriptDir = "/home/vagrant/scripts"
    dbUser = "postgres"
    dbName = "cluster"

    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # haproxy.vm.box_check_update = false

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # haproxy.vm.network "forwarded_port", guest: 6432, host: 5432

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    # haproxy.vm.network "private_network", ip: "192.168.33.10"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    haproxy.vm.network "public_network"

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # haproxy.vm.synced_folder "../data", "/vagrant_data"
    haproxy.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", 2048 ]
      v.customize ["modifyvm", :id, "--cpus", 2 ]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
    end

#    haproxy.vm.provision "fix-no-tty", type: "shell" do |s|
#      s.privileged = false
#      s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
#    end

    # apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
#    haproxy.vm.provision "shell", :inline => 'DEBIAN_FRONTEND=noninteractive apt-get update --fix-missing -y -q -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'
#    haproxy.vm.provision "shell", :inline => 'DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -q -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'

    haproxy.vm.provision "file", source: "scripts", destination: "/home/vagrant/"

    #haproxy.vm.provision "shell", :inline => "apt-get -o 'Dpkg::Options::=--force-confnew' -f install"
    haproxy.vm.provision "shell", :inline => localscriptDir + "/upgrade.sh"

    #haproxy.vm.provision "shell", :inline => "exit 1"

    #haproxy.vm.provision "shell" do |s|
    #s.name = "Creating Postgres Database"
    #s.inline = localscriptDir + "/create-postgres.sh " + dbName + " " + dbUser
    #end

    haproxy.vm.provision "shell" do |s|
      s.name = "Installing vagrant bootstrap"
      s.inline = localscriptDir + "/install_haproxy.sh"
    end

    haproxy.vm.provision "shell" do |s|
      s.name = "Restarting Haproxy"
      s.inline = "sudo service haproxy restart"
    end

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
    # config.vm.provision "shell", inline: <<-SHELL
    #   apt-get update
    #   apt-get install -y apache2
    # SHELL
  end

  # HAPROXY 2
  config.vm.define "haproxy2" do |haproxy|
    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://atlas.hashicorp.com/search.
    haproxy.vm.box = "ubuntu/trusty64"

    # Configure Local Variable To Access Scripts From Remote Location
    scriptDir = File.dirname(__FILE__)
    localscriptDir = "/home/vagrant/scripts"
    dbUser = "postgres"
    dbName = "cluster"

    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # haproxy.vm.box_check_update = false

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # haproxy.vm.network "forwarded_port", guest: 6432, host: 5432

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    # haproxy.vm.network "private_network", ip: "192.168.33.10"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    haproxy.vm.network "public_network"

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # haproxy.vm.synced_folder "../data", "/vagrant_data"
    haproxy.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", 2048 ]
      v.customize ["modifyvm", :id, "--cpus", 2 ]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
    end

#    haproxy.vm.provision "fix-no-tty", type: "shell" do |s|
#      s.privileged = false
#      s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
#    end

    # apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
#    haproxy.vm.provision "shell", :inline => 'DEBIAN_FRONTEND=noninteractive apt-get update --fix-missing -y -q -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'
#    haproxy.vm.provision "shell", :inline => 'DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -q -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'

    haproxy.vm.provision "file", source: "scripts", destination: "/home/vagrant/"

    #haproxy.vm.provision "shell", :inline => "apt-get -o 'Dpkg::Options::=--force-confnew' -f install"
    haproxy.vm.provision "shell", :inline => localscriptDir + "/upgrade.sh"

    #haproxy.vm.provision "shell", :inline => "exit 1"

    #haproxy.vm.provision "shell" do |s|
    #s.name = "Creating Postgres Database"
    #s.inline = localscriptDir + "/create-postgres.sh " + dbName + " " + dbUser
    #end

    haproxy.vm.provision "shell" do |s|
      s.name = "Installing vagrant bootstrap"
      s.inline = localscriptDir + "/install_haproxy.sh"
    end

    haproxy.vm.provision "shell" do |s|
      s.name = "Restarting Haproxy"
      s.inline = "sudo service haproxy restart"
    end

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
    # config.vm.provision "shell", inline: <<-SHELL
    #   apt-get update
    #   apt-get install -y apache2
    # SHELL
  end
end
