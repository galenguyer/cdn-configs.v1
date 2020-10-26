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

