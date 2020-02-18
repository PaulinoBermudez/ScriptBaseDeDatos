#!/bin/bash

source variables.sh

echo "Oracle parando"
sqlplus / as sysdba << EOF
	shutdown immediate;
	exit;
EOF
lsnrctl stop
