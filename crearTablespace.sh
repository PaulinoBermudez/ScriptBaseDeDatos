#!/bin/sh

# Accedemos al directorio donde crear el directorio
cd /home/alumno
# Creamos el directorio del tablespace
mkdir tablespace

# Creamos el tablespace en sqlplus
sqlplus / as sysdba<<EOF
create tablespace MITABLESPACE
datafile '/home/alumno/tablespace/MIFICHERO.dbf'
size 800k
autoextend on
next 200k
maxsize 1400k;
exit
EOF

