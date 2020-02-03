#!/bin/bash
clear
# Cargando las variables de Oracle
source /home/alumno/Documents/PracticaScripts/variables.sh
# Variable de fecha
fecha=$(date +%Y-%m-%d-%X)

# Comprobación de oratab
valor=$(cat /etc/oratab | grep asir | cut -d ':' -f 3)

# Arranque de Oracle
echo "$fecha - Solicitud de parar Oracle">>/home/alumno/logs/oracle.log
if [ $valor == 'Y' ]
then
    echo ""
    echo "*******************************************"
    echo "******************* $valor ****************"
    echo "*******************************************"
    echo ""
    echo "Parando Oracle..."
    sh /home/alumno/Documents/PracticaScripts/parada.sh
    echo "$fecha - Oracle parado porque /etc/oratab indica Y">>/home/alumno/logs/oracle.log
    echo "Listener parado!"
    sleep 5
    clear
    lsnrctl status
    echo "$fecha - Oracle parado">>/home/alumno/logs/oracle.log
else
    echo "Tienes que cambiar el fichero a 'Y' ."
    echo "$fecha - Oracle no se arranca porque /etc/oratab indica N">>/home/alumno/logs/oracle.log
fi  
echo "==========================================================">>/home/alumno/logs/oracle.log