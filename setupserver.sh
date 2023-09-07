#!/bin/bash

#instala pacotes básicos
sudo apt install -y git vim mlocate htop curl wget python3-pip figlet

#instala pfetch
git clone https://github.com/dylanaraps/pfetch.git
sudo install pfetch/pfetch /usr/local/bin/
ls -l /usr/local/bin/pfetch
cat .bashrc |grep "pfetch" 
var=`echo $?`
if [ "0" != $var ]; then
echo "pfetch" >> ~/.bashrc
fi
#instala docker
curl -fsSL "get.docker.com"| bash 
sudo sh -eux <<EOF
# Install newuidmap & newgidmap binaries
apt-get install -y uidmap
EOF
echo "Rode o comando a seguir com o seu usuário:"
echo "dockerd-rootless-setuptool.sh install"

#instala docker-compose
#pip install docker-compose
versao=`curl -sL https://api.github.com/repos/docker/compose/releases/latest | jq -r ".tag_name"`
x86_64=`curl -sL https://api.github.com/repos/docker/compose/releases/latest | jq -r ".assets[].browser_download_url" | grep docker-compose-linux-x86_64`
arm=`curl -sL https://api.github.com/repos/docker/compose/releases/latest | jq -r ".assets[].browser_download_url" | grep docker-compose-linux-armv7`

arch2=`uname -a | cut -f 12 -d " "`
if [ "aarch64" == $arch2 ]; then
sudo wget $arm -O /usr/local/bin/docker-compose
fi
if [ "x86_64" == $arch2 ]; then
sudo wget $x86_64 -O /usr/local/bin/docker-compose
fi
sudo chmod +x /usr/local/bin/docker-compose

#Instala ctop
arch=`uname -a | cut -f 12 -d " "`
if [ "aarch64" == $arch ]; then
sudo wget https://github.com/bcicen/ctop/releases/download/0.7.6/ctop-0.7.6-linux-arm64 -O /usr/local/bin/ctop
fi
if [ "x86_64" == $arch ]; then
sudo wget https://github.com/bcicen/ctop/releases/download/0.7.6/ctop-0.7.6-linux-amd64 -O /usr/local/bin/ctop
fi
sudo chmod +x /usr/local/bin/ctop
#Docker-compose bash auto-completion
curl https://raw.githubusercontent.com/hubkabel/git-bash-docker-auto-completion/master/install.sh | bash
. ~/.bashrc
