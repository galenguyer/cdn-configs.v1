#!/bin/bash
for HOST in `cat hostnames`
do
    echo running on $HOST
    ssh -t $HOST bash -c "'
        curl -sSL https://packages.galenguyer.com/bootstrap.sh | sh
        apt install edgeinx-mainline-quiche -y
        apt upgrade -y
    '"
done
