use proyectobd;

-- START ANGIE 
-- CATEGORIA ==================================================
create or replace procedure insert_categoria (descripcion varchar(255))
begin 
 insert into categoria (descripcion, estado) values  (descripcion,1);
end
call insert_categoria('electronicos')

select*from categoria


#update
drop procedure if exists update_categoria;
create procedure update_categoria (in id_cat int, descripcion varchar(255))
begin 
update categoria set descripcion=descripcion, estado=estado  where  id_cate=id_cat;
end
call update_categoria(2,'domesticos')
select*from categoria
 

#delete
create procedure delete_categoria (id_cat int)
begin
	delete from categoria where id_cate=id_cat;
end
call delete_categoria(2)
select*from categoria 

#select
drop procedure if exists select_categoria;
CREATE PROCEDURE select_categoria(id_cate int)
BEGIN
SELECT * FROM categoria where id_cate=id_cate;
END

call select_categoria(1)


-- SUB CATEGORIA ==================================================
#insert
create or replace procedure insert_sub_categoria (fk_categoria int(11) ,descripcion varchar(255))
begin 
 insert into sub_categorias (fk_categoria ,descripcion, estado) values  (fk_categoria, descripcion, 1);
end 
call insert_sub_categoria ( 1,'jugos');
select*from sub_categorias 

#update
create or replace  procedure update_sub_categoria (in id_sub_cat int(11),fk_categoria int(11) ,descripcion varchar(255),estado int)
begin 
update sub_categorias  set id_sub_cate=id_sub_cate ,fk_categoria=fk_categoria,descripcion=descripcion ,estado=estado  where  id_sub_cate=id_sub_cat ;
end
call update_sub_categoria (2,1,'bebidas',1);
select*from sub_categorias

#delete
create procedure delete_sub_categorias (id_sub_cat int)
begin
	delete from sub_categorias where id_sub_cate =id_sub_cat;
end
call delete_sub_categorias(2)
select*from sub_categorias

#select
drop procedure if exists select_sub_categorias;
CREATE PROCEDURE select_sub_categorias(id_sub_cat int)
BEGIN
SELECT * FROM sub_categorias where id_sub_cate=id_sub_cat;
END

call select_sub_categorias(1)


-- UNIDAD PRODUCTO ==================================================
#insert
create or replace procedure insert_unidad_producto (sigla varchar(5),descripcion varchar(255))
begin 
 insert into unidad_producto (sigla,descripcion,estado) values (sigla ,descripcion, 1);
end 
call insert_unidad_producto('K','Kilos');
select*from unidad_producto 

#update
drop table if exists update_unidad_producto;
create or replace  procedure update_unidad_producto(in id_unid_pro int(11),sigla varchar(5),descripcion varchar(255),estado int)
begin 
update unidad_producto set id_unid_prod =id_unid_prod, sigla=sigla, descripcion=descripcion, estado=estado  where  id_unid_prod=id_unid_pro;
end
call update_unidad_producto  (4,'K','Kilogramos',1);
select*from unidad_producto 


#delete
drop table if exists delete_unidad_producto;
create procedure delete_unidad_producto (id_unid_pro int)
begin
	delete from unidad_producto  where id_unid_prod=id_unid_pro;
end
call delete_unidad_producto (4)
select*from unidad_producto 


#select
drop procedure if exists select_unidad_producto;
CREATE PROCEDURE select_unidad_producto(id_unid_prod int)
BEGIN
SELECT * FROM unidad_producto where id_unid_prod=id_unid_prod;
END
call select_unidad_producto(1);
select*from unidad_producto

-- END ANGIE

-- START ERICK
-- CATALOGO PRODUCTO ==================================================
#insert
drop procedure if exists insert_catalogo_producto;
create or replace procedure insert_catalogo_producto(descripcion varchar(50))
begin
	insert into catalogo_producto(descripcion, estado) values (descripcion, 1);
end
call insert_catalogo_producto("Saritas")
select *from catalogo_producto;

#update
drop procedure if exists update_catalogo_producto;
create or replace procedure update_catalogo_producto ( in id_cata_product int(11), descripcion varchar(50))
begin 
	update catalogo_producto  set descripcion = descripcion where id_cata_prod  = id_cata_product;
end
call update_catalogo_producto(15,"Ronditos")

#delete
drop procedure if exists delete_catalogo_producto;
create or replace procedure delete_catalogo_producto ( in id_cata_pro int)
begin 
	update catalogo_producto set estado=0 where id_cata_prod=id_cata_pro;
end
call delete_catalogo_producto (3)

#select
drop procedure if exists select_catalogo_producto;
create procedure select_catalogo_producto(id_cata_pro int)
begin
select * from catalogo_producto where id_cata_prod  = id_cata_pro;
end
call select_catalogo_producto (1)

-- AREA ALMACENADO ==================================================
#insert
drop procedure if exists insert_area_almacenado;
create or replace procedure insert_area_almacenado(descripcion varchar(50))
begin
	insert into area_almacenado(descripcion, estado)  values (descripcion ,1 );
