for HOST in `cat hostnames`
do
	echo running on $HOST
	ssh -t "$HOST" 'cd /etc/myipis/ && docker-compose pull && docker-compose down && docker-compose up -d'
done
