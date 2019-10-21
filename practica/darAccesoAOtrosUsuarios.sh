#!/bin/bash

# Creacion de sinónimos, del rol para asignar los sinónimos.
sqlplus / as sysdba<<EOF

create public synonym escuderias for BERMUDEZ.escuderias;
create public synonym pilotos for BERMUDEZ.pilotos;
create public synonym prototipos for BERMUDEZ.prototipos;
create public synonym carreras for BERMUDEZ.carreras;
create public synonym resultados for BERMUDEZ.resultados;
create public synonym circuitos for BERMUDEZ.circuitos;

create role LECTURATABLAS;

grant select on BERMUDEZ.escuderias to LECTURATABLAS;
grant select on BERMUDEZ.pilotos to LECTURATABLAS;
grant select on BERMUDEZ.prototipos to LECTURATABLAS;
grant select on BERMUDEZ.carreras to LECTURATABLAS;
grant select on BERMUDEZ.resultados to LECTURATABLAS;
grant select on BERMUDEZ.circuitos to LECTURATABLAS;

EOF

# script para dar a todos los usuarios el privilegio de LECTURATABLAS.
for i in `cat lista`;
do 
  echo "grant LECTURATABLAS to $i;">>privilegiosOtrosUsuarios.sql
  echo "Script terminado"
done

# Lanzo el script 'privilegiosOtrosUsuarios.sql' de SQL con sys en SQLPLUS, es el único con capacidad para lanzar y asignar el role.
sqlplus / as sysdba @privilegiosOtrosUsuarios.sql
