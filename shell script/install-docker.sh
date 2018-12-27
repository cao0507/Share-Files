#!/bin/bash

# @Author: WooOh
# @Date:   2018-12-26 21:26:41
# @Last Modified time: 2018-12-27 13:47:53
# @Email: cao130507@163.com


set -x
set -e

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common


curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
    "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu \
    $(lsb_release -cs) \
    stable"


sudo apt-get update

sudo apt-get install docker-ce -y

sudo usermod -aG docker $USER

#sudo cat > /etc/docker/daemon.json <<EOF
#{
#  "registry-mirrors": [
#    "https://registry.docker-cn.com"
#  ]
#}
#EOF

echo '{
  "registry-mirrors": [
    "https://registry.docker-cn.com"
  ]
}' | sudo tee /etc/docker/test.json

#sudo sh -c 'echo "{
#  \"registry-mirrors\": [
#    \"https://registry.docker-cn.com\"
#  ]
#}"  > /etc/docker/test.json'

sudo systemctl daemon-reload
sudo systemctl restart docker