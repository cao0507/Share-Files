#!/bin/bash

# @Author: WooOh
# @Date:   2018-12-26 22:37:07
# @Last Modified time: 2018-12-27 13:52:59
# @Email: cao130507@163.com


set -e 
set -x

#install shadowsocks
sudo apt install python-pip -y

sudo pip install shadowsocks

echo '{
    "server": "45.76.243.xxx",
    "server_port": 123,
    "password": "kb310v587!",
    "method": "aes-256-cfb",
    "timeout": 300
}' | sudo tee /etc/shadowsocks.json

sslocal -c /etc/shadowsocks.json &

#install privoxy
sudo apt install privoxy -y

sudo sed -i "s/localhost:8118/127.0.0.1:8118/g" /etc/privoxy/config

echo 'forward-socks5t / 127.0.0.1:1080 .' | sudo tee -a /etc/privoxy/config

sudo /etc/init.d/privoxy restart

echo 'export http_proxy=http://127.0.0.1:8118
export https_proxy=http://127.0.0.1:8118' | sudo tee -a /etc/profile

source /etc/profile