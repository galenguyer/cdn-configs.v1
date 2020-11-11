#!/usr/bin/env bash
source ./.utils.sh

for HOST in `cat hostnames`
do
    info "running on $HOST"
    ssh -t $HOST bash -c "'
	apt-get update
	apt-get install gnupg2 rsync apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
	echo deb [arch=amd64] https://download.docker.com/linux/debian buster stable | sudo tee /etc/apt/sources.list.d/docker-ce.list
        curl -sSL https://packages.galenguyer.com/bootstrap.sh | sh
        apt-get install edgeinx-mainline-quiche docker-ce docker-ce-cli containerd.io -y
        apt-get upgrade -y
	sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
    '"
done
