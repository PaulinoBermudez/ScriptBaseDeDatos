#!/bin/bash
clear
# Creamos la tabla DF en Oracle
# Insertamos en el LOG la fecha de ejecución del script
date > /home/alumno/logs/DF.log
echo "______________________________________" > /home/alumno/logs/DF.log
# Quitamos la primera linea de la salida de df -k y exportamos al directorio de logs
df -hk | tail -n +2 > /home/alumno/logs/DF.log
# Lee linea a linea
while read line
do
# Creamos las variables que insertaremos en la tabla
	hora=$(date +%H:%M:%S)
	sistema=`echo $line | awk '{print $1}'`
    tamano=`echo $line | awk '{print $2}'`
    usado=`echo $line | awk '{print $3}'`
    montado=`echo $line | awk '{print $6}'`

# Insertamos los valores en la tabla de oracle
sqlplus / as sysdba << EOF >/dev/null
insert into DF values ('$hora','$sistema','$tamano','$usado','$montado');
commit;
EOF
	echo "Insertando dato" 
	echo $line
	echo ""
	echo "Dato almacenado en DF.log en /home/alumno/logs/DF.log"
	#sleep 2
	clear
done < /home/alumno/logs/DF.log
read -p "Pulse INTRO para leer DF.log" leer
cat /home/alumno/logs/DF.log
