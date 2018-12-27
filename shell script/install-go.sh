#!/bin/bash

# @Author: WooOh
# @Date:   2018-12-26 22:16:07
# @Last Modified time: 2018-12-27 13:47:22
# @Email: cao130507@163.com


set -x
set -e

wget https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz

sudo tar zxf go1.10.3.linux-amd64.tar.gz -C /usr/local/

mkdir ~/go

echo "export GOROOT=/usr/local/go
export GOPATH=/home/user1/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" > ~/.bashrc

source ~/.bashrc

mkdir ~/go/src
mkdir ~/go/bin
mkdir ~/go/pkg