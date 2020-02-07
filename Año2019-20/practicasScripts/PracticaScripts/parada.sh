#!/bin/bash
# Cargando las variables de Oracle
source /home/alumno/Documents/PracticaScripts/variables.sh

lsnrctl stop
sqlplus / as sysdba << EOF
shutdown immediate
exit
EOF
clear