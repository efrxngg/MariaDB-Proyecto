-- INSERTS ========================================================================= 
use proyectobd;
-- CATEGORIA: descripcion
call insert_categoria('viveres');
select * from categoria;


-- SUB CATEGORIA: id_categoria, descripcion
call insert_sub_categoria ( 1,'jugos');
select * from sub_categorias;


-- UNIDAD PRODUCTO: sigla, descripcion
call insert_unidad_producto('UD','Unidad');
call insert_unidad_producto('L','Litros');
call insert_unidad_producto('ML','Mililitros');
select * from unidad_producto;


-- CATALOGO PRODUCTO: descripcion
call insert_catalogo_producto("Coca Cola");
call insert_catalogo_producto("Cola Oro");
call insert_catalogo_producto("Cola Gallito");
call insert_catalogo_producto("Big Cola");
call insert_catalogo_producto("Cola Limon");
call insert_catalogo_producto("Cola Piña");

call select_catalogo_producto();


-- AREA ALMACENADO: descripcion
call insert_area_almacenado("ambiente");
select * from area_almacenado;


-- AREA ALMACENADO PRODUCTO: id_cata_prod, id_area_alma
call insert_area_almacenado_producto(1, 1);
call insert_area_almacenado_producto(2, 1);
call insert_area_almacenado_producto(3, 1);
call insert_area_almacenado_producto(4, 1);
call insert_area_almacenado_producto(5, 1);
call insert_area_almacenado_producto(6, 1);

select * from area_almacenado_producto;


-- PRESENTACION CATALOGO PRODUCTO: id_cata_prod, sub_cate, cantidad, id_unidad
call insert_presentacion_catalogo_producto(1, 1, 300, 3);
call insert_presentacion_catalogo_producto(2, 1, 1, 2);
call insert_presentacion_catalogo_producto(3, 1, 300, 3);
call insert_presentacion_catalogo_producto(4, 1, 1, 2);
call insert_presentacion_catalogo_producto(5, 1, 300, 3);
call insert_presentacion_catalogo_producto(6, 1, 1, 2);

call select_presentacion_catalogo_producto();


-- PRECIO CATALOGO PRODUCTO: id_presentacion_cata_prod, id_unid, precio
call insert_precio_catalogo_producto(1, 1, 0.5);
call insert_precio_catalogo_producto(2, 1, 2);
call insert_precio_catalogo_producto(3, 1, 0.5);
call insert_precio_catalogo_producto(4, 1, 2);
call insert_precio_catalogo_producto(5, 1, 0.5);
call insert_precio_catalogo_producto(6, 1, 2);

call select_precio_catalogo_producto();

-- CLIENTE: cedula, nombre, numero
call insert_cliente('0954943114','Efren Galarza','0997188086');
call insert_cliente('0954943116','Perro Negro','0997188087');
call insert_cliente('0954943118','Giapierre Novillo','0997188089');

call select_cliente();


-- CABECERA PEDIDO : id_cliente
call insert_cabecera_pedido(1);
call insert_cabecera_pedido(2);
call insert_cabecera_pedido(3);

call select_cab_pedido();

-- DETALLE PEDIDO : id_cab_pedido, id_precio_cata_prod
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

call select_detalle_pedido();


-- CABECERA FACTURA: id_cab_pedido
call insert_cabecera_factura(1);
call insert_cabecera_factura(2);
call insert_cabecera_factura(3);

call select_cab_factura(1);



-- DETALLE FACTURA: id_cab_factura
call update_change_detalle_factura(1);
call update_change_detalle_factura(2);
call update_change_detalle_factura(3);

call select_detalle_factura(1); 


-- Cerrar Factura: id_cab_factura
call update_final_cab_factura (1);

