for HOST in `cat hostnames`
do
	echo running on $HOST
	ssh -t "$HOST" 'reboot -i'
done
