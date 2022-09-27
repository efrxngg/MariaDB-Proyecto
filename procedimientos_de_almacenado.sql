use proyectobd;


-- Cliente ==================================================================
/**
 * Tabla: cliente
 * Funcion: Inserta registros
 * argumentos: cedula, nombre, contacto
 */
drop procedure if exists insert_cliente;
create or replace procedure insert_cliente (in cedula varchar(11), nombre varchar(50), contacto varchar(50))
begin
	insert into cliente(cedula, nombre, contacto, estado) values (cedula, nombre, contacto, 1);
end
-- Ejemplo:  
call insert_cliente('0954943112','Perro Negro','0997188087');
call insert_cliente('0954943114','Efren Galarza','0997188086');


/**
 * Tabla: cliente
 * Funcion: Actualiza los datos del cliente
 * Argumentos: id_cliente, cedula, nombre, contacto
 */
drop procedure if exists update_cliente;
create procedure update_cliente  ( in id_client int, cedula varchar(11), nombre varchar(50), contacto varchar(50))
begin 
	update cliente set cedula=cedula, nombre=nombre, contacto=contacto where id_cliente=id_client  ;    
end
-- Ejemplo: 
call update_cliente(1,'9874058392', 'Efren Galarza', '0963849581');

/**
 * Tabla: cliente
 * Funcion: Realiza eliminacion logica
 * Argumentos: id_cliente
 */
drop procedure if exists delete_cliente;
create or replace procedure delete_cliente(in id_cliente int)
begin 
	update cliente set estado = 0 where id_cliente=id_cliente; 
end
-- Ejemplo: 
call delete_cliente(1);


-- CABECERA PEDIDO ==================================================================
/**
 * Tabla: cab_pedido
 * Funcion: Insertar Registros
 * Argumentos: id_cliente
 */
drop procedure if exists insert_cabecera_pedido;
create or replace procedure insert_cabecera_pedido (in fk_cliente int)
begin
	insert into cab_pedido(fk_cliente, estado) values (fk_cliente, 1);
end

call insert_cabecera_pedido(1);
 

/**
 * Tabla: cab_pedido
 * Funcion: Actualiza datos del pedido
 * Argumentos: id_cliente, id_cab_pedido
 */
drop procedure if exists update_cabecera_pedido;
create or replace procedure update_cabecera_pedido (in fk_cliente int, id_cab_pedido int)
begin
	update cab_pedido set fk_cliente=fk_cliente where id_cab_pedido=id_cab_pedido;
end
-- Ejemplo: 
call update_cabecera_pedido(1, 1);

/**
 * Tabla: cab_pedido
 * Funcion: Realiza borrado logico
 * Argumentos: id_cab_pedido
 */
drop procedure if exists delete_cabecera_pedido;
create or replace procedure delete_cabecera_pedido (in id_cab_pedido int)
begin
	update cab_pedido set estado=0 where id_cab_pedido=id_cab_pedido;
end

call delete_cabecera_pedido(1);


-- DETALLE PEDIDO ==================================================================
/**
 * Tabla: det_pedido
 * Funcion: Inserta registros
 * Argumentos: id_cab_pedido, id_producto, cantidad
 */
drop procedure if exists insert_detalle_pedido;
create or replace procedure insert_detalle_pedido (in fk_cab_pedido int, fk_producto int)
begin
	insert into det_pedido (fk_cab_pedido, fk_producto, estado) values(fk_cab_pedido, fk_producto, 1);
end
-- Ejemplo:
call insert_detalle_pedido(1, 1);

/**PENDIENTE
 * Tabla: det_pedido
 * Funcion: actualiza datos
 * Argumentos: id_cab_pedido, id_producto, cantidad, id_det_pedido
 */
drop procedure if exists update_detalle_pedido;
create or replace procedure update_detalle_pedido (in fk_cab_pedido int, fk_producto int, id_det_pedid int)
begin
	update det_pedido set 
		fk_cab_pedido=fk_cab_pedido, 
		fk_producto=fk_producto 
	where id_det_pedido=id_det_pedid ;
end
-- Ejemplo:
call update_detalle_pedido(1, 1, 1);

/** 
 * Tabla: det_pedido
 * Funcion: actualiza datos
 * Argumentos: id_det_pedido
 */
drop procedure if exists delete_detalle_pedido;
create or replace procedure delete_detalle_pedido (in id_det_pedido int)
begin
	update det_pedido set estado=0 where id_det_pedido=id_det_pedido;
end
-- Ejemplo:
call delete_detalle_pedido(1);


-- Cabecera Factura ==================================================================
drop procedure if exists insert_cabecera_factura;
create or replace procedure insert_cabecera_factura (in fk_cab_pedido int)
begin
	insert into cab_factura(fk_cab_pedido, sub_total, total, estado) values (fk_cab_pedido, 0, 0, 1);
end

call insert_cabecera_factura(1);


drop procedure if exists update_cabecera_factura;
create or replace procedure update_cabecera_factura (in fk_cab_pedido int, sub_total  decimal(12, 2), total  decimal(12, 2), id_cab_factura int)
begin
	update cab_factura set 
		fk_cab_pedido=fk_cab_pedido , 
		sub_total=sub_total, 
		total=total 
	where id_cab_factura = id_cab_factura ;
end

call update_cabecera_factura(1, 10, 10, 1);


drop procedure if exists delete_cabecera_factura;
create or replace procedure delete_cabecera_factura (in id_cab_factura int)
begin
	update cab_factura set 
		estado = 0
	where id_cab_factura = id_cab_factura ;
end

call delete_cabecera_factura(1);


-- DETALLE FACTURA ==================================================================
drop procedure if exists insert_detalle_factura;
create or replace procedure insert_detalle_factura (in fk_cab_factura int, fk_producto int, cantidad int, total decimal(12, 2))
begin
	insert into det_factura(fk_cab_factura, fk_producto, cantidad, total, estado) 
	values (fk_cab_factura, fk_producto, cantidad, total, 1);
end

call insert_detalle_factura(1, 1, 2, 1);




