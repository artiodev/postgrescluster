#!/bin/sh

COND=`su - postgres -c "/usr/pgsql-11/bin/repmgr node check --role" | grep standby`
STATE=`cat /var/run/keepalive.INSTANCE.postgres.state  | grep MASTER`

if [[ "$COND" == *"standby"* ]] && [[ "$STATE" == *"MASTER"* ]]
then
 exit 1
else
 exit 0
fi