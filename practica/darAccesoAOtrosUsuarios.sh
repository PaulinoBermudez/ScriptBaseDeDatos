#!/bin/bash

sqlplus / as sysdba<<EOF

create or replace public synonym escuderias for BERMUDEZ.escuderias;
create or replace public synonym pilotos for BERMUDEZ.pilotos;
create or replace public synonym prototipos for BERMUDEZ.prototipos;
create or replace public synonym carreras for BERMUDEZ.carreras;
create or replace public synonym resultados for BERMUDEZ.resultados;
create or replace public synonym circuitos for BERMUDEZ.circuitos;

drop role LECTURATABLAS;
create role LECTURATABLAS;
grant select on BERMUDEZ.escuderias to LECTURATABLAS;
grant select on BERMUDEZ.pilotos to LECTURATABLAS;
grant select on BERMUDEZ.prototipos to LECTURATABLAS;
grant select on BERMUDEZ.carreras to LECTURATABLAS;
grant select on BERMUDEZ.resultados to LECTURATABLAS;
grant select on BERMUDEZ.circuitos to LECTURATABLAS;

EOF
#!/bin/bash

sqlplus / as sysdba<<EOF

create or replace public synonym escuderias for BERMUDEZ.escuderias;
create or replace public synonym pilotos for BERMUDEZ.pilotos;
create or replace public synonym prototipos for BERMUDEZ.prototipos;
create or replace public synonym carreras for BERMUDEZ.carreras;
create or replace public synonym resultados for BERMUDEZ.resultados;
create or replace public synonym circuitos for BERMUDEZ.circuitos;

drop role LECTURATABLAS;
create role LECTURATABLAS;
grant select on BERMUDEZ.escuderias to LECTURATABLAS;
grant select on BERMUDEZ.pilotos to LECTURATABLAS;
grant select on BERMUDEZ.prototipos to LECTURATABLAS;
grant select on BERMUDEZ.carreras to LECTURATABLAS;
grant select on BERMUDEZ.resultados to LECTURATABLAS;
grant select on BERMUDEZ.circuitos to LECTURATABLAS;

exit

EOF


for i in `cat lista`;
do 
  echo "grant LECTURATABLAS to $i;">>/home/alumno/Documents/practica/privilegiosOtrosUsuarios.sql
  echo "Script terminado"
done

# Lanzo el script 'privilegiosOtrosUsuarios.sql' de SQL con sys en SQLPLUS
sqlplus / as sysdba @/home/alumno/Documents/practica/privilegiosOtrosUsuarios.sql
