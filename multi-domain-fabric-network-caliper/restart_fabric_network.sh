#!/usr/bin/expect

#set -x
set timeout 20

spawn ssh 192.168.1.130
expect "user1@orderer" 
send "./caliper/network/fabric/simplenetwork/restart_orderer.sh\r"
expect "user1@oderer" 
send "exit\r"
expect eof

spawn ssh 192.168.1.188
expect "user1@peer" 
send "./caliper/network/fabric/simplenetwork/restart_peer.sh\r"
expect "user1@peer" 
send "exit\r"
expect eof

spawn ssh 192.168.1.186
expect "user1@peer" 
send "./caliper/network/fabric/simplenetwork/restart_peer.sh\r"
expect "user1@peer" 
send "exit\r"
expect eof

spawn ssh 192.168.1.193
expect "user1@peer" 
send "./caliper/network/fabric/simplenetwork/restart_peer.sh\r"
expect "user1@peer" 
send "exit\r"
expect eof

spawn ssh 192.168.1.112
expect "user1@peer" 
send "./caliper/network/fabric/simplenetwork/restart_peer.sh\r"
expect "user1@peer" 
send "exit\r"
expect eof

