#!/bin/bash
clear
# Cargando las variables de Oracle
source /home/alumno/Documents/PracticaScripts/variables.sh
# Variable de fecha
fecha=$(date +%Y-%m-%d-%X)

# Comprobación de oratab
valor=$(cat /etc/oratab | grep asir | cut -d ':' -f 3)

# Arranque de Oracle
echo "$fecha - Solicitud de arranque Oracle">>/home/alumno/logs/oracle.log
while [ $valor != 'Y' ] 
do
    # Comprobación del valor de oratab
    echo "El valor de '/etc/oratab' no es igual a Y."
    echo "Para arrancar Oracle, es necesario que cambie el valor del fichero indicado."
    sleep 3
    # Condición si oratab no es Y
    read -p "Desea cambiar el valor del fichero? (S/N)" respuesta
        if [ $respuesta == 'S' ]
        then
            cp /etc/oratab /etc/oratab-copia
            sed 's/N/Y/g' /etc/oratab>/etc/oratab
            echo ""
            echo "*******************************************"
            echo "******************* $valor ****************"
            echo "*******************************************"
            echo ""
            echo "Arrancando Oracle..."
            sh /home/alumno/Documents/PracticaScripts/inicio.sh
            echo "$fecha - Oracle arrancado porque /etc/oratab indica Y">>/home/alumno/logs/oracle.log
            echo "Listener arrancado!"
            sleep 5
            clear
            lsnrctl status
            echo "$fecha - Oracle arrancado">>/home/alumno/logs/oracle.log
        else
            echo "Vale! pero tienes que cambiar el fichero a 'Y'."
        fi
done
    
