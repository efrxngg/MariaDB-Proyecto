-- INSERTS ========================================================================= 
use proyectobd;
-- CATEGORIA
call insert_categoria('viveres');
select * from categoria;


-- SUB CATEGORIA
call insert_sub_categoria ( 1,'jugos');
select * from sub_categorias;


-- UNIDAD PRODUCTO
call insert_unidad_producto('UD','Unidad');
call insert_unidad_producto('L','Litros');
call insert_unidad_producto('ML','Mililitros');
select * from unidad_producto;


-- CATALOGO PRODUCTO
insert into catalogo_producto(descripcion, estado) values("Coca Cola",1), ("Cola Oro",1), ("Cola Gallito",1), ("Big Cola",1), ("Cola Limon",1), ("Cola Pi�a",1);
select * from catalogo_producto;


-- AREA ALMACENADO
insert into area_almacenado(descripcion, estado) values("ambiente",1);
select * from area_almacenado;


-- AREA ALMACENADO PRODUCTO
insert into area_almacenado_producto(fk_cata_prod, fk_area_alma, estado) values(1, 1,1), (2, 1,1), (3, 1,1), (4, 1,1), (5, 1,1), (6, 1,1);
select * from area_almacenado_producto;


-- PRESENTACION CATALOGO PRODUCTO
insert into presentacion_catalogo_producto(fk_cata_prod, fk_sub_cate, cantidad, fk_unid_prod, estado) values(1, 1, 300, 3,1), (2, 1, 1, 2,1), (3, 1, 300, 3,1), (4, 1, 1, 2,1), (5, 1, 300, 3,1), (6, 1, 1, 2,1);
select * from presentacion_catalogo_producto;


-- PRECIO CATALOGO PRODUCTO
insert into precio_catalogo_producto(fk_pres_cata_prod, fk_unid_prod, precio, estado) values(1, 1, 0.5,1), (2, 1, 2,1), (3, 1, 0.5,1), (4, 1, 2,1), (5, 1, 0.5,1), (6, 1, 2,1);
select * from precio_catalogo_producto;


-- CLIENTE 
call insert_cliente('0954943114','Efren Galarza','0997188086');
call insert_cliente('0954943116','Perro Negro','0997188087');
call insert_cliente('0954943118','Giapierre Novillo','0997188089');
select * from cliente;


-- CABECERA PEDIDO
call insert_cabecera_pedido(1);
call insert_cabecera_pedido(2);
call insert_cabecera_pedido(3);
select * from cab_pedido;


-- DETALLE PEDIDO : id_cab_pedido, id_producto
call insert_detalle_pedido(1, 1);
call insert_detalle_pedido(1, 2);
call insert_detalle_pedido(1, 3);
call insert_detalle_pedido(1, 1);
call insert_detalle_pedido(1, 4);
call insert_detalle_pedido(1, 5);

call insert_detalle_pedido(2, 1);
call insert_detalle_pedido(2, 1);
call insert_detalle_pedido(2, 3);

call insert_detalle_pedido(3, 1);
call insert_detalle_pedido(3, 2);
call insert_detalle_pedido(3, 3);
call insert_detalle_pedido(3, 3);


select * from det_pedido;


-- CABECERA FACTURA
call insert_cabecera_factura(1);
call insert_cabecera_factura(2);
call insert_cabecera_factura(3);

select * from cab_factura;


-- DETALLE FACTURA
call update_change_detalle_factura(1);
call update_change_detalle_factura(2);
call update_change_detalle_factura(3);

call update_final_cab_factura (1);

select * from det_factura df ;
truncate table  cab_factura;



