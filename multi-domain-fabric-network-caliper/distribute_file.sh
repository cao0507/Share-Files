#!/bin/bash

#set -x
remote_hosts=(
192.168.1.130
192.168.1.188
192.168.1.186
192.168.1.193
192.168.1.112
)

for ip in ${remote_hosts[@]}
do
    scp mychannel.tx user1@$ip:/home/user1/caliper/network/fabric/simplenetwork
    scp twoorgs.genesis.block user1@$ip:/home/user1/caliper/network/fabric/simplenetwork
    scp -r crypto-config user1@$ip:/home/user1/caliper/network/fabric/simplenetwork > /dev/null
done
