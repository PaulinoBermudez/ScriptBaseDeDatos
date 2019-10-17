#!/bin/sh  
# Accedemos al directorio donde crear el directorio
cd /home/alumno
# Creamos el directorio del tablespace
mkdir datos/carreras  
# Creamos el tablespace en sqlplus  
sqlplus / as sysdba<<EOF 
create tablespace carreras  
datafile '/home/alumno/datos/carreras/carreras.dbf'  
size 800k                
autoextend on                  
next 200k 
maxsize 100M;   
exit      
EOF 
