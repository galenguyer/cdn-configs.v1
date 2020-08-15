#!/bin/bash
for HOST in `cat hostnames`
do
    echo running on $HOST
    ssh -t $HOST bash -c "'
        rm -rf /var/cache/snapd/
        apt-get autoremove --purge snapd gnome-software-plugin-snap update-notifier update-manager -y  -qq
        curl -sSL https://packages.galenguyer.com/bootstrap.sh | sh
        apt-get install edgeinx-mainline-quiche rsync inotify-tools -y -qq
        apt-get upgrade -y -qq
        cd /tmp
        wget https://blog.jmdawson.co.uk/persist_0.3_all.deb --no-check-certificate
        dpkg -i persist_0.3_all.deb
        systemctl enable persist
    '"
done
