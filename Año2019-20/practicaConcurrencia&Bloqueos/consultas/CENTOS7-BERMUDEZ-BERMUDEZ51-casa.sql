-- Ejecutamos el script de carreras-coches.sql que almacena las tablas de carreras etc.
--> @/home/alumno/Documents/ScriptBaseDeDatos/practica/carreras-coches.sql
select * from resultados;
-- Altero la tabla 'RESULTADOS' añadiéndole el campo 'VALORACION' con valor por defecto 'BUENO' y valores posibles alternativos.
alter table RESULTADOS 
    add VALORACION varchar(20) 
    default 'BUENO' not null 
    check (valoracion in ('MALO', 'ACEPTABLE', 'BUENO', 'MUY BUENO' ))
;
/*************************************************************************************/
-- LLENO EL CAMPO RESULTADOS DE LA TABLA VALORACION CON 100000 VALORES ---> Forma 1.
begin
for i in 1 .. 100000 loop
insert into resultados(valoracion) values('MALO');
end loop;
end;
/
COMMIT;
-- LLENO EL CAMPO RESULTADOS DE LA TABLA VALORACION.
declare
i NUMBER :=0;
begin
while i > -1 
loop
insert into resultados(valoracion) values('MALO');
end loop;
end;
/
select count(valoracion) from resultados;
/*************************************************************************************/
-- LLENO EL TABLESPACE CARRERAS CON UNA TABLA NUEVA --> FORMA 2.
 drop table llenar;
create table llenar (id number, texto varchar(255))  tablespace carreras;
begin
    for i in 1 .. 50000 loop 
    insert into llenar (id,texto)
    values(i,'lleno');
    end loop;
    end;
/
commit;
select count(id) from llenar;
select * from llenar;

