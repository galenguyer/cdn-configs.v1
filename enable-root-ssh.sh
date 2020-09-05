for HOST in `cat hostnames`
do
	echo running on $HOST
	ssh -t chef@"$HOST" 'sudo mkdir -pv /root/.ssh && sudo cp -v ~chef/.ssh/authorized_keys /root/.ssh/authorized_keys'
done
