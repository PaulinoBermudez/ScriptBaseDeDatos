#!/bin/bash

# PROFESOR con permisos de lectura en las V.sistema DBA_TABLES & DBA_TABLESPACES.
# Conectamos con sys. pero damos los privilegios sobre la tabla de BERMUDEZ. 
sqlplus / as sysdba<<EOF
drop role permisosProfe;
create role permisosProfe;
GRANT SELECT ON DBA_TABLES TO permisosProfe;
GRANT SELECT ON DBA_TABLESPACES TO permisosProfe;

GRANT permisosProfe TO PROFESOR;
exit
EOF
