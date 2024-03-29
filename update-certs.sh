#!/usr/bin/env bash

source ./.utils.sh

# install certbot-auto if not present
if ! command -v certbot-auto 2>&1 >/dev/null; then
	info "certbot not installed, installing now"
	sudo wget https://dl.eff.org/certbot-auto -O /usr/local/bin/certbot-auto
	sudo chmod a+x /usr/local/bin/certbot-auto
fi

# get star and root cert
sudo certbot-auto certonly \
	--server https://acme-v02.api.letsencrypt.org/directory \
	--manual \
	--preferred-challenges dns \
	-m certbot@galenguyer.com \
	--rsa-key-size 4096 \
	--agree-tos \
	-d 'galenguyer.com' \
	-d '*.galenguyer.com'

sudo certbot-auto certonly \
	--server https://acme-v02.api.letsencrypt.org/directory \
	--manual \
	--preferred-challenges dns \
	-m certbot@galenguyer.com \
	--rsa-key-size 4096 \
	--agree-tos \
	-d 'nyaa.gay' \
	-d '*.nyaa.gay'

# publish cert to all clients
for HOST in `cat hostnames`
do
	info "running on $HOST"
	ssh "$HOST" 'mkdir -p /etc/letsencrypt/'
	rsync -avz --delete -e ssh /etc/letsencrypt/ "$HOST":/etc/letsencrypt/
	ssh "$HOST" 'chown root:root /etc/letsencrypt/ -R'
	ok "done on $HOST"
done
