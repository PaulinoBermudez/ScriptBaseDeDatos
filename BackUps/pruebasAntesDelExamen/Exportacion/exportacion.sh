#!/bin/bash

# @Title: Guión para la exportación de datos de una base de datos remota.
#
# @Description:
# El siguiente script son pruebas para la preparación del examen de  ASGBD.
#
# Prueba 1. 
#
#
# -------------------------------- EXPORTACION DE DATOS.
# Los siguientes pasos que se seguiran en la ejecución del script son:
#
# - Creacion de un tablespace para el usuario de pruebas, NOMBRE DEL TABLESPACE: MITABLESPACE
cd /
mkdir mispruebas
drop tablespace MITABLESPACE;
create tablespace MITABLESPACE
datafile '/mispruebas/tablespacePreexamen.dbf'
size 100M;
# - Creación del usuario y asignación de tablespace por defecto para usuario: PREEXAMEN/PREEXAMEN
drop user PREEXAMEN cascade;
create user PREEXAMEN identified by PREEXAMEN
default tablespace MITABLESPACE
quota unlimited on MITABLESPACE;
# - Asignación de permisos y privilegios para el usuario creado
grant connect, resource to PREEXAMEN;
grant create any directory to PREEXAMEN;
grant exp_full_database to PREEXAMEN;
grant imp_full_database to PREEXAMEN;
# - Creación del directorio en el sistema operativo donde se almacenarán los datos exportados: MIDIR
create directory MIDIR as '/mispruebas/datos';
grant read,write on directory MIDIR to PREEXAMEN;
# - Carga de datos de prueba en un usario llamado PREEXAMEN 
sqlplus PREEXAMEN/PREEXAMEN@192.168.43.100/asir @/home/alumno/Documents/ScriptBaseDeDatos/BackUps/pruebasAntesDelExamen/Exportacion/*.sql
# - Exportación de los datos del usuario local (PREEXAMEN) en el directorio creado
expdp PREEXAMEN/PREEXAMEN@192.168.43.100/asir directory=MIDIR schemas=PREEXAMEN dumpfile=PREEXAMEN.dmp logfile=PREEXAMEN.log
# 
# Una vez creada la exportación de los datos del usuario local. Se copian los archivos en otro usuario remoto
# cuyo nombre e IP con:
# NOMBRE_USUARIO_REMOTO: alumno
# IP: 192.168.43.202
# Directorio remoto: /home/alumno/USUARIOREMOTO
# Se usará el comando scp para copiar los archivos en el equipo remoto.
scp /mispruebas/datos/PREEXAMEN.* alumno@192.168.43.202:/home/alumno/USUARIOREMOTO
# 
# 
# -------------------------------- IMPORTACION DE DATOS.
# Los pasos siguientes para la importación de los datos de un usuario local, pero sus datos están en un equipo remoto:
# - Cargamos los datos en la maquina virtual remota con direccion IP 192.168.43.202
create directory DIRECTORIOREMOTO as '/remoto/datos';
grant read,write on directory DIRECTORIOREMOTO to PREEXAMENREMOTO;
expdp PREEXAMENREMOTO/PREEXAMENREMOTO@192.168.43.202/asir directory=DIRECTORIOREMOTO 
# -  El suario de la maquina remota de ORACLE ES: PREEXAMENREMOTO/PREEXAMENREMOTO
# - El uusario local PREEXAMEN con dirección IP 192.168.43.100 borrará los datos locales. Quedándose sin información alguna de sus datos
# - Una vez borrados los datos en la maquina local, hacemos una importación de los datos del usuario PREEXAMENREMOTO remapeando los datos para el 
# usuario PREEXAMEN de la maquina local con IP 192.168.43.100
# - Tras la importacion de los datos, borramos una de las tablas cargadas tras la importacion.
# - Realizamos con el usuario remoto una nueva exportacion y carga de los datos. Con esto debemos obtener los mismos datos que el usuario con la IP 192.168.43.100
# es decir, con una tabla menos.
#
#
# Fin de pruebas de importacion y exportacion de datos en ORACLE 18C 
#
# @Author: Pauchino

 
