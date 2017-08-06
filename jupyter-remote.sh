#!/bin/bash
	
# parse args
	
if [ $# -lt 2 ] ; then
	echo "usage: $0 <target-server> [local port (default: 18888)] [target port (default: 8888)]" >&2
	exit 1
fi

target=$1
if [ $# -lt 2 ] ; then port_local=18888 ; else port_local=$3 ; fi
if [ $# -lt 3 ] ; then port_target=8888 ; else port_target=$4 ; fi

echo "if there is an existing process, try \$release-local-port $port_local"
	
echo "local:$port_local <--> $target:$port_target"

caffeinate \
	ssh -L "${port_local}:localhost:${port_target}" $target

