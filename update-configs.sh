for HOST in `cat hostnames`
do
	echo running on $HOST
	ssh -t "$HOST" mkdir -p /etc/{nginx,persist}
	rsync -avz --delete -e ssh ./nginx/ "$HOST":/etc/nginx/
	rsync -avz --delete -e ssh ./persist/ "$HOST":/etc/persist/
        ssh -t "$HOST" 'systemctl enable persist; systemctl restart nginx; systemctl restart persist'
done
