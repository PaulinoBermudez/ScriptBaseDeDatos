#!/bin/bash

#################################################################################################
# Ejercicio 6 : Llena eltablespace CARRERAS.                                                    #
# Llena de datos el tablespace CARRERAS                                                         #
#    - Indica el metodo que utilizas para llenarlo de datos y qué mensaje de error aparece      #
#    - Amplıa el tablespace con un nuevo datafile para se puedan insertar mas datos.            #
#################################################################################################

# Llenamos el tablespace CARRERAS con un bucle. Nos conectamos con el USER: BERMUDEZ.
sqlplus BERMUDEZ/BERMUDEZ51@10.1.35.51/asir<<EOF
drop table TABLALLENA;
create table TABLALLENA VALORES(VARCHAR(255)) on tablespace carreras;
begin
for i in 1 .. 100000 loop
insert into TABLALLENA values($i);
loop end;
end;
/
EOF

# Ampliacion del datafile de CARRERAS.
sqlplus / as sysdba<<EOF
alter tablespace carreras 
add datafile 'datos/MasCarreras.dbf'
size 2M
autoextend on
next 200k
maxsize 10M;
alter user BERMUDEZ quota 5M on carreras;
exit
EOF

# Llenamos de nuevo el tablespace con un bucle infinito.
sqlplus BERMUDEZ/BERMUDEZ51@10.1.35.51/asir<<EOF
declare
i NUMBER :=0;
begin
while i <= true
loop
insert into TABLALLENA values($i);
loop end;
end;
/
EOF
