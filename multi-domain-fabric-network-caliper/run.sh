#!/bin/bash

#set -x

bench=$1
BATCH_TIME=$2
BLOCK_SIZE=$3
ENDORSEMENT_POLICY=$4

#CURRENT_DIR=$PWD

sed -i 's+\(BatchTimeout: \).*+\1'"$BATCH_TIME"'s+g' configtx.yaml
sed -i 's+\(MaxMessageCount: \).*+\1'"$BLOCK_SIZE"'+g' configtx.yaml

echo
echo "#Step 1# Remove the crypto-config files in the remote nodes"
echo "Waiting......"
./rm_remote_crypto-config.sh >/dev/null

echo
echo "#Step 2# Generate the crypto-config files"
echo "Waiting......"
./generate.sh

echo
echo "#Step 3# Distribute the crypto-config files to the fabric nodes"
echo "Waiting......"
./distribute_file.sh >/dev/null

echo
echo "#Step 4# Restart the fabric nework"
echo "Waiting......"
./restart_fabric_network.sh >/dev/null

#if [ $bench -eq 1 ]; then
#    cd ~/caliper/benchmark/simple
#else
#    cd ~/caliper/benchmark/smallbank
#fi

cd ~/caliper/benchmark/${bench}
pwd

Description="batch_time=${BATCH_TIME}s, block_size=$BLOCK_SIZE, endorsement_policy=\'$ENDORSEMENT_POLICY\' {Org1.member, Org2.member}"
sed -i 's+\("description" : "\).*+\1'"$Description"'",+g' config.json
sed -i 's/.-of/'"$ENDORSEMENT_POLICY"'/g' fabric-multi-host.json

echo
node main.js

sleep 5

report_file="${bench}+${BATCH_TIME}s_batch_time+${BLOCK_SIZE}_block_size+${ENDORSEMENT_POLICY}"

mv report* ${report_file}.html

