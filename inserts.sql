-- INSERTS ========================================================================= 
use proyectobd;
-- CATEGORIA: descripcion
call insert_categoria('Viveres');
call insert_categoria('Electrodomesticos');
call insert_categoria('Muebles');
call insert_categoria('Tecnologia');
select * from categoria;


-- SUB CATEGORIA: id_categoria, descripcion
call insert_sub_categoria ( 1,'Bebibas');
call insert_sub_categoria ( 1,'Snacks');
call insert_sub_categoria ( 1,'Vegetales');
call insert_sub_categoria ( 2,'Lavanderia');
call insert_sub_categoria ( 2,'Cocina');
call insert_sub_categoria ( 2,'Diversion');
call insert_sub_categoria ( 3,'Cuartos');
call insert_sub_categoria ( 3,'Salas');
call insert_sub_categoria ( 3,'Patio');
call insert_sub_categoria ( 1,'Salsas');
call insert_sub_categoria ( 4,'Computacion');
call select_sub_categoria();



-- UNIDAD PRODUCTO: sigla, descripcion
call insert_unidad_producto('UD','Unidad');
call insert_unidad_producto('L','Litros');
call insert_unidad_producto('ML','Mililitros');
call insert_unidad_producto('LB','Libras');
call insert_unidad_producto('KG','Kilogramos');
call insert_unidad_producto('G','Gramos');

select * from unidad_producto;


-- CATALOGO PRODUCTO: descripcion
call insert_catalogo_producto("Coca Cola");
call insert_catalogo_producto("Cola Oro");
call insert_catalogo_producto("Cola Gallito");
call insert_catalogo_producto("Big Cola");
call insert_catalogo_producto("Cola Limon");
call insert_catalogo_producto("Cola Piña");
call insert_catalogo_producto("Nevera Sansumg");
call insert_catalogo_producto("Cocina de 4 Quemadores");
call insert_catalogo_producto("Cocineta");
call insert_catalogo_producto("Neverita");
call insert_catalogo_producto("Mueble L");
call insert_catalogo_producto("Mueble Futbolero");
call insert_catalogo_producto("Computador");
call insert_catalogo_producto("Laptop");
call insert_catalogo_producto("Doritos");
call insert_catalogo_producto("Ruffles");
call insert_catalogo_producto("Saritas");
call insert_catalogo_producto("Kachitos");
call insert_catalogo_producto("Tostitos");
call insert_catalogo_producto("Salsa de Queso");
call insert_catalogo_producto("Salsa de Tomate");
call insert_catalogo_producto("Salsa de Mayonesa");

call select_catalogo_producto();


-- AREA ALMACENADO: descripcion
call insert_area_almacenado("ambiente");
call insert_area_almacenado("empaquetado");
select * from area_almacenado;


-- AREA ALMACENADO PRODUCTO: id_cata_prod, id_area_alma
call insert_area_almacenado_producto(1, 1);
call insert_area_almacenado_producto(2, 1);
call insert_area_almacenado_producto(3, 1);
call insert_area_almacenado_producto(4, 1);
call insert_area_almacenado_producto(5, 1);
call insert_area_almacenado_producto(6, 1);
call insert_area_almacenado_producto(7, 2);
call insert_area_almacenado_producto(8, 2);
call insert_area_almacenado_producto(9, 2);
call insert_area_almacenado_producto(10, 2);
call insert_area_almacenado_producto(11, 2);
call insert_area_almacenado_producto(12, 2);
call insert_area_almacenado_producto(13, 2);
call insert_area_almacenado_producto(14, 2);
call insert_area_almacenado_producto(15, 1);
call insert_area_almacenado_producto(16, 1);
call insert_area_almacenado_producto(17, 1);
call insert_area_almacenado_producto(18, 1);
call insert_area_almacenado_producto(19, 1);
call insert_area_almacenado_producto(20, 1);
call insert_area_almacenado_producto(21, 1);
call insert_area_almacenado_producto(22, 1);

call select_area_alma_producto();


