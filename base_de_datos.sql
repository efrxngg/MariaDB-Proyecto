-- TABLAS PROYECTO DB ==================================================================
drop database if exists proyectobd;
create database proyectobd ;
 use proyectobd;


drop table if exists categoria;
create or replace table categoria (
    id_cate int(11) not null auto_increment,
    descripcion varchar(255) not null,
    estado int not null,
    primary key (id_cate)
);


drop table if exists sub_categorias;
create or replace table sub_categorias (
    id_sub_cate int(11) not null auto_increment,
    fk_categoria int(11) not null,
    descripcion varchar(255) not null,
    estado int not null,
	constraint fk_categoria_sub_categoria foreign key (fk_categoria) 
	references categoria (id_cate),
	primary key (id_sub_cate)
);


drop table if exists unidad_producto;
create or replace table unidad_producto(
  id_unid_prod int(11) not null auto_increment,
  sigla varchar(5) not null,
  descripcion varchar(255) not null,
  estado int not null,
  primary key (id_unid_prod)
);


drop table if exists catalogo_producto;
create or replace table catalogo_producto (
    id_cata_prod int(11) not null auto_increment,
    descripcion varchar(255) not null,
    estado int not null,
    primary key (id_cata_prod)
);


drop table if exists area_almacenado;
create or replace table area_almacenado(
	id_almacenado int not null auto_increment,
	descripcion varchar(50) not null,
	estado int not null,
	primary key (id_almacenado)
);


drop table if exists area_almacenado_producto;
create or replace table area_almacenado_producto (
    id_alma_prod int(11) not null auto_increment,
    fk_cata_prod int(11) not null,
    fk_area_alma int(11) not null,
    estado int not null,
    constraint area_almacenado_producto_ibfk_1 foreign key (fk_cata_prod) 
    references catalogo_producto (id_cata_prod),
    constraint area_almacenado_producto_ibfk_2 foreign key (fk_area_alma) 
    references area_almacenado (id_almacenado),
    primary key (id_alma_prod)
);


drop table if exists presentacion_catalogo_producto;
create or replace table presentacion_catalogo_producto (
    id_pres_cata_prod int(11) not null auto_increment,
    fk_cata_prod  int(11) not null,
    fk_sub_cate int(11) not null,
    cantidad double not null,
    fk_unid_prod int(11) not null,
    estado int not null,
    constraint fk_cata_prod_pres_cata_prod foreign key (fk_cata_prod) 
    references catalogo_producto(id_cata_prod),
    constraint fk_sub_cate_pres_cata_prod foreign key (fk_sub_cate) 
    references sub_categorias (id_sub_cate),
    constraint fk_unid_prod_pres_cata_prod foreign key (fk_unid_prod) 
    references unidad_producto(id_unid_prod),
    primary key (id_pres_cata_prod)
);


drop table if exists precio_catalogo_producto;
create or replace table precio_catalogo_producto (
    id_prec_cata_prod int(11) not null auto_increment,
    fk_pres_cata_prod int(11) not null,
    fk_unid_prod int(11) not null,
    precio double(10, 2) not null,
    estado int not null,
    constraint fk_pres_cata_prod_prec_cata_prod foreign key (fk_pres_cata_prod) 
    references presentacion_catalogo_producto (id_pres_cata_prod),
    constraint fk_unid_prod_prec_cata_prod foreign key(fk_unid_prod) 
    references unidad_producto(id_unid_prod),
    primary key (id_prec_cata_prod)
);


drop table if exists cliente;
create or replace table cliente(
	id_cliente int(11) not null auto_increment,
	cedula varchar(11) not null,
	nombre varchar(50) not null,
	contacto varchar(50) not null,
	estado int(11)not null,
	primary key (id_cliente)
);


drop table if exists cab_pedido;
create or replace table cab_pedido(
	id_cab_pedido int not null auto_increment,
	fk_cliente int not null,
	estado int  not null,
	constraint fk_cliente_cab_factura foreign key(fk_cliente) 
	references cliente(id_cliente),
	primary key(id_cab_pedido)
); 


drop table if exists det_pedido;
create or replace table det_pedido(
	id_det_pedido int not null auto_increment,
	fk_cab_pedido int not null,
	fk_producto int not null,
	estado int not null,
	constraint fk_cab_pedido_det_pedido foreign key(fk_cab_pedido)
	references cab_pedido(id_cab_pedido),
	constraint fk_precio_catalogo_producto_det_pedido foreign key(fk_producto)
	references precio_catalogo_producto(id_prec_cata_prod),
	primary key(id_det_pedido)
);


drop table if exists cab_factura;
create or replace table cab_factura(
	id_cab_factura int not null auto_increment,
	fk_cab_pedido int not null,
	sub_total decimal(10, 2) not null,
 	total decimal(10, 2) not null,
	fecha_creacion timestamp default current_timestamp,
	estado int not null,
	constraint fk_cab_pedido_cab_factura foreign key(fk_cab_pedido) 
	references cab_pedido(id_cab_pedido),
	primary key(id_cab_factura)
);


drop table if exists det_factura;
create or replace table det_factura(
	id_det_factura int not null auto_increment,
	fk_cab_factura int not null,
	fk_producto int not null,
	cantidad int not null,
    total decimal(10, 2),
    estado int not null,
	constraint fk_cab_factura_det_factura foreign key(fk_cab_factura) 
	references cab_factura(id_cab_factura),
	constraint fk_precio_catalogo_producto_det_factura foreign key(fk_producto) 
	references precio_catalogo_producto(id_prec_cata_prod),
	primary key(id_det_factura)
);


-- TABLAS AUDITORIA ==================================================================
drop table if exists cliente_auditoria;
create or replace table cliente_auditoria(
	id_cliente_auditoria int not null auto_increment,
	id_cliente int not null,
	cedula varchar(11) not null,
	nombre varchar(50) not null,
	contacto varchar(50) not null,
	estado int not null,
	accion varchar(250) not null,
	usuario varchar(250) not null,
	fecha_modificacion datetime default current_timestamp,
	primary key(id_cliente_auditoria)
);


drop table if exists det_factura_auditoria;
create or replace table det_factura_auditoria(
	id_det_factura_auditoria int not null auto_increment,
	id_det_factura int not null,
	fk_cb_factura int not null,
	fk_producto int not null,
	cantidad int not null,
	total decimal(10, 2) not null,
	estado int not null,
	accion varchar(250) not null,
	usuario varchar(250) not null,
	fecha_modificacion datetime default current_timestamp,
	primary key(id_det_factura_auditoria)
);


drop table if exists det_pedido_auditoria;
create or replace table det_pedido_auditoria(
	id_det_pedido_auditoria int not null auto_increment,
	id_det_pedido int not null,
	fk_cb_factura int not null,
	fk_producto int not null,
	estado int not null,
	accion varchar(250) not null,
	usuario varchar(250) not null,
	fecha_modificacion datetime default current_timestamp,
	primary key(id_det_pedido_auditoria)
);


drop table if exists precio_catalogo_producto_auditoria;
create or replace table precio_catalogo_producto_auditoria(
	id_prec_cata_prod_auditoria int not null auto_increment,
	id_prec_cata_prod int not null,
	fk_pres_cata_prod int not null,
	fk_unid_prod int not null,
	precio decimal(12, 2) not null,
	estado int not null,
	accion varchar(250) not null,
	usuario varchar(250) not null,
	fecha_modificacion datetime default current_timestamp,
	primary key(id_prec_cata_prod_auditoria)
);


drop table if exists presentacion_catalogo_producto_auditoria;
create or replace table presentacion_catalogo_producto_auditoria(
	id_pres_cata_prod_auditoria int not null auto_increment,
	id_pres_cata_prod int not null,
	fk_cata_prod int not null,
	fk_sub_cate int not null,
	cantidad int not null,
	fk_unid_prod int not null,
	estado int not null,
	accion varchar(250) not null,
	usuario varchar(250) not null,
	fecha_modificacion datetime default current_timestamp,
	primary key(id_pres_cata_prod_auditoria)
);


drop table if exists sub_categoria_auditoria;
create or replace table sub_categoria_auditoria(
	id_sub_cate_auditoria int not null auto_increment,
	id_sub_cate int not null,
	fk_categoria int not null,
	descripcion varchar(255),
	estado int not null,
	accion varchar(250) not null,
	usuario varchar(250) not null,
	fecha_modificacion datetime default current_timestamp,
	primary key(id_sub_cate_auditoria)
);


drop table if exists unidad_producto_auditoria;
create or replace table unidad_producto_auditoria(
	id_unid_prod_auditoria int not null auto_increment,
	id_unid_prod int not null,
	sigla int not null,
	descripcion varchar(255),
	estado int not null,
	accion varchar(250) not null,
	usuario varchar(250) not null,
	fecha_modificacion datetime default current_timestamp,
	primary key(id_unid_prod_auditoria)
);


-- campo accion


drop table if exists area_almacenado_auditoria;
create or replace table area_almacenado_auditoria(
	id_area_almacenado_auditoria int not null auto_increment,
	id_almacenado int not null,
	descripcion varchar(20) not null,
	estado int not null,
	accion varchar(250) not null,
	usuario varchar(250) not null,
	fecha_modificacion datetime default current_timestamp,
	primary key (id_area_almacenado_auditoria)
);


drop table if exists area_almacenado_producto_auditoria;
create or replace table area_almacenado_producto_auditoria(
	id_area_almacenado_producto_auditoria int not null auto_increment,
    id_alma_prod int(11) not null,
    fk_cata_prod int(11) not null,
    fk_area_alma int(11) not null,
    estado int not null,
    accion varchar(250) not null,
	usuario varchar(250) not null,
	fecha_modificacion datetime default current_timestamp,
	primary key (id_area_almacenado_producto_auditoria)
);


drop table if exists cab_factura_auditoria;
create or replace table cab_factura_auditoria(
	id_cab_factura_auditoria int not null auto_increment,
	id_cab_factura int not null,
	fk_cab_pedido int not null,
	sub_total decimal(10, 2) not null,
 	total decimal(10, 2) not null,
	fecha_creacion timestamp default current_timestamp,
	estado int not null,
	accion varchar(250) not null,
	usuario varchar(250) not null,
	fecha_modificacion datetime default current_timestamp,
	primary key(id_cab_factura_auditoria)
);


drop table if exists cab_pedido_auditoria;
create or replace table cab_pedido_auditoria(
	id_cab_pedido_auditoria int not null auto_increment,
	id_cab_pedido int not null,
	fk_cliente int not null,
	estado int  not null,
	accion varchar(250) not null,
	usuario varchar(250) not null,
	fecha_modificacion datetime default current_timestamp,
	primary key(id_cab_pedido_auditoria)
);


drop table if exists catalogo_producto_auditoria;
create or replace table catalogo_producto_auditoria(
	id_catalogo_producto_auditoria int not null auto_increment,
    id_cata_prod int(11) not null,
    descripcion varchar(255) not null,
    estado int not null,
    accion varchar(250) not null,
	usuario varchar(250) not null,
	fecha_modificacion datetime default current_timestamp,
	primary key(id_catalogo_producto_auditoria)
);


drop table if exists categoria_auditoria;
create or replace table categoria_auditoria(
	id_categoria_auditoria int not null auto_increment,
    id_cate int(11) not null,
    descripcion varchar(255) not null,
    estado int not null,
    accion varchar(250) not null,
	usuario varchar(250) not null,
	fecha_modificacion datetime default current_timestamp,
	primary key(id_categoria_auditoria)
);
