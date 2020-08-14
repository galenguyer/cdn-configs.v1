for HOST in `cat hostnames`
do
	echo running on $HOST
	ssh -t "$HOST" mkdir -p /etc/nginx/
	rsync -avz --delete -e ssh ./nginx/ "$HOST":/etc/nginx/
        ssh -t "$HOST" systemctl restart nginx
done