-- PRESENTACION CATALOGO PRODUCTO: id_cata_prod, sub_cate, cantidad, id_unidad
call insert_presentacion_catalogo_producto(1, 1, 300, 3);
call insert_presentacion_catalogo_producto(2, 1, 1, 2);
call insert_presentacion_catalogo_producto(3, 1, 300, 3);
call insert_presentacion_catalogo_producto(4, 1, 1, 2);
call insert_presentacion_catalogo_producto(5, 1, 300, 3);
call insert_presentacion_catalogo_producto(6, 1, 1, 2);
call insert_presentacion_catalogo_producto(7, 5, 1, 1);
call insert_presentacion_catalogo_producto(8, 5, 1, 1);
call insert_presentacion_catalogo_producto(9, 5, 1, 1);
call insert_presentacion_catalogo_producto(10, 5, 1, 1);
call insert_presentacion_catalogo_producto(11, 8, 1, 1);
call insert_presentacion_catalogo_producto(12, 8, 1, 1);
call insert_presentacion_catalogo_producto(13, 11, 1, 1);
call insert_presentacion_catalogo_producto(14, 11, 1, 1);
call insert_presentacion_catalogo_producto(15, 2, 295, 6);
call insert_presentacion_catalogo_producto(16, 2, 260, 6);
call insert_presentacion_catalogo_producto(17, 2, 90, 6);
call insert_presentacion_catalogo_producto(18, 2, 90, 6);
call insert_presentacion_catalogo_producto(19, 2, 195, 6);
call insert_presentacion_catalogo_producto(20, 10, 260, 6);
call insert_presentacion_catalogo_producto(21, 10, 350, 6);
call insert_presentacion_catalogo_producto(22, 10, 350, 6);

call select_presentacion_catalogo_producto();
select * from presentacion_catalogo_producto pcp ;


-- PRECIO CATALOGO PRODUCTO: id_presentacion_cata_prod, id_unid, precio
call insert_precio_catalogo_producto(1, 1, 0.5);
call insert_precio_catalogo_producto(2, 1, 2);
call insert_precio_catalogo_producto(3, 1, 0.5);
call insert_precio_catalogo_producto(4, 1, 2);
call insert_precio_catalogo_producto(5, 1, 0.5);
call insert_precio_catalogo_producto(6, 1, 2);
call insert_precio_catalogo_producto(7, 1, 599.99);
call insert_precio_catalogo_producto(8, 1, 25);
call insert_precio_catalogo_producto(9, 1, 22);
call insert_precio_catalogo_producto(10, 1, 299.99);
call insert_precio_catalogo_producto(11, 1, 724.99);
call insert_precio_catalogo_producto(12, 1, 499.99);
call insert_precio_catalogo_producto(13, 1, 0.50);
call insert_precio_catalogo_producto(14, 1, 300.50);
call insert_precio_catalogo_producto(15, 1, 799.99);
call insert_precio_catalogo_producto(16, 1, 0.5);
call insert_precio_catalogo_producto(17, 1, 0.5);
call insert_precio_catalogo_producto(18, 1, 0.5);
call insert_precio_catalogo_producto(19, 1, 0.5);
call insert_precio_catalogo_producto(20, 1, 2.75);
call insert_precio_catalogo_producto(21, 1, 1.5);
call insert_precio_catalogo_producto(22, 1, 1.5);

call select_precio_catalogo_producto();
select * from precio_catalogo_producto pcp ;

-- CLIENTE: cedula, nombre, numero
call insert_cliente('0954943114','Efren Galarza','0997188086');
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

select * from det_factura df ;
call select_detalle_factura(1); 

-- suma producto
call insert_detalle_pedido(1, 5);

-- resta producto
call delete_det_fac_and_delete_det_pedido(1, 1);

-- para actulizar cambios
call update_change_detalle_factura(1);

-- Cerrar Factura: id_cab_factura
call update_final_cab_factura (1);


-- truncates
SET FOREIGN_KEY_CHECKS = 0;
truncate table cab_pedido ;
truncate table cab_pedido_auditoria;

truncate table det_pedido ;
truncate table det_pedido_auditoria  ;

truncate table cab_factura ;
truncate table cab_factura_auditoria  ;

truncate table det_factura ;
truncate table det_factura_auditoria  ;
