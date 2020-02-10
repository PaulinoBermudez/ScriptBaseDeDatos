select * from dba_users;
select * from dba_tables where owner='BERMUDEZ';
select * from dba_tablespaces;

-- creacion de tablespace paraotros
create tablespace paraotros       
    datafile '/datos/paraotros1.dbf',
    size 800k                                 
    autoextend on                             
    next 200k                                    
    maxsize 100M,
    '/datos/paraotros2.dbf'
    size 800k                                 
    autoextend on                             
    next 200k                                    
    maxsize 100M
;                                
-- creacion de los nuevos usuarios en le .SQL
--> sql '/home/alumno/Documents/ScriptBaseDeDatos/practica/crear.sql'

-- Permisos para PROFESOR
---- Eliminación del ROLE, si existe
drop role permisosProfe;
---- Creación del ROLE permisosProfe
create role permisosProfe;
-- Privilegios para el role
GRANT SELECT ON DBA_TABLES TO permisosProfe;
GRANT SELECT ON DBA_TABLESPACES TO permisosProfe;
GRANT SELECT ON DBA_DATA_FILES TO permisosProfe;
GRANT SELECT ON DBA_TS_QUOTAS TO permisosProfe;
-- Asignación del role creado
GRANT permisosProfe TO PROFESOR;

-- Tablespace CARRERAS
---- Eliminación del tablespace CARRERAS, si existe
drop tablespace carreras;
---- Creación del tablespace CARRERAS como ruta '/datos/carreras/' del sistema Centos 7.
create tablespace carreras  
    datafile '/datos/carreras/carreras.dbf'  
    size 800k                
    autoextend on                  
    next 200k 
    maxsize 100M
;   
----  asignación del tablespace CARRERAS por defecto para el usuario BERMUDEZ con cuota ilimitada.
alter user BERMUDEZ default tablespace carreras quota unlimited on carreras;

-- Creación de sinónimos de las tablas del usuario BERMUDEZ
create or replace public synonym escuderias for BERMUDEZ.escuderias; 
create or replace public synonym pilotos for BERMUDEZ.pilotos;      
create or replace public synonym prototipos for BERMUDEZ.prototipos; 
create or replace public synonym carreras for BERMUDEZ.carreras;     
create or replace public synonym resultados for BERMUDEZ.resultados; 
create or replace public synonym circuitos for BERMUDEZ.circuitos;   
-- Creación del role LECTURATABLAS -> PERMITE HACER SELECT A LAS TABLAS DE 'BERMUDEZ', al usuario que se le asigne el role
----- Elimiación del role, si existe en el sistema.
drop role LECTURATABLAS;                           
----- Creación del role LECTURATABLAS.
create role LECTURATABLAS;                                           
----- Privilegios para el role LECTURATABLAS.                                                                  
grant select on BERMUDEZ.escuderias to LECTURATABLAS;                
grant select on BERMUDEZ.pilotos to LECTURATABLAS;                   
grant select on BERMUDEZ.prototipos to LECTURATABLAS;                
grant select on BERMUDEZ.carreras to LECTURATABLAS;                 
grant select on BERMUDEZ.resultados to LECTURATABLAS;                
grant select on BERMUDEZ.circuitos to LECTURATABLAS;   

-- Ejecición del script privilegiosOtrosUsuarios.sql -> Asigna a todos los usuarios (PRACTICA) el role LECTURATABLAS
--> sql @/home/alumno/Documents/ScriptBaseDeDatos/practica/privilegiosOtrosUsuarios.sql

-- Actualizo/Modifico el role LECTURATABLAS añadiéndo el valor de 'actualización' para el campo 'valoracion' de la tabla RESULTADOS de BERMUDEZ.
grant update(valoracion) on BERMUDEZ.RESULTADOS to LECTURATABLAS;

-- Aumento el tamaño del tablespace carreras AÑADIENDO OTRO ARCHIVO .dbf AL TABLESPACE 'CARRERAS' ---> Forma 1.
alter tablespace carreras 
    add datafile '/datos/carreras/MasCarreras.dbf'
    size 2M
    autoextend on
    next 200k
    maxsize 10M;
    alter user BERMUDEZ quota 6M on carreras
;
-- Aumento el tamaño del tablespace carreras redimensionando el tamaño del tablespace. ---> Forma 2.
alter tablespace carreras autoextend on next 1G; 
alter tablespace carreras resize 2G;


-- ver tamaño del tablespace carreras
select *
from dba_free_space
where tablespace_name like '%CARRERAS%';

select tablespace_name, round(sum(bytes)/1024/1024,0)
from dba_free_space 
where tablespace_name not like '%temp%'
group by tablespace_name;

SELECT tablespace_name,
round(sum(BYTES/1024/1024))
FROM dba_data_files b
WHERE tablespace_name NOT LIKE 'TEMP%'
GROUP BY b.tablespace_name;
