#!/bin/bash

#set -x
set -e

NetworkConfigFile="fabric-multi-host.json"

function removeArtifacts () {
    rm -r crypto-config
    rm mychannel.tx
    rm twoorgs.genesis.block
}

function replacePrivateKey () {
    CURRENT_DIR=$PWD
    cd $CURRENT_DIR/crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp/keystore
    PRIV_KEY1=$(ls *_sk)

    cd $CURRENT_DIR/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore
    PRIV_KEY2=$(ls *_sk)

    cd $CURRENT_DIR/../../../benchmark/simple
    sed -i 's+\(Admin@example.com/msp/keystore/\).*+\1'"$PRIV_KEY1"'",+g' $NetworkConfigFile
    sed -i 's+\(Admin@org1.example.com/msp/keystore/\).*+\1'"$PRIV_KEY2"'",+g' $NetworkConfigFile

    cd $CURRENT_DIR/../../../benchmark/smallbank
    sed -i 's+\(Admin@example.com/msp/keystore/\).*+\1'"$PRIV_KEY1"'",+g' $NetworkConfigFile
    sed -i 's+\(Admin@org1.example.com/msp/keystore/\).*+\1'"$PRIV_KEY2"'",+g' $NetworkConfigFile

   cd $CURRENT_DIR
}

function generateArtifacts () {
    ./bin/cryptogen generate --config=./crypto-config.yaml
    ./bin/configtxgen -profile TwoOrgsOrdererGenesis -outputBlock twoorgs.genesis.block
    ./bin/configtxgen -profile TwoOrgsChannel -outputCreateChannelTx mychannel.tx -channelID mychannel
}

# remove the old Aritfacts file first.
removeArtifacts

# generate the new Artifacts file.
generateArtifacts

# replace the PrivateKey in fabric-multi-host.json
replacePrivateKey
