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