end
call insert_area_almacenado("Refrigeracion")
select * from area_almacenado;

#update
drop procedure if exists update_area_almacenado;
create or replace procedure update_area_almacenado ( in id_almacenado_p int(11), descripcion varchar(50))
begin 
	update area_almacenado  set descripcion = descripcion where id_almacenado  = id_almacenado_p;
end
call update_area_almacenado(2,"Al Ambiente")

#delete
create or replace procedure delete_area_almacenado(id_almacenado_p int(11))
begin 
	update area_almacenado set estado =0 where id_almacenado = id_almacenado_p;
end
call delete_area_almacenado (2)

#select
drop procedure if exists select_area_almacenado;
create or replace procedure select_area_almacenado(id_almacenado_p int)
begin
select * from area_almacenado where id_almacenado = id_almacenado_p;
end
call select_area_almacenado (1)


-- AREA ALAMACENADO PRODUCTO ==================================================
#insert
drop  procedure insert_area_almacenado_producto
create procedure insert_area_almacenado_producto(fk_cata_prod int(11), fk_area_alma int(11))
begin
	insert into area_almacenado_producto(fk_cata_prod, fk_area_alma, estado)  values (fk_cata_prod, fk_area_alma, 1);
end
call insert_area_almacenado_producto(2,2)
select * from area_almacenado_producto;

#update
drop procedure if exists update_area_almacenado_producto
create or replace procedure update_area_almacenado_producto (in id_alma_pro int(11), fk_cata_prod int(11), fk_area_alma int(11))
begin 
	update area_almacenado_producto  set fk_cata_prod = fk_cata_prod , fk_area_alma = fk_area_alma where id_alma_prod  = id_alma_pro;
end
call update_area_almacenado_producto(4,1,1)

#delete
drop procedure if exists delete_area_almacenado_producto;
create or replace procedure delete_area_almacenado_producto(id_alma_pro int(11))
begin 
	update area_almacenado_producto  set estado =0 where id_alma_prod = id_alma_pro;
end
call delete_area_almacenado_producto (4)

#select
drop procedure if exists select_area_almacenado_producto;
create or replace procedure select_area_almacenado_producto(id_alma_pro int)
begin
select * from area_almacenado_producto where id_alma_prod  = id_alma_pro;
end
call select_area_almacenado_producto (2)

-- END ERICK =================================================


-- PRESENTACION CATALOGO PRODUCTO ==================================================
-- insertar
drop  procedure insert_presentacion_catalogo_producto 
create procedure insert_presentacion_catalogo_producto (fk_cata_prod int, fk_sub_cate int, cantidad double, fk_uni_prod int, estado int)
begin
	insert into presentacion_catalogo_producto (fk_cata_prod, fk_sub_cate, cantidad, fk_uni_prod, estado) values (fk_cata_prod, fk_sub_cate, cantidad, fk_uni_prod, 1);
end
call insert_presentacion_catalogo_producto(5,1,2,1,1)

select * from presentacion_catalogo_producto pcp

-- update
drop procedure if exists update_presentacion_catalogo_producto
create procedure update_presentacion_catalogo_producto ( in id_pres_cata_pro int(11), cata_prod int(11), sub_cate int(11), cantidad double, uni_prod int(11))
begin 
	update presentacion_catalogo_producto  set fk_cata_prod = cata_prod, fk_sub_cate = sub_cate, cantidad = cantidad, fk_unid_prod = uni_prod where id_pres_cata_prod  = id_pres_cata_pro;
end
call update_presentacion_catalogo_producto(1,5,1,2,1)

-- delete 
create procedure delete_presentacion_catalogo_producto(id_pres_cata_pro int(11))
begin 
	update presentacion_catalogo_producto set estado = 0 where id_pres_cata_prod = id_pres_cata_pro;
end
call delete_presentacion_catalogo_producto  (1)

-- select
drop procedure if exists select_presentacion_catalogo_producto;
create procedure select_presentacion_catalogo_producto(id_alma_pro int)
begin
select * from presentacion_catalogo_producto where id_alma_prod = id_alma_pro;
end
call select_presentacion_catalogo_producto (2)

-- PRECIO CATALOGO PRODUCTO ==================================================
-- insert 
drop procedure if exists insert_precio_catalogo_producto;
create or replace procedure insert_precio_catalogo_producto (fk_pres_cata_prod int, fk_unid_prod int, precio double(10,2))
begin 
	insert into precio_catalogo_producto (fk_pres_cata_prod, fk_unid_prod, precio, estado) values (fk_pres_cata_prod, fk_unid_prod, precio, 1);
end
call insert_precio_catalogo_producto ()

-- update
drop procedure if exists update_precio_catalogo_producto;
create or replace procedure update_precio_catalogo_producto (in id_prec_cata_pro int, fk_pres_cata_prod int, fk_unid_prod int, precio double(10,2))
begin 
	update precio_catalogo_producto set fk_pres_cata_prod = fk_pres_cata_prod, fk_unid_prod = fk_unid_prod, precio = precio where id_prec_cata_prod = id_prec_cata_pro; 
end 
call update_precio_catalogo_producto ()

-- delete 
drop procedure if exists delete_precio_catalogo_producto;
create or replace procedure delete_precio_catalogo_producto (in id_prec_cata_pro int)
begin 
	update precio_catalogo_producto set estado =0 where id_prec_cata_prod = id_prec_cata_pro;
end
call delete_precio_catalogo_producto ()

 -- select 
drop procedure if exists select_precio_catalogo_producto;
create procedure select_precio_catalogo_producto(id_prec_cata_pro int)
begin
select * from precio_catalogo_producto  where id_prec_cata_prod = id_prec_cata_pro;
end
call select_precio_catalogo_producto(2)


-- CLIENTE ==================================================
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
create or replace procedure update_cliente ( in id_client int, cedula varchar(11), nombre varchar(50), contacto varchar(50))
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


-- CABECERA PEDIDO ==================================================
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


-- DETALLE PEDIDO ==================================================
/**
 * Tabla: det_pedido
 * Funcion: Inserta registros
 * Argumentos: id_cab_pedido, id_producto
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
 * Funcion: Realiza borrado logico
 * Argumentos: id_det_pedido
 */
drop procedure if exists delete_detalle_pedido;
create or replace procedure delete_detalle_pedido (in id_det_pedido int)
begin
	update det_pedido set estado=0 where id_det_pedido=id_det_pedido;
end
-- Ejemplo:
call delete_detalle_pedido(1);

 


-- CABECERA FACTURA ==================================================
-- insert
drop procedure if exists insert_cabecera_factura;
create or replace procedure insert_cabecera_factura (in fk_cab_pedido int)
begin
	insert into cab_factura(fk_cab_pedido, sub_total, total, estado) values (fk_cab_pedido, 0, 0, 1);
end
call insert_cabecera_factura(1);

-- update
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

-- delete
drop procedure if exists delete_cabecera_factura;
create or replace procedure delete_cabecera_factura (in id_cab_factura int)
begin
	update cab_factura set 
		estado = 0
	where id_cab_factura = id_cab_factura ;
end

call delete_cabecera_factura(1);

-- select 
drop procedure if exists select_cabecera_factura;
create procedure select_cabecera_factura(id_cab_factura int)
begin
select * from cab_factura where id_cab_factura = id_cab_factura;
end
call select_cabecera_factura (1)


-- DETALLE FACTURA ==================================================
/* Tabla: det_factura
 * Funcion: insertar producto a una factura
 * Parametros: id_cab_factura, id_producto, cantidad, total
 */
drop procedure if exists insert_detalle_factura;
create or replace procedure insert_detalle_factura (in fk_cab_factura int, fk_producto int, cantidad int, total decimal(12, 2))
begin
	insert into det_factura(fk_cab_factura, fk_producto, cantidad, total, estado) 
	values (fk_cab_factura, fk_producto, cantidad, total, 1);
end
-- Ejemplo
call insert_detalle_factura(1, 1, 2, 1);


/* Tabla: det_factura
 * Funcion: insertar los productos a una factura
 * Parametros: id_cab_factura
 */
drop procedure if exists insert_detalles_factura;
create or replace procedure insert_detalles_factura(in id_cab_factura int)
begin
	declare var_producto integer;
	declare var_cantidad integer;
	declare var_total decimal(12,2);
	declare var_final integer default 0;
	declare var_id_cab_pedido int default (select fk_cab_pedido from cab_factura as cf where cf.id_cab_factura=id_cab_factura);
	
	declare detalles_pedido cursor for 
		select     
			dp.fk_producto  as producto , 
			count (dp.fk_producto) as cantidad,  
			(count (dp.fk_producto)* pcp.precio ) as total 
		from det_pedido as dp
			inner join precio_catalogo_producto as pcp on dp.fk_producto = pcp.id_prec_cata_prod  where dp.fk_cab_pedido = var_id_cab_pedido
			group by dp.fk_producto;
	
	declare continue handler for not found set var_final = 1;

	open detalles_pedido;
		bucle: loop
			fetch detalles_pedido into var_producto, var_cantidad, var_total;
				if var_final = 1 then
					leave bucle;			
				end if;		
			
				call insert_detalle_factura (id_cab_factura, var_producto, var_cantidad, var_total);
			
		end loop bucle;
	close detalles_pedido;
end

call insert_detalles_factura();


drop procedure if exists update_detalle_factura;
create or replace procedure update_detalle_factura(in id_cab_factura int, id_producto int, var_cantidad int, var_total decimal(12, 2))
begin 
	update det_factura set cantidad=var_cantidad, total=var_total where fk_cab_factura = id_cab_factura and fk_producto =  id_producto;
end



drop procedure if exists delete_detalle_factura;
create or replace procedure delete_detalle_factura(in id_det_factura int)
begin
	update det_factura set estado=0 where id_det_factura = id_det_factura ;
end

-- Ejemplo: 
call delete_detalle_factura(1);