#!/bin/bash

# Ejercicio nº3.

# Crea un script de nombre /home/alumno/scripts/nuevo-usuario-oracle.sh que cree un nuevo usuario de oracle. 
# Si se invoca sin parámetros, o con más de dos, mostrará el texto de ayuda del listado 4
#   Crea un usuario nuevo de oracle, con permisos connect y resource.
#   Si el usuario ya existe, lo desbloquea y le cambia la contraseña.
#   Uso: nuevo-usuario-oracle.sh <usuario> <contraseña>

# ¿Existe el directorio?
cd /home/alumno/
echo "---------------"
pwd
echo "---------------"
direct='scripts'
echo "---------------"
echo $direct
echo "---------------"
if [ -d $direct ]
then
    echo "El directorio existe"
else
    mkdir $direct
    echo "Directorio creado."
fi
# Acceso al directorio 
cd /home/alumno/scripts
echo "---------------"
pwd
echo "---------------"
# ¿Existe el script?
fichero=nuevo-usuario-oracle.sh
echo "---------------"
echo $fichero 
echo "---------------"
if [ -f $fichero ]
then
    echo "Existe el fichero: $fichero" 
else 
    echo "Fichero creado"
    touch $fichero 
fi

nuevo-usuario-oracle.sh<<ENT

if [ $# != 2 ]
then
    echo "  Crea un usuario nuevo de oracle, con permisos connect y resource. \n
            Si el usuario ya existe, lo desbloquea y le cambia la contraseña. \n
            Uso: nuevo-usuario-oracle.sh <usuario> <contraseña>
        "
else
    cd /tmp
usuarios.sql<<EOF
create user $1 identified by $2;
grant connect,resource to $1;
EOF

sqlplus / as sysdba<<EOF
@/tmp/usuarios.sql
exit
EOF
rm /tmp/usuarios.sql
    echo "Lanzamiento de Script finalizado."
fi
ENT