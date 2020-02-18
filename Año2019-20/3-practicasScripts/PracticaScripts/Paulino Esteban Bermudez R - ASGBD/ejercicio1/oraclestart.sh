#!/bin/bash

source variables.sh
	lsnrctl start
	sqlplus / as sysdba << EOF
		startup open;
		exit;
EOF
