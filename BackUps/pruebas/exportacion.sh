#!/bin/bash
clear
# Creacion de carpeta de backups
# Carpeta con datos
mkdir Omen
# Carpeta donde se exporta
mkdir Pauchino

# Exportaciones
sqlplus / as sysdba<<EOF

host echo "Tablespace de pauchino --> exportacion"
drop tablespace exportacion;

create tablespace exportacion
datafile '/home/alumno/Documents/ScriptBaseDeDatos/BackUps/pruebas/Pauchino/pau.dbf'
size 50M;

host echo " Usuario pruebas"
drop user pruebas cascade;
create user pruebas identified by pruebas 
default tablespace exportacion 
quota unlimited on exportacion;

drop user pruebas2 cascade;
create user pruebas2 identified by pruebas2 
default tablespace USERS 
quota unlimited on USERS;

host echo "Permisos"
grant connect, resource to pruebas;
grant create any directory to pruebas;

grant connect, resource to pruebas2;
grant create any directory to pruebas2;


host echo "Creando directorio de EXPORTACIONES para PAUCHINO"
create directory EXPORTACIONES as '/home/alumno/Documents/ScriptBaseDeDatos/BackUps/pruebas/Pauchino';
grant read,write on directory EXPORTACIONES to pruebas;
grant exp_full_database to pruebas;
EOF


# Cargo datos
sqlplus pruebas/pruebas@10.1.35.51/asir @carreras-coches.sql
echo "Tablas cargadas"
# Realizando exportacion 
expdp pruebas/pruebas@10.1.35.51/asir directory=EXPORTACIONES schemas=pruebas dumpfile=EXPORTACION_DE_OMEN.dmp logfile=EXPORTACION_DE_OMEN.log
echo "Fin de exportacion"
# Copiar el fichero exportado a otro usuario o equipo
scp /home/alumno/Documents/ScriptBaseDeDatos/BackUps/pruebas/Pauchino/EXPORTACION_DE_OMEN.* pruebas2@10.1.35.51/asir:/home/alumno/Documents/ScriptBaseDeDatos/BackUps/pruebas/Omen
echo "Archivo copiado"



echo "Fin del SCRIPT"


