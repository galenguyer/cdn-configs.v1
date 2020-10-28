#!/usr/bin/env bash
source ./.utils.sh

DATE="$(date +%Y-%m-%d)"

# create folder for logs
mkdir -p "logs/nginx/$DATE"

for HOST in `cat hostnames`
do
	info "running on $HOST"
	ssh -qt "$HOST" 'cat /var/log/nginx/access.log' > "logs/nginx/$DATE/$HOST.log"
	ssh -qt "$HOST" 'cat /var/log/nginx/access.json' > "logs/nginx/$DATE/$HOST.json"
	ok "retrieved logs from $HOST"
done
