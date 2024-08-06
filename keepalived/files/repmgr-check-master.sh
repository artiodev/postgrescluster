#!/bin/sh

COND=`su - postgres -c "/usr/pgsql-11/bin/repmgr node check --role" | grep primary`


if [[ "$COND" == *"primary"* ]]
then
 exit 0
else
 exit 1
fi