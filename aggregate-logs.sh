DATE="$(date +%Y-%m-%d)"

# create folder for logs
mkdir -p "logs/nginx/$DATE"

for HOST in `cat hostnames`
do
	echo running on $HOST
	ssh -t "$HOST" 'cat /var/log/nginx/access.log' > "logs/nginx/$DATE/$HOST.log"
	ssh -t "$HOST" 'cat /var/log/nginx/access.json' > "logs/nginx/$DATE/$HOST.json"
done
