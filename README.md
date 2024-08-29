# ansible_s3fs_buckets

Ansible rol para gestionar s3fs/s3cmd.

Testeado con qemu + ubuntu 20.04 + ansible_2.10

----

### Descripción

La idea del proyecto es automatizar vía ansible la instalación/configuración de [s3cmd](https://s3tools.org/s3cmd), [s3fs](https://github.com/s3fs-fuse/s3fs-fuse) para pruebas de laboratorio, el repo cuenta con 2 roles:

1. s3cmd
2. s3fs

### Dependencias

* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html)
* [Vagrant](https://developer.hashicorp.com/vagrant/install) (opcional)

### Uso

```
git clone https://github.com/pgraffigna/ansible_s3fs_buckets.git
cd ansible_s3fs_buckets
ansible-playbook main.yml
```

### Extras
* Archivo de configuración (Vagrantfile) para desplegar una VM descartable con ubuntu-22.04 con libvirt como hipervisor.
* script en bash para instalar s3cmd
* notas sobre uso de s3fs

### Uso Vagrant (opcional)
```
vagrant up
vagrant ssh
```