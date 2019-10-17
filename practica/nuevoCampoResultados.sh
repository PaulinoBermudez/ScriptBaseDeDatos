#!/bin/bash

sqlplus BERMUDEZ/BERMUDEZ51@10.1.35.51/asir<<EOF
alter table RESULTADOS add VALORACION varchar(20) default 'BUENO' not null check (valoracion in ('MALO', 'ACEPTABLE', 'BUENO', 'MUY BUENO' ));
EOF
# LECTURATABLAS -> rol creado con anterioridad
sqlpus / as sysdba<<EOF
-- alter role LECTURATABLAS add update;
grant update(valoracion) on BERMUDEZ.RESULTADOS to LECTURATABLAS;
EOF
