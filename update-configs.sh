for HOST in `cat hostnames`
do
	echo running on $HOST
	ssh -t "$HOST" mkdir -p /etc/{nginx/myipis}
	rsync -avz --delete -e ssh ./nginx/ "$HOST":/etc/nginx/
	rsync -avz --delete -e ssh ./myipis/ "$HOST":/etc/myipis/
        ssh -t "$HOST" 'systemctl restart nginx'
done
