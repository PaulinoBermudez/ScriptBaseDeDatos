#!/bin/bash

# Ver el role de 'connect'
clear

sqlplus / as sysdba<<EOF
select * from dba_role_privs order by grantee;
select * from role_sys_privs where role='CONNECT';
EOF

