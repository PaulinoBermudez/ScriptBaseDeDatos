#!/bin/bash
clear
if [ $# -ne 2 ]
then 
    echo ""
    echo -e "\e[1;31m 
    Crea un usuario nuevo de Oracle, con permisos connect y resource.
    Si el usuario ya existe, lo desbloquea y le cambia la contraseña.

    Uso: nuevo-usuario-oracle.sh <usuario> <contraseña>
    \e[0m"
    echo ""
    sleep 2
    clear
else
    usuario=$1
    contra=$2
    # crea usuario
    creausuarios(){
    sqlplus / as sysdba<<EOF
    create user $usuario identifief by $contra;
    grant connect, resource to $usuario;
EOF
    }
    # Crea archivo temporal
    touch temporal
    # Almacena todos los usuario en el temporal
    existeusuario(){
    sqlplus / as sysdba<<HERE
    select username from dba_users;
HERE
    }
    existeusuario>>temporal 
    echo "----------------------------------"
    echo -e "\e[0;35m       Temporal realizado\e[0m"
    echo "----------------------------------"
    read -p "Intro para leer temporal" continua
    cat temporal
    sleep 3
    clear
    # Busca el usuario de entrada en la lista
    existe=$(cat temporal | grep -woin $usuario | wc -l)
    echo "***********************"
    echo "  Coincidencias:  "$existe 
    echo "***********************"
    read -p "Pulse para continuar" continua
    # Comparacion para ver los resultados de entrada
    if [ $existe != 0 ]
    then
        echo ""
        echo "-------------------------------------------------------"
        echo -e "\e[0;33m       El usuario existe. \e[0m"
        echo ""
        echo -e "\e[0;33m      Procedemos a cambiar su contraseña y desbloquearlo \e[0m"
        echo "-------------------------------------------------------"
        read -p "Pulse para continuar" continuar
    sqlplus / as sysdba<<EOF1
        alter user $usuario account unlock;
        alter user $usuario identified by $contra;
EOF1
        
        echo "------------------------------------------"
        read -p "Cambios realizados. Pulse para continuar" continua
        echo "------------------------------------------"
    else
        echo ""
        echo "----------------------------------------------"
        echo -e "\e[0;33m      El usuario no existe en Oracle\e[0m"
        echo -e "\e[0;33m      Lo creamos...\e[0m"
        echo "----------------------------------------------"
        read -p "Pulse para continuar" continuar
    sqlplus / as sysdba<<HEREDOC
    create user $usuario identified by $contra;
    grant connect, resource to $usuario;
HEREDOC
        echo ""
        echo "------------------------------------------"
        echo -e "\e[1;32m      Tarea realizada.    \e[0m"
        echo "------------------------------------------"
        read -p "Pulse para continuar" continua
    fi
    rm -f temporal
fi