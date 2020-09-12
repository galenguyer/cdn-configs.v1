for HOST in `cat hostnames`
do
	ssh "$HOST" mkdir -p /var/www/cdn.galenguyer.com/
	rsync -avz --delete -e ssh /var/www/cdn.galenguyer.com/ "$HOST":/var/www/cdn.galenguyer.com/
        ssh "$HOST" chown www-data:www-data /var/www -R
done
