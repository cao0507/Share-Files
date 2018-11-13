#!/bin/bash

benchmark=("simple" "smallbank")
batch_time=(1 2 3)
block_size=(100 150 200 250 300 500)
endorsement_policy=("1-of" "2-of")

#benchmark=("smallbank")
#batch_time=(2)
#block_size=(300)
#endorsement_policy=("1-of")

for bm in ${benchmark[@]}
do
    for bt in ${batch_time[@]}
    do
        for bs in ${block_size[@]}
        do
            for ep in ${endorsement_policy[@]}
            do
                cd ~/caliper/network/fabric/simplenetwork
                ./run.sh $bm $bt $bs $ep
            done
        done
    done
done
