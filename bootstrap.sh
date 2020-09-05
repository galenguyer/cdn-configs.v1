#!/bin/bash
figlet "Updating Packages"
sleep 2
./update-packages.sh
figlet "Syncing CDN files"
sleep 2
./force-sync-cdn.sh
figlet "Syncing Homepage files"
sleep 2
./sync-homepage.sh
figlet "Updating Certificates"
sleep 2
./update-certs.sh
figlet "Updating Config files"
sleep 2
./update-configs.sh
