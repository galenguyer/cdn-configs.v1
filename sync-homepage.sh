for HOST in `cat hostnames`
do
	ssh "$HOST" mkdir -p /var/www/galenguyer.com/
	rsync -avz --delete -e ssh /root/galenguyer.github.io/_site/ "$HOST":/var/www/galenguyer.com/
        ssh "$HOST" chown www-data:www-data /var/www -R
done
