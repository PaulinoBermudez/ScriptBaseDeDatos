#!/bin/bash

# PROFESOR con permisos de lectura en las V.sistema DBA_TABLES & DBA_TABLESPACES.
# Conectamos con sys. pero damos los privilegios sobre la tabla de BERMUDEZ. 
sqlplus / as sysdba<<EOF
GRANT SELECT ON BERMUDEZ.DBA_TABLES TO PROFESOR;
GRANT SELECT ON BERMUDEZ.DBA_TABLESPACES TO PROFESOR;
exit
EOF
