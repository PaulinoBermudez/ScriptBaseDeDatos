#!/bin/bash

# Llenamos el tablespace CARRERAS con un bucle. Nos conectamos con el USER: BERMUDEZ.
sqlplus BERMUDEZ/BERMUDEZ51@10.1.35.51/asir<<EOF

create table TABLALLENA VALORES(VARCHAR(255)) on tablespace carreras;

begin
for i in 1 .. 10000 loop
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
