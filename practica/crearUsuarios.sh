#!/bin/bash

for i in `cat lista`;
do 
  echo "create user $i identified by $i quota 10M on paraotros;>>crear.sql
  echo "user and password ===> OK!"
  echo "grant connect, resource to $i;">>crear.sql
  echo "Privileges ===> OK!"
 done
 
