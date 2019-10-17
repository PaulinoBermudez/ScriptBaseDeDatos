#!/bin/bash

sqlpus / as sysdba<<EOF

create public synonym escuderias for BERMUDEZ.escuderias
create public synonym pilotos for BERMUDEZ.pilotos
create public synonym prototipos for BERMUDEZ.prototipos
create public synonym carreras for BERMUDEZ.carreras
create public synonym resultados for BERMUDEZ.resultados
create public synonym circuitos for BERMUDEZ.circuitos

create role LECTURATABLAS
grant select on escuderias to LECTURATABLAS;
grant select on pilotos to LECTURATABLAS;
grant select on prototipos to LECTURATABLAS;
grant select on carreras to LECTURATABLAS;
grant select on resultados to LECTURATABLAS;
grant select on circuitos to LECTURATABLAS;

EOF

for i in `cat lista`;
do 
  echo "grant LECTURATABLAS to $i;">>/home/alumno/privilegiosOtrosUsuarios.sql
  echo "Script terminado"
done

# Lanzo el script 'privilegiosOtrosUsuarios.sql' de SQL con sys en SQLPLUS
./sqlpus -s BERMUDEZ/BERMUDEZ51@10.1.35.51/asir @/home/alumno/privilegiosOtrosUsuarios.sql
