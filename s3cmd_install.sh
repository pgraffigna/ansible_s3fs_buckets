#!/bin/bash
# Script para instalar s3cmd en Ubuntu 22.04
#
# Autor: Pablo Graffigna
# URL: www.linkedin.com/in/pablo-graffigna
#
# Colores
VERDE="\e[0;32m\033[1m"
ROJO="\e[0;31m\033[1m"
AMARILLO="\e[0;33m\033[1m"
FIN="\033[0m\e[0m"

# Variables
S3CMD_VER="2.4.0"
S3CMD_URL="https://github.com/s3tools/s3cmd/releases/download/v${S3CMD_VER}/s3cmd-${S3CMD_VER}.zip"
S3CMD_ZIP="s3cmd-${S3CMD_VER}.zip"
S3CMD_CONFIG=s3cfg_config
ACCESS_KEY=XXXXXXXXXXXXXXX
SECRET_KEY=XXXXXXXXXXXXXXX

# Ctrl-C
trap ctrl_c INT
function ctrl_c(){
	echo "\n[S3CMD] === Programa Terminado por el usuario ==="
	exit 0
}

instalar_dependencias(){
	echo "[S3CMD] === Instalando dependencias ==="
	sudo apt-get update && sudo apt-get install -y python3-setuptools
}

instalar_s3cmd(){
	echo "[S3CMD] === Descargando s3cmd ==="
	wget -q "${S3CMD_URL}" -O /tmp/"${S3CMD_ZIP}"

	echo "[S3CMD] === Descomprimo s3cmd ==="
	sudo unzip /tmp/"${S3CMD_ZIP}" -d /opt

	echo "[S3CMD] === Instalando s3cmd ==="
	cd /opt/s3cmd-"${S3CMD_VER}" && sudo python3 setup.py install
}

configurar_s3cmd(){
	echo "[S3CMD] === Creando archivo de configuración en /opt/${S3CMD_CONFIG} ==="
	sudo tee /opt/"${S3CMD_CONFIG}" >/dev/null <<EOF
	[default]
	access_key = "${ACCESS_KEY}"
	secret_key = "${SECRET_KEY}"
	enable_multipart = True
	multipart_chunk_size_mb = 100
	use_https = True
	host_base = s3.host.com.ar
	host_bucket = s3.host.com.ar
	cloudfront_host = host.com.ar
	simpledb_host = sdb.host.com.ar
	website_endpoint = http://%(bucket)s.s3-website-%(location)s.host.com.ar/
EOF
}

# funciones
instalar_dependencias
instalar_s3cmd
configurar_s3cmd

echo "[S3CMD] === Todos los procesos terminaron correctamente ==="