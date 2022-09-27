#triggers o Disparadores

-- Cliente
use proyectobd;


drop trigger if exists on_insert_cliente_auditoria;
create or replace trigger on_insert_cliente_auditoria after update on cliente
for each row 
begin 
	insert into cliente_auditoria(id_cliente, cedula, nombre, contacto, estado, accion, usuario)
	values (new.id_cliente, new.cedula, new.nombre, new.contacto, new.estado, "insert", user());
end


drop trigger if exists on_update_cliente_auditoria;
create or replace trigger on_update_cliente_auditoria before update on cliente
for each row 
begin 
	insert into cliente_auditoria(id_cliente, cedula, nombre, contacto, estado, accion, usuario)
	values (old.id_cliente, old.cedula, old.nombre, old.contacto, old.estado, "update", user());
end


drop trigger if exists on_delete_cliente_auditoria;
create or replace trigger on_insert_cliente_auditoria before update on cliente
for each row 
begin 
	insert into cliente_auditoria(id_cliente, cedula, nombre, contacto, estado, accion, usuario)
	values (old.id_cliente, old.cedula, old.nombre, old.contacto, old.estado, "delete", user());
end





-- inserts
insert into categoria(descripcion, estado) values("viveres",1);
insert into sub_categorias(fk_categoria, descripcion, estado) values (1, "bebidas",1);

insert into unidad_producto(sigla, descripcion, estado) 
values("UD", "Unidad",1), ("L", "Litros",1), ("ML", "Mililitros",1);

insert into catalogo_producto(descripcion, estado) 
values("Coca Cola",1), ("Cola Oro",1), ("Cola Gallito",1), ("Big Cola",1), ("Cola Limon",1), ("Cola Piña",1);

insert into area_almacenado(descripcion, estado) values("ambiente",1);
insert into area_almacenado_producto(fk_cata_prod, fk_area_alma, estado) 
values(1, 1,1), (2, 1,1), (3, 1,1), (4, 1,1), (5, 1,1), (6, 1,1);

insert into presentacion_catalogo_producto(fk_cata_prod, fk_sub_cate, cantidad, fk_unid_prod, estado) 
values(1, 1, 300, 3,1), (2, 1, 1, 2,1), (3, 1, 300, 3,1), (4, 1, 1, 2,1), (5, 1, 300, 3,1), (6, 1, 1, 2,1);

insert into precio_catalogo_producto(fk_pres_cata_prod, fk_unid_prod, precio, estado) 
values(1, 1, 0.5,1), (2, 1, 2,1), (3, 1, 0.5,1), (4, 1, 2,1), (5, 1, 0.5,1), (6, 1, 2,1);

insert into cliente(cedula, nombre, contacto, estado) values("0954943114", "Efren Galarza", "0997188086",1);
insert into cab_pedido(fk_cliente, estado) values(1, 1);

insert into det_pedido (fk_cab_pedido, fk_producto, estado) 
values(1, 6,  1), (1, 1,  1), (1, 6,  1), (1, 1,  1);




