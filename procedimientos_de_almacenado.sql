-- Cliente 
drop procedure if exists insert_cliente;
create or replace procedure insert_cliente (in cedula varchar(11), nombre varchar(50), contacto varchar(50))
begin
	insert into cliente(cedula, nombre, contacto, estado) values (cedula, nombre, contacto, 1);
end

call insert_cliente('9874058392','Jimmy Arriaga','0963849581');


drop procedure if exists update_cliente;
create procedure update_cliente  ( in id_client int, cedula varchar(11), nombre varchar(50), contacto varchar(50), estado int)
begin 
	update cliente set cedula=cedula, nombre=nombre, contacto=contacto, estado=estado where id_cliente=id_client  ;    
end

call update_cliente(1,'9874058392', 'Efren Galarza', '0963849581', 1);