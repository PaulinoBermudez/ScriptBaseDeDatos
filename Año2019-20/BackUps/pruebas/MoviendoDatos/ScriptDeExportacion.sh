#!/bin/bash

#
# Script de exportacion de datos de una base de datos Oracle 18c. 
#
# - Creacion de los directorios de exportacion
# - Creacion del tablespace por defecto para los usuarios de pruebas
# - Creacion de los usuarios de pruebas
# - Creacion de los datos de pruebas en uno de los dos usuarios
# - Ejecución de la exportacion
# - Copia de seguridad de los datos de usuario1 a usuario2
#

echo "Usted está aqui:"
pwd
read -p "Introduzca el nombre del directorio que desea crear para la exportacion de los datos: " carpeta1
if [ -d carpeta1 ]; then
    echo "La carpeta ya existe"
    echo "Desea crear otra?"
    read -p resp
    if [ resp -eq 'Y' ]; then
        read -p "Introduzca el nombre del directorio que desea crear para la exportacion de los datos: " carpeta1
        mkdir carpeta1
    fi
else
    mkdir carpeta1
fi 

   