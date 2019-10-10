#!/bin/sh

clear

echo "+--------------------------+"
echo "| Añadiendo archivos a git |"
echo "+--------------------------+"
sleep 2

git add . &&
git commit -m "Script de Base de Datos Oracle en Centos 7" &&
git push origin master
sleep 5
clear
git status
echo "+--------------------------+"
echo "|     Trabajo terminado    |"
echo "+--------------------------+"
