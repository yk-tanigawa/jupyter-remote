#!/bin/bash

if [ $# -lt 1 ] ; then echo "usage: $0 port" >&2 ; exit 1; fi
port=$1
echo "sending KILL signal to the following pids..."
pids=$( lsof -i ":$port" | awk '{ if( NR>1 ){ print $2 } }'| sort | uniq )
echo $pids

if [ ! -z "$pids" ] ; then
	parallel kill -KILL {} ::: $( lsof -i ":$port" | awk '{ if( NR>1 ){ print $2 } }'| sort | uniq )
fi

