#!/bin/bash

# Cargando las variables de Oracle
source /home/alumno/Documents/PracticaScripts/variables.sh

sqlplus / as sysdba <<EOF
startup open
exit
EOF
lsnrctl start
echo "Listener arrancado!"
sleep 3
clear