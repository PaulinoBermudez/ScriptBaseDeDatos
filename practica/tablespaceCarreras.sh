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

alter user BERMUDEZ default tablespace carreras quota on unlimited;

exit      
<<<<<<< HEAD
EOF
=======#!/bin/sh  
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

alter user BERMUDEZ default tablespace carreras quota on unlimited;

exit      
<<<<<<< HEAD
EOF
=======
EOF 

EOF 
# Lanzamos el script de carreras de SQL con BERMUDEZ Modificado para que almacene las tablas en el TABLESPACE CARRERAS.
sqlplus BERMUDEZ/BERMUDEZ51@10.1.35.51/asir @/home/alumno/carreras-coches.sql
exit
>>>>>>> 62b494015636bd3bde21f146e1108b30ab1129ef
