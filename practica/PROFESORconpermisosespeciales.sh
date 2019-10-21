#!/bin/bash

# PROFESOR con permisos de lectura en las V.sistema DBA_TABLES & DBA_TABLESPACES.
# Conectamos con sys. pero damos los privilegios sobre la tabla de BERMUDEZ. 
sqlplus / as sysdba<<EOF
GRANT SELECT ON BERMUDEZ.DBATABLES TO PROFESOR;
GRANT SELECT ON BERMUDEZ.DBATABLESPACES TO PROFESOR;
exit
EOF
