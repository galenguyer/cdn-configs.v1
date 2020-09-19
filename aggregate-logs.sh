# equivalent to set -Eeu -o pipefail
set -o errexit -o errtrace -o nounset -o pipefail

function error {
	echo "[$(tput setaf 1)X$(tput setaf 7)] $*"
}
function ok {
	echo "[$(tput setaf 2)+$(tput setaf 7)] $*"
}
function info {
	echo "[$(tput setaf 4)i$(tput setaf 7)] $*"
}
function cleanup {
        tput setaf 7
}
trap cleanup EXIT
function onerr {
	error "$(caller): ${BASH_COMMAND}"
}
trap onerr ERR

DATE="$(date +%Y-%m-%d)"

# create folder for logs
mkdir -p "logs/nginx/$DATE"

for HOST in `cat hostnames`
do
	info "running on $HOST"
	ssh -qt "$HOST" 'cat /var/log/nginx/access.log' > "logs/nginx/$DATE/$HOST.log"
	ssh -qt "$HOST" 'cat /var/log/nginx/access.json' > "logs/nginx/$DATE/$HOST.json"
	ok "retrieved logs from $HOST"
done
