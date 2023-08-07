ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'
IMAGEN = "generic/ubuntu2004"
HOSTNAME = "s3-testing"

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/home/vagrant", type: "rsync", disabled: true

  config.vm.define :server do |s|
    s.vm.box = IMAGEN
    s.vm.hostname = HOSTNAME

    s.vm.provider :libvirt do |v|
      v.memory = 1024
      v.cpus = 2
      v.graphics_type = "none"
    end
  end
end