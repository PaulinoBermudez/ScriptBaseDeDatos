#!/bin/bash
# Modifico mi tabla RESULTADOS para que puedan modificarlos.
sqlplus BERMUDEZ/BERMUDEZ51@10.1.35.51/asir<<EOF
alter table RESULTADOS add VALORACION varchar(20) default 'BUENO' not null check (valoracion in ('MALO', 'ACEPTABLE', 'BUENO', 'MUY BUENO' ));
EOF

# LECTURATABLAS -> rol creado con anterioridad
# -- alter role LECTURATABLAS add update;
sqlplus / as sysdba<<EOF
grant update(valoracion) on BERMUDEZ.RESULTADOS to LECTURATABLAS;
EOF
