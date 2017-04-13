Vagrant.configure("2") do |config|
  config.vm.define :salt_master do |master_config|
    master_config.vm.box = "bento/ubuntu-16.04"
    master_config.vm.host_name = "master-dev"
    master_config.vm.provision :salt do |salt|
      salt.install_master = true
      salt.no_minion = false
      salt.verbose = "true"
    end
    master_config.vm.network "private_network", ip: "192.168.30.10"
    master_config.vm.synced_folder "states", "/srv/salt"
  end
  config.vm.define :nginx_server_ubuntu do |ubuntu_nginx|
     ubuntu_nginx.vm.box = "bento/ubuntu-16.04"
     ubuntu_nginx.vm.host_name = "ubuntu-nginx"
     ubuntu_nginx.vm.provision :salt do |salt|
       salt.install_master = false
       salt.minion_config = "config/minion"
     end
    ubuntu_nginx.vm.network "private_network", ip: "192.168.30.11"
    ubuntu_nginx.vm.network "forwarded_port", guest: 80, host: 8080
    ubuntu_nginx.vm.network "forwarded_port", guest: 443, host: 8443
  end
end
