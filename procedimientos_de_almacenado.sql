-- Cliente 
use proyectobd;

drop procedure if exists insert_cliente;
create or replace procedure insert_cliente (in cedula varchar(11), nombre varchar(50), contacto varchar(50))
begin
	insert into cliente(cedula, nombre, contacto, estado) values (cedula, nombre, contacto, 1);
end

call insert_cliente('0954943112','Perro Negro','0997188087');
call insert_cliente('0954943114','Efren Galarza','0997188086');



drop procedure if exists update_cliente;
create procedure update_cliente  ( in id_client int, cedula varchar(11), nombre varchar(50), contacto varchar(50), estado int)
begin 
	update cliente set cedula=cedula, nombre=nombre, contacto=contacto, estado=estado where id_cliente=id_client  ;    
end

call update_cliente(1,'9874058392', 'Efren Galarza', '0963849581', 0);


drop procedure if exists delete_cliente;
create or replace procedure delete_cliente(in id_cliente int)
begin 
	update cliente set estado = 0 where id_cliente=id_cliente; 
end

call delete_cliente(1);


-- Cabecera Pedido
drop procedure if exists insert_cabecera_pedido;
create or replace procedure insert_cabecera_pedido (in fk_cliente int)
begin
	insert into cab_pedido(fk_cliente, estado) values (fk_cliente, 1);
end

call insert_cabecera_pedido(1);
 

drop procedure if exists update_cabecera_pedido;
create or replace procedure update_cabecera_pedido (in fk_cliente int, id_cab_pedido int)
begin
	update cab_pedido set fk_cliente=fk_cliente where id_cab_pedido=id_cab_pedido;
end

call update_cabecera_pedido(1, 1);


drop procedure if exists delete_cabecera_pedido;
create or replace procedure delete_cabecera_pedido (in id_cab_pedido int)
begin
	update cab_pedido set estado=0 where id_cab_pedido=id_cab_pedido;
end

call delete_cabecera_pedido(1);


-- Cabecera Factura
drop procedure if exists insert_cabecera_factura;
create or replace procedure insert_cabecera_factura (in fk_cab_pedido int, sub_total  decimal(12, 2), total  decimal(12, 2))
begin
	insert into cab_factura(fk_cab_pedido, sub_total, total, estado) values (fk_cab_pedido, sub_total, total, 1);
end

call insert_cabecera_factura('9874058392','Jimmy Arriaga','0963849581');
