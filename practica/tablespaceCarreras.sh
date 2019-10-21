#!/bin/sh  
# Accedemos al directorio donde crear el directorio
cd /home/alumno
# Creamos el directorio del tablespace
mkdir datos/carreras  
# Creamos el tablespace en sqlplus con SYS.
sqlplus / as sysdba<<EOF 
create tablespace carreras  
datafile '/home/alumno/datos/carreras/carreras.dbf'  
size 800k                
autoextend on                  
next 200k 
maxsize 100M;   
exit      
EOF 
# Lanzamos el script de carreras de SQL con BERMUDEZ Modificado para que almacene las tablas en el TABLESPACE CARRERAS.
sqlplus BERMUDEZ/BERMUDEZ51@10.1.35.51/asir @/home/alumno/carreras-coches.sql
exit
