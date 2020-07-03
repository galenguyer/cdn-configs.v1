for HOST in `cat hostnames`
do
	ssh "$HOST" mkdir -p /var/www/cdn.galenguyer.com/
	rsync -avz --delete -e ssh /data/nginx/cdn/ "$HOST":/var/www/cdn.galenguyer.com/
        ssh "$HOST" chown www-data:www-data /var/www -R
done
