-- Realizo cambios en el campo 'valoracion' de la tabla 'RESULTADOS'
update RESULTADOS set valoracion='MALO';
commit;
select * from resultados;
