#!/bin/sh

clear

echo "+--------------------------+"
echo "| Añadiendo archivos a git |"
echo "+--------------------------+"
sleep 2
git add Apuntes/. &&
git commit -m "Apuntes de Base de Datos 2" &&
git add Script_introducción_18-19/. && 
git push origin master 
echo "**************"
echo "Apuntes ==> OK"
echo "**************"
git commit -m "Script iniciales de bases de datos en Centos 7" &&
echo "**************"
echo "Scripts ==> OK"
echo "**************"
git push origin master
git add . &&
git commit -m "Script de Base de Datos Oracle en Centos 7" &&
git push origin master
echo "**************"
echo "Practica ==> OK"
echo "**************"
sleep 5
git status
echo "" 
echo "" 
echo "+--------------------------+"
echo "|     Trabajo terminado    |"
echo "+--------------------------+"
read -p "Limpiar pantalla (Y/N)" resp
if [ $resp == 'Y'] || [ $resp == 'y'] then
    clear
fi