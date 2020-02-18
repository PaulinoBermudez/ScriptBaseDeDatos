#!/bin/bash
clear
# Cargando las variables de Oracle
source /home/alumno/Documents/ScriptBaseDeDatos/Año2019-20/practicasScripts/PracticaScripts/variables.sh
# Variable de fecha
fecha=$(date +%Y-%m-%d-%X)

# Comprobación de oratab
valor=$(cat /etc/oratab | grep asir | cut -d ':' -f 3)
echo $valor
# Arranque de Oracle
echo "$fecha - Solicitud de arranque Oracle">>/home/alumno/logs/oracle.log
if [ $valor == 'Y' ]
then
    echo ""
    echo "*******************************************"
    echo "******************* $valor ****************"
    echo "*******************************************"
    echo ""
    echo "Arrancando Oracle..."
    sh /home/alumno/Documents/ScriptBaseDeDatos/Año2019-20/practicasScripts/PracticaScripts/inicio.sh
    echo "$fecha - Oracle arrancado porque /etc/oratab indica Y">>/home/alumno/logs/oracle.log
    echo "Listener arrancado!"
    sleep 5
    clear
    lsnrctl status
    echo "$fecha - Oracle arrancado">>/home/alumno/logs/oracle.log
else
    echo "Tienes que cambiar el fichero a 'Y'."
    echo "$fecha - Oracle no se arranca porque /etc/oratab indica N">>/home/alumno/logs/oracle.log
fi  
echo "==========================================================">>/home/alumno/logs/oracle.log