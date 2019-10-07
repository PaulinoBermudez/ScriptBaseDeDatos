#!/bin/sh

sqlpus / as sysdba<<EOF
create tablespace MITABLESPACE 
datafile '/home/alumno/Documents/tablespaces/fichero.dbf'
size 100k
autoextend on
next 100k
maxsize 1000k;
exit
EOF
