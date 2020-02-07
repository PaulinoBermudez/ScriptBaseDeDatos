#!/bin/bash

# Ejercicio nº3.

# Crea un script de nombre /home/alumno/scripts/nuevo-usuario-oracle.sh que cree un nuevo usuario de oracle. 
# Si se invoca sin parámetros, o con más de dos, mostrará el texto de ayuda del listado 4
#   Crea un usuario nuevo de oracle, con permisos connect y resource.
#   Si el usuario ya existe, lo desbloquea y le cambia la contraseña.
#   Uso: nuevo-usuario-oracle.sh <usuario> <contraseña>

# ¿Existe el directorio?
clear
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
    echo "Fichero creado: $fichero"
    touch $fichero 
    chmod +x $fichero
    
echo '#!/bin/bash' >> $fichero
echo 'if [ $# != 2 ]' >> $fichero
echo 'then' >> $fichero
echo '    echo "  Crea un usuario nuevo de oracle, con permisos connect y resource.' >> $fichero
echo '    Si el usuario ya existe, lo desbloquea y le cambia la contraseña.' >> $fichero
echo '    Uso: nuevo-usuario-oracle.sh <usuario> <contraseña>' >> $fichero
echo '    "' >> $fichero
echo 'else' >> $fichero
echo ''
echo 'usuarios.sql<<EOF' >> $fichero
echo 'create user $1 identified by $2;' >> $fichero
echo 'grant connect,resource to $1;' >> $fichero
echo 'EOF' >> $fichero
echo '' >> $fichero
echo 'sqlplus / as sysdba<<EOF' >> $fichero
echo '@usuarios.sql' >> $fichero
echo 'exit' >> $fichero
echo 'EOF' >> $fichero
echo 'rm usuarios.sql' >> $fichero
echo 'echo "Lanzamiento de Script finalizado."' >> $fichero
echo 'fi' >> $fichero
fi