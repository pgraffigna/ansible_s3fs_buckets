# s3fs
### instalando dependencias
```shell
sudo apt update && sudo apt install -y fuse automake build-essential libcurl4-openssl-dev libxml2-dev pkg-config libssl-dev libfuse-dev
```
# compilando s3fs
```shell
git clone https://github.com/s3fs-fuse/s3fs-fuse.git && cd s3fs-fuse
./autogen.sh
./configure
make
sudo make install
```
# creando archivo con creds
```shell
echo "access_key:secret_key" | sudo tee -a /etc/passwd-s3fs && sudo chmod 600 /etc/passwd-s3fs
```
# creando carpeta para el bucket
```shell
sudo mkdir /mnt/s3-test
```
# montando el bucket
```shell
s3fs bucket-15 /mnt/s3-test -o allow_other,uid=$(id -u www-data),gid=$(id -g www-data),umask=0022,passwd_file=/etc/passwd-s3fs,url=https://s3.host.com,use_path_request_style
```
# persistencia fstab
```shell
bucket-15 /mnt/s3-test fuse.s3fs _netdev,allow_other,uid=UID,gid=GID,umask=0022,use_path_request_style,passwd_file=/etc/passwd-s3fs,url=https://s3.host.com/ 0 0
```