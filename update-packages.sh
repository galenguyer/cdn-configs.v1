#!/usr/bin/env bash
source ./.utils.sh

for HOST in `cat hostnames`
do
    info "running on $HOST"
    ssh -t $HOST bash -c "'
	apt-get update
	apt-get install gnupg2 rsync -y --no-install-recommends
        curl -sSL https://packages.galenguyer.com/bootstrap.sh | sh
        apt-get install edgeinx-mainline-quiche -y
        apt-get upgrade -y
    '"
done
