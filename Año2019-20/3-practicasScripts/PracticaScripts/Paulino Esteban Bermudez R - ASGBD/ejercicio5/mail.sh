#!/bin/bash

fecha=$(date +%T)
sqlplus -s / as sysdba <<EOF
set colsep','
set pagesize 11
set trimspool on
set headsep off
set linesize 1000
spool TablaBermudez.csv

select sistema, avg(tamano), avg(usado), montado
from DF
group by sistema,montado;
spool off
EOF
estoy=$(pwd)
grep -v "-" TablaBermudez.csv | grep -v "rows" > BERMUDEZ.csv
mail -s "Paulino Esteban Bermudez R." -a $estoy/BERMUDEZ.csv alvarogonzalez.profesor@gmail.com -c paeste95.pb@gmail.com alvaro@alvarogonzalez.no-ip.biz<<ESM
.
ESM
