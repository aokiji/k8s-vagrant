Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.4"

  config.vm.provision :shell, path: './provision.sh'

  config.vm.provider "virtualbox" do |v|
    v.memory = 1600
  end

  (1..3).each do |i|
    # provision
    config.vm.define "node#{i}" do |node|
      # network
      node.vm.network "private_network", ip: "192.168.33.#{10 + i}"
      node.vm.hostname = "node#{i}"
    end
  end
end
