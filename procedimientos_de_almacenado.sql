-- Procedimientos Cab_Factura--------

-- 
drop  procedure insert_cabecera_factura
create procedure insert_cabecera_factura(id_cab_factura int (11), fk_cab_pedido int(11),sub_total decimal(10,2), total decimal (10,2), fecha_creacion timestamp, estado int(11))
begin
	insert into cab_factura  values (id_cab_factura, fk_cab_pedido, sub_total, total, fecha_creacion, estado);
end
call insert_Cabecera_factura(1,1,10.2,11.55,current_timestamp(),1)

select * from cab_factura;
select * from cab_pedido;


-- bucle id_cab_factura
drop procedure if exists update_cabecera_factura
create or replace procedure update_cabecera_factura ( in id_cab_fact int(11), fk_cab_pedido int(11), sub_total decimal(10,2), total decimal (10,2), fecha_creacion timestamp, estado int(11))
begin 
	update cab_factura  set fk_cab_pedido  = fk_cab_pedido , sub_total  = sub_total , total  = total , fecha_creacion = fecha_creacion , estado = estado where id_cab_factura  = id_cab_fact;
end
call update_cabecera_factura(1,1,10.2,11.89,current_timestamp(),1)

-- 
create or replace procedure delete_cabecera_factura (id_cab_fact int(11))
begin 
	delete from cab_factura where id_cab_factura  = id_cab_fact;
end
call delete_cabecera_factura (2)

-- 
drop procedure if exists select_cabecera_factura;
CREATE PROCEDURE select_cabecera_factura(id_cab_fact INT)
BEGIN
SELECT * FROM cab_factura WHERE id_cab_factura =id_cab_fact ;
END

call select_cabecera_factura (1)


-- Procedimientos Det_Pedido-------

-- 
drop  procedure insert_detalle_pedido
create or replace procedure insert_detalle_pedido (id_det_pedido int (11), fk_cab_pedido int(11), fk_producto int(11), cantidad int(11), estado int(11))
begin
	insert into det_pedido  values (id_det_pedido , fk_cab_pedido , fk_producto , cantidad , estado);
end
call insert_detalle_pedido(5,1,1,3,1)


-- 
drop procedure if exists update_detalle_pedido
create procedure update_detalle_pedido ( in id_det_ped int (11), fk_cab_pedido int(11), fk_producto int(11), cantidad int(11), estado int(11))
begin 
	update det_pedido  set fk_cab_pedido = fk_cab_pedido , fk_producto = fk_producto , cantidad = cantidad , estado = estado where id_det_pedido = id_det_ped;
end
call update_detalle_pedido(5,1,1,3,0)

-- 
create procedure delete_detalle_pedido (id_det_ped int(11))
begin 
	delete from det_pedido where id_det_pedido = id_det_ped;
end
call delete_detalle_pedido(5)

-- 
drop procedure if exists select_detalle_pedido;
CREATE PROCEDURE select_detalle_pedido(id_det_ped INT)
BEGIN
SELECT * FROM det_pedido WHERE id_det_pedido =id_det_ped ;
END

call select_detalle_pedido (4)



-- Procedimientos Det_Factura------

-- 
drop  procedure insert_detalle_factura
create procedure insert_detalle_factura (id_det_factura int (11), fk_cab_factura int(11), fk_producto int(11), total decimal(10,2), estado int(11))
begin
	insert into det_factura  values (id_det_factura, fk_cab_factura, fk_producto, total, estado);
end
call insert_detalle_factura(1,1,2,21.11,1)


-- 
drop procedure if exists update_detalle_factura
create procedure update_detalle_factura ( in id_det_fact int (11), fk_cab_factura int(11), fk_producto int(11), total decimal(10,2), estado int(11))
begin 
	update det_factura  set fk_cab_factura = fk_cab_factura, fk_producto = fk_producto , total = total , estado =estado  where id_det_factura = id_det_fact;
end
call update_detalle_factura(1,1,2,21.50,1)

-- 
create procedure delete_detalle_factura (id_det_fact int(11))
begin 
	delete from det_factura where id_det_factura = id_det_fact;
end
call delete_detalle_factura(1)

