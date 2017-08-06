#!/bin/bash
	
# parse args
	
if [ $# -lt 2 ] ; then
	echo "usage: $0 <target-server> <login-server> [local port (default: 18888)] [target port (default: 8888)] [login port (default: rand)]" >&2
	exit 1
fi

target=$1
login=$2
if [ $# -lt 3 ] ; then port_local=18888 ; else port_local=$3 ; fi
if [ $# -lt 4 ] ; then port_target=8888 ; else port_target=$4 ; fi
if [ $# -lt 5 ] ; then port_login=$((30000+RANDOM%29999)) ; else port_login=$5 ; fi

echo "if there is an existing process, try \$release-local-port $port_local"
	
echo "local:$port_local <--> $login:$port_login <--> $target:$port_target"

caffeinate \
	ssh -L "${port_local}:localhost:${port_login}" -t $login \
		ssh -L "${port_login}:localhost:${port_target}" $target

