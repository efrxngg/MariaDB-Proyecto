-- Cliente
use proyectobd;

drop trigger if exists on_update_cliente_auditoria;
create or replace trigger on_update_cliente_auditoria before update on cliente
for each row 
begin 
	insert into cliente_auditoria(id_cliente, cedula, nombre, contacto, estado, usuario)
	values (old.id_cliente, old.cedula, old.nombre, old.contacto, old.estado, user());
end


select * from cliente;