-- 
drop procedure if exists select_detalle_factura;
CREATE PROCEDURE select_detalle_factura(id_det_fact INT)
BEGIN
SELECT * FROM det_factura WHERE id_det_factura =id_det_fact ;
END

call select_detalle_factura (1)




-- Procedimientos cliente ------

-- 
drop procedure if exists update_cliente 
create procedure update_cliente   ( in id_client int,cedula varchar(11), nombre varchar(50), contacto varchar(50), estado int)
begin 
	update cliente set cedula = cedula, nombre = nombre, contacto = contacto, estado=estado where id_cliente=id_client  ;    
end
call update_cliente(2,'9874058392','Gianpierre Novillo','0963849581',1)

-- 
drop procedure if exists insert_cliente
create or replace procedure insert_cliente (id_cliente int, cedula varchar(11), nombre varchar(50), contacto varchar(50), estado int)
begin
	insert into cliente values (id_cliente, cedula, nombre, contacto, estado);
end
call insert_cliente(2,'9874058392','Jimmy Arriaga','0963849581',1)


create view vista_cliente as select * from cliente where estado=0;

select * from vista_cliente;


-- 
drop procedure if exists delete_vista_cliente 
create procedure delete_vista_cliente  (id_client int , estado int)
begin
	declare mensaje varchar(255);
	set mensaje = 'dato ingresado no valido en estado';
	
	if estado = 0 then
		update cliente set cliente.estado = estado where cliente.id_cliente= id_client;
	
	select *from vista_cliente;
	elseif  estado = 1 then
		update cliente set cliente.estado = estado where cliente.id_cliente= id_client;
	select *from vista_cliente;

	else 
		
	select *from vista_cliente;
	select  mensaje ;
	end if;
end
call delete_vista_cliente (2,0)

-- 
drop procedure if exists select_cliente;
CREATE PROCEDURE select_cliente(id_client INT)
BEGIN
SELECT * FROM cliente WHERE id_cliente =id_client ;
END
call select_cliente(2)



-- Procedimientos Presentacion_Catalogo_producto

-- 
drop  procedure insert_presentacion_catalogo_producto
create or replace procedure insert_presentacion_catalogo_producto(id_pres_cata_prod integer,fk_cata_prod int, fk_sub_cate int, cantidad double, fk_uni_prod int, estado int)
begin
	insert into presentacion_catalogo_producto values (id_pres_cata_prod,fk_cata_prod,fk_sub_cate,cantidad,fk_uni_prod,estado);
call  select_presentacion_catalogo_producto;
end
call insert_presentacion_catalogo_producto(7,5,1,2,1,1)

-- 
drop procedure if exists update_presentacion_catalogo_producto
create or replace procedure update_presentacion_catalogo_producto ( in cata_prod int(11), sub_cate int(11), cantidad double, uni_prod int(11),estado int, pres_cata_prod int(11))
begin 
	update presentacion_catalogo_producto  set fk_cata_prod = cata_prod, fk_sub_cate = sub_cate, cantidad = cantidad, fk_unid_prod = uni_prod, estado = estado  where id_pres_cata_prod  = pres_cata_prod;
    call  select_presentacion_catalogo_producto;
end
call update_presentacion_catalogo_producto(5,1,2,1,0,7)

-- 
drop procedure if exists delete_presentacion_catalogo_producto
create or replace procedure delete_presentacion_catalogo_producto (pres_cata_prod int(11))
begin 
	delete from presentacion_catalogo_producto where id_pres_cata_prod = pres_cata_prod ;
call  select_presentacion_catalogo_producto;
end
call delete_presentacion_catalogo_producto(7)

-- 
drop procedure if exists select_presentacion_catalogo_producto;
create or replace procedure select_presentacion_catalogo_producto()
begin 
	
	select 
		sc.descripcion as SubCategoria, 
		cp.descripcion as Producto, 
		concat(pcp.cantidad,up.sigla) as Presentacion  
	from presentacion_catalogo_producto pcp 
		inner join catalogo_producto cp on pcp.fk_cata_prod = cp.id_cata_prod 
		inner join sub_categorias sc on pcp.fk_sub_cate = sc.id_sub_cate 
		inner join unidad_producto up on pcp.fk_unid_prod = up.id_unid_prod ;
	
end
call  select_presentacion_catalogo_producto();
