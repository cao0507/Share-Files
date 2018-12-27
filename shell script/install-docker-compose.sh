#!/bin/bash

# @Author: WooOh
# @Date:   2018-12-26 22:10:44
# @Last Modified time: 2018-12-27 13:47:55
# @Email: cao130507@163.com


set -x
set -e

sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose