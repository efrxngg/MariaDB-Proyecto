#triggers o Disparadores
use proyectobd;


-- categoria ====================
drop trigger if exists on_insert_categoria;
create or replace trigger on_insert_categoria after update on categoria
for each row 
begin 
	insert into categoria_auditoria(id_cate, descripcion, estado, accion, usuario)
	values (new.id_cate, new.descripcion, new.estado, "insert", user());
end

-- 
drop trigger if exists on_update_categoria;
create or replace trigger on_update_categoria before update on categoria
for each row 
begin 
	insert into categoria_auditoria(id_cate, descripcion, estado, accion, usuario)
	values (old.id_cate, old.descripcion, old.estado, "update", user());
end
-- 

drop trigger if exists on_delete_categoria;
create or replace trigger on_delete_categoria before update on categoria
for each row 
begin 
	insert into categoria_auditoria(id_cate, descripcion, estado, accion, usuario)
	values (old.id_cate, old.descripcion, old.estado, "delete", user());
end

-- subCategoria ==================================
drop trigger if exists on_insert_sub_categorias;
create or replace trigger on_insert_sub_categorias after update on sub_categorias
for each row
begin 
	insert into sub_categoria_auditoria (id_sub_cate, fk_categoria, descripcion, estado, accion, usuario)
	values (new.id_sub_cate, new.fk_categoria, new.descripcion, new.estado, "insert", user());
end
-- 
drop trigger if exists on_update_sub_categorias;
create or replace trigger on_update_sub_categorias before update on sub_categorias
for each row 
begin 
	insert into sub_categoria_auditoria (id_sub_cate, fk_categoria, descripcion, estado, accion, usuario)
	values (old.id_sub_cate, old.fk_categoria, old.descripcion, old.estado, "update", user());
end
-- 

drop trigger if exists on_delete_sub_categoria;
create or replace trigger on_delete_sub_categoria before update on sub_categorias
for each row 
begin 
	insert into sub_categoria_auditoria (id_sub_cate, fk_categoria, descripcion, estado, accion, usuario)
	values (old.id_sub_cate, old.fk_categoria, old.descripcion, old.estado, "delete", user());
end

-- unidad_producto ==========================================
drop trigger if exists on_insert_unidad_producto;
create or replace trigger on_insert_unidad_producto after update on unidad_producto
for each row
begin 
	insert into unidad_producto_auditoria (id_unid_prod, sigla, descripcion, estado, accion, usuario)
	values (new.id_unid_prod, new.sigla, new.descripcion, new.estado, "insert", user());
end
-- 
drop trigger if exists on_update_unidad_producto;
create or replace trigger on_update_unidad_producto before update on unidad_producto
for each row 
begin 
	insert into unidad_producto_auditoria (id_unid_prod, sigla, descripcion, estado, accion, usuario)
	values (old.id_unid_prod, old.sigla, old.descripcion, old.estado, "update", user());
end
-- 
drop trigger if exists on_delete_unidad_producto;
create or replace trigger on_delete_unidad_producto before update on unidad_producto
for each row 
begin 
	insert into unidad_producto_auditoria (id_unid_prod, sigla, descripcion, estado, accion, usuario)
	values (old.id_unid_prod, old.sigla, old.descripcion, old.estado, "delete", user());
end

-- area_almacenado =======================================
drop trigger if exists on_insert_area_almacenado;
create or replace trigger on_insert_area_almacenado after update on area_almacenado
for each row
begin 
	insert into area_almacenado_auditoria (id_almacenado, descripcion, estado, accion, usuario)
	values (new.id_almacenado, new.descripcion, new.estado, "insert", user());
end
-- 
drop trigger if exists on_update_area_almacenado;
create or replace trigger on_update_area_almacenado before update on area_almacenado
for each row 
begin 
	insert into area_almacenado_auditoria (id_almacenado, descripcion, estado, accion, usuario)
	values (old.id_almacenado, old.descripcion, old.estado, "update", user());
end
-- 
drop trigger if exists on_delete_area_almacenado;
create or replace trigger on_delete_area_almacenado before update on area_almacenado
for each row 
begin 
	insert into area_almacenado_auditoria (id_almacenado, descripcion, estado, accion, usuario)
	values (old.id_almacenado, old.descripcion, old.estado, "delete", user());
end

-- area_almacenado_producto ===============================
drop trigger if exists on_insert_area_almacenado_producto;
create or replace trigger on_insert_area_almacenado_producto after update on area_almacenado_producto
for each row
begin 
	insert into area_almacenado_producto_auditoria (id_alma_prod, fk_cata_prod, fk_area_alma, estado, accion, usuario)
	values (new.id_alma_prod, new.fk_cata_prod, new.fk_area_alma, new.estado, "insert", user());
end
-- 
drop trigger if exists on_update_area_almacenado_producto;
create or replace trigger on_update_area_almacenado_producto before update on area_almacenado_producto
for each row 
begin 
	insert into area_almacenado_producto_auditoria (id_alma_prod, fk_cata_prod, fk_area_alma, estado, accion, usuario)
	values (old.id_alma_prod, old.fk_cata_prod, old.fk_area_alma, old.estado, "update", user());
end
-- 
drop trigger if exists on_delete_area_almacenado_producto;
create or replace trigger on_delete_area_almacenado_producto before update on area_almacenado_producto
for each row 
begin 
	insert into area_almacenado_producto_auditoria (id_alma_prod, fk_cata_prod, fk_area_alma, estado, accion, usuario)
	values (old.id_alma_prod, old.fk_cata_prod, old.fk_area_alma, old.estado, "delete", user());
end

-- catalogo_producto =============================
drop trigger if exists on_insert_catalogo_producto;
create or replace trigger on_insert_catalogo_producto after update on catalogo_producto
for each row
begin 
	insert into catalogo_producto_auditoria (id_cata_prod, descripcion, estado, accion, usuario)
	values (new.id_cata_prod, new.descripcion, new.estado, "insert", user());
end
-- 
drop trigger if exists on_update_catalogo_producto;
create or replace trigger on_update_catalogo_producto before update on catalogo_producto
for each row 
begin 
	insert into catalogo_producto_auditoria (id_cata_prod, descripcion, estado, accion, usuario)
	values (old.id_cata_prod, old.descripcion, old.estado, "update", user());
end
-- 
drop trigger if exists on_delete_catalogo_producto;
create or replace trigger on_delete_catalogo_producto before update on catalogo_producto
for each row 
begin 
	insert into catalogo_producto_auditoria (id_cata_prod, descripcion, estado, accion, usuario)
	values (old.id_cata_prod, old.descripcion, old.estado, "delete", user());
end

-- presentacion_catalogo_producto================================
drop trigger if exists on_insert_presentacion_catalogo_producto;
create or replace trigger on_insert_presentacion_catalogo_producto after update on presentacion_catalogo_producto
for each row
begin 
	insert into presentacion_catalogo_producto_auditoria (id_pres_cata_prod, fk_cata_prod, fk_sub_cate, cantidad, fk_unid_prod, estado, accion, usuario)
	values (new.id_pres_cata_prod, new.fk_cata_prod, new.fk_sub_cate, new.cantidad, new.fk_unid_prod, new.estado, "insert", user());
end
-- 
drop trigger if exists on_update_presentacion_catalogo_producto;
create or replace trigger on_update_presentacion_catalogo_producto before update on presentacion_catalogo_producto
for each row 
begin 
	insert into presentacion_catalogo_producto_auditoria (id_pres_cata_prod, fk_cata_prod, fk_sub_cate, cantidad, fk_unid_prod, estado, accion, usuario)
	values (old.id_pres_cata_prod, old.fk_cata_prod, old.fk_sub_cate, old.cantidad, old.fk_unid_prod, old.estado, "update", user());
end
-- 
drop trigger if exists on_delete_presentacion_catalogo_producto;
create or replace trigger on_delete_presentacion_catalogo_producto before update on presentacion_catalogo_producto
for each row 
begin 
	insert into presentacion_catalogo_producto_auditoria (id_pres_cata_prod, fk_cata_prod, fk_sub_cate, cantidad, fk_unid_prod, estado, accion, usuario)
	values (old.id_pres_cata_prod, old.fk_cata_prod, old.fk_sub_cate, old.cantidad, old.fk_unid_prod, old.estado, "delete", user());
end

-- precio_catalogo_producto =============================
drop trigger if exists on_insert_precio_catalogo_producto;
create or replace trigger on_insert_precio_catalogo_producto after update on precio_catalogo_producto
for each row
begin 
	insert into precio_catalogo_producto_auditoria (id_prec_cata_prod, fk_pres_cata_prod, fk_unid_prod, precio, estado, accion, usuario)
	values (new.id_prec_cata_prod, new.fk_pres_cata_prod, new.fk_unid_prod, new.fk_unid_prod, new.precio, new.estado, "insert", user());
end
-- 
drop trigger if exists on_update_precio_catalogo_producto;
create or replace trigger on_update_precio_catalogo_producto before update on precio_catalogo_producto
for each row 
begin 
	insert into precio_catalogo_producto_auditoria (id_prec_cata_prod, fk_pres_cata_prod, fk_unid_prod, precio, estado, accion, usuario)
	values (old.id_prec_cata_prod, old.fk_pres_cata_prod, old.fk_unid_prod, old.fk_unid_prod, old.precio, old.estado, "update", user());
end
-- 
drop trigger if exists on_delete_precio_catalogo_producto;
create or replace trigger on_delete_precio_catalogo_producto before update on precio_catalogo_producto
for each row 
begin 
	insert into precio_catalogo_producto_auditoria (id_prec_cata_prod, fk_pres_cata_prod, fk_unid_prod, precio, estado, accion, usuario)
	values (old.id_prec_cata_prod, old.fk_pres_cata_prod, old.fk_unid_prod, old.fk_unid_prod, old.precio, old.estado, "delete", user());
end

-- det_pedido ========================================
drop trigger if exists on_insert_det_pedido;
create or replace trigger on_insert_det_pedido after update on det_pedido
for each row
begin 
	insert into det_pedido_auditoria (id_det_pedido, fk_cb_factura, fk_producto, estado, accion, usuario)
	values (new.id_det_pedido, new.fk_cab_pedido, new.fk_producto, new.estado, "insert", user());
end
-- 
drop trigger if exists on_update_det_pedido;
create or replace trigger on_update_det_pedido before update on det_pedido
for each row 
begin 
	insert into det_pedido_auditoria (id_det_pedido, fk_cb_factura, fk_producto, estado, accion, usuario)
	values (old.id_det_pedido, old.fk_cab_pedido, old.fk_producto, old.estado, "update", user());
end
-- 
drop trigger if exists on_delete_det_pedido;
create or replace trigger on_delete_det_pedido before update on det_pedido
for each row 
begin 
	insert into det_pedido_auditoria (id_det_pedido, fk_cb_factura, fk_producto, estado, accion, usuario)
	values (old.id_det_pedido, old.fk_cab_pedido, old.fk_producto, old.estado, "delete", user());
end

-- det_factura =============================================
drop trigger if exists on_insert_det_factura;
create or replace trigger on_insert_det_factura after update on det_factura
for each row
begin 
	insert into det_factura_auditoria (id_det_factura, fk_cb_factura, fk_producto, cantidad, total, estado, accion, usuario)
	values (new.id_det_factura, new.fk_cab_factura, new.fk_producto, new.cantidad, new.total,  new.estado, "insert", user());
end
-- 
drop trigger if exists on_update_det_factura;
create or replace trigger on_update_det_factura before update on det_factura
for each row 
begin 
	insert into det_factura_auditoria (id_det_factura, fk_cb_factura, fk_producto, cantidad, total, estado, accion, usuario)
	values (old.id_det_factura, old.fk_cab_factura, old.fk_producto, old.cantidad, old.total,  old.estado, "update", user());
end
-- 
drop trigger if exists on_delete_det_factura;
create or replace trigger on_delete_det_factura before update on det_factura
for each row 
begin 
	insert into det_factura_auditoria (id_det_factura, fk_cb_factura, fk_producto, cantidad, total, estado, accion, usuario)
	values (old.id_det_factura, old.fk_cab_factura, old.fk_producto, old.cantidad, old.total,  old.estado, "delete", user());
end

-- cab_pedido ============================================
drop trigger if exists on_insert_cab_pedido;
create or replace trigger on_insert_cab_pedido after update on cab_pedido
for each row
begin 
	insert into cab_pedido_auditoria (id_cab_pedido, fk_cliente, estado, accion, usuario)
	values (new.id_cab_pedido, new.fk_cliente, new.estado, "insert", user());
end
-- 
drop trigger if exists on_update_cab_pedido;
create or replace trigger on_update_cab_pedido before update on cab_pedido
for each row 
begin 
	insert into cab_pedido_auditoria (id_cab_pedido, fk_cliente, estado, accion, usuario)
	values (old.id_cab_pedido, old.fk_cliente, old.estado, "update", user());
end
-- 
drop trigger if exists on_delete_cab_pedido;
create or replace trigger on_delete_cab_pedido before update on cab_pedido
for each row 
begin 
	insert into cab_pedido_auditoria (id_cab_pedido, fk_cliente, estado, accion, usuario)
	values (old.id_cab_pedido, old.fk_cliente, old.estado, "delete", user());
end

-- cab_factura =======================================
drop trigger if exists on_insert_cab_factura;
create or replace trigger on_insert_cab_factura after update on cab_factura
for each row
begin 
	insert into cab_factura_auditoria (id_cab_factura, fk_cab_pedido, sub_total, total, fecha_creacion, estado, accion, usuario)
	values (new.id_cab_factura, new.fk_cab_pedido, new.sub_total, new.total, new.fecha_creacion,  new.estado, "insert", user());
end
-- 
drop trigger if exists on_update_cab_factura;
create or replace trigger on_update_cab_factura before update on cab_factura
for each row 
begin 
	insert into cab_factura_auditoria (id_cab_factura, fk_cab_pedido, sub_total, total, fecha_creacion, estado, accion, usuario)
	values (old.id_cab_factura, old.fk_cab_pedido, old.sub_total, old.total, old.fecha_creacion,  old.estado, "update", user());
end
-- 
drop trigger if exists on_delete_cab_factura;
create or replace trigger on_delete_cab_factura before update on cab_factura
for each row 
begin 
	insert into cab_factura_auditoria (id_cab_factura, fk_cab_pedido, sub_total, total, fecha_creacion, estado, accion, usuario)
	values (old.id_cab_factura, old.fk_cab_pedido, old.sub_total, old.total, old.fecha_creacion,  old.estado, "delete", user());
end

-- Cliente ===============================

drop trigger if exists on_insert_cliente_auditoria;
create or replace trigger on_insert_cliente_auditoria after update on cliente
for each row 
begin 
	insert into cliente_auditoria(id_cliente, cedula, nombre, contacto, estado, accion, usuario)
	values (new.id_cliente, new.cedula, new.nombre, new.contacto, new.estado, "insert", user());
end

-- 
drop trigger if exists on_update_cliente_auditoria;
create or replace trigger on_update_cliente_auditoria before update on cliente
for each row 
begin 
	insert into cliente_auditoria(id_cliente, cedula, nombre, contacto, estado, accion, usuario)
	values (old.id_cliente, old.cedula, old.nombre, old.contacto, old.estado, "update", user());
end

-- 
drop trigger if exists on_delete_cliente_auditoria;
create or replace trigger on_insert_cliente_auditoria before update on cliente
for each row 
begin 
	insert into cliente_auditoria(id_cliente, cedula, nombre, contacto, estado, accion, usuario)
	values (old.id_cliente, old.cedula, old.nombre, old.contacto, old.estado, "delete", user());
end
