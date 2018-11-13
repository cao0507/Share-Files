#!/usr/bin/expect

#set -x
set timeout 5

spawn ssh 192.168.1.130
expect "user1@orderer" 
send "rm -r ~/caliper/network/fabric/simplenetwork/crypto-config\r"
expect "user1@oderer" 
send "exit\r"
expect eof

spawn ssh 192.168.1.188
expect "user1@peer" 
send "rm -r ~/caliper/network/fabric/simplenetwork/crypto-config\r"
expect "user1@peer" 
send "exit\r"
expect eof

spawn ssh 192.168.1.186
expect "user1@peer" 
send "rm -r ~/caliper/network/fabric/simplenetwork/crypto-config\r"
expect "user1@peer" 
send "exit\r"
expect eof

spawn ssh 192.168.1.193
expect "user1@peer" 
send "rm -r ~/caliper/network/fabric/simplenetwork/crypto-config\r"
expect "user1@peer" 
send "exit\r"
expect eof

spawn ssh 192.168.1.112
expect "user1@peer" 
send "rm -r ~/caliper/network/fabric/simplenetwork/crypto-config\r"
expect "user1@peer" 
send "exit\r"
expect eof

