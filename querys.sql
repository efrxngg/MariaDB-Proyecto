use proyectobd;
drop procedure if exists detalle_pedido_productos;
create or replace procedure detalle_pedido_productos ( in id int)
begin 
	select     
		dp.fk_producto  as producto , 
		count (dp.fk_producto) as cantidad,   
		(count (dp.fk_producto)* pcp.precio ) as total 
	from det_pedido as dp
		inner join precio_catalogo_producto as pcp on dp.fk_producto = pcp.id_prec_cata_prod  where dp.fk_cab_pedido = id and dp.estado = 1
		group by dp.fk_producto; 
end

call detalle_pedido_productos(1);
select df.fk_producto, df.cantidad, df.total  from det_factura as df inner join cab_factura as cf on df.fk_cab_factura = cf.id_cab_factura  where cf.fk_cab_pedido = 1 and df.estado = 1;


-- COMPARACION 
create or replace procedure update_change_detalle_factura(in id_cab_factur int)
begin 
 	declare var_producto integer;
	declare var_cantidad integer;
	declare var_total decimal(12,2);
	declare var_final integer default 0;
	declare id_cab_pedido int default (select fk_cab_pedido from cab_factura as cf where cf.id_cab_factura=id_cab_factur);
	
	declare new_detalles_factura cursor for 
		select     
			dp.fk_producto  as producto , 
			count (dp.fk_producto) as cantidad,  
			(count (dp.fk_producto)* pcp.precio ) as total 
		from det_pedido as dp
			inner join precio_catalogo_producto as pcp on dp.fk_producto = pcp.id_prec_cata_prod  
			where dp.fk_cab_pedido = id_cab_pedido and dp.estado = 1
			group by dp.fk_producto;
		
		
	declare continue handler for not found set var_final = 1;

	open new_detalles_factura;

		bucle: loop
			fetch new_detalles_factura into var_producto, var_cantidad, var_total;
				if var_final = 1 then
					leave bucle;			
				end if;		
			
				if var_producto in (select fk_producto from det_factura where   fk_cab_factura = id_cab_factur) then
					if var_cantidad != (select cantidad from det_factura where fk_cab_factura = id_cab_factur and fk_producto = var_producto) then
						update det_factura set cantidad=var_cantidad, total=var_total, estado=1 where fk_producto = var_producto and fk_cab_factura = id_cab_factur;
-- 						call update_detalle_factura(id_cab_factura, var_producto, var_cantidad, var_total);		
					elseif var_cantidad = (select cantidad from det_factura where fk_cab_factura = id_cab_factur and fk_producto = var_producto) then
						update det_factura set estado = 1 where fk_producto = var_producto and fk_cab_factura = id_cab_factur;
					end if;
				
				else
					call insert_detalle_factura(id_cab_factur, var_producto, var_cantidad, var_total);
				
				end if;
			
		end loop bucle;
	close new_detalles_factura;
end

call update_change_detalle_factura(1);


/**
 * Tabla: det_pedido
 * Funcion: Realiza borrado logico 
 * Parametros: id_cab_factura, id_precio_cata_producto
 */
create or replace procedure delete_detalle_producto(in id_cab_fact int, id_prod int)
begin 

	declare var_id_detalle_pedido int;
	select dp.id_det_pedido into var_id_detalle_pedido from cab_factura cf 
		inner join cab_pedido cp on cf.fk_cab_pedido = cp.id_cab_pedido
		inner join det_pedido dp on cp.id_cab_pedido = dp.fk_cab_pedido 
	where cf.id_cab_factura = id_cab_fact and dp.fk_producto = id_prod and dp.estado = 1 limit 1;
	
	update det_pedido set estado = 0 where id_det_pedido = var_id_detalle_pedido;
end


call delete_detalle_producto(1, 1);


create or replace procedure delete_det_factura(in id_cab_factur int, id_producto int)
begin 
	declare var_id_det_factura int;

	select df.id_det_factura into var_id_det_factura from det_factura df 
	inner join cab_factura cf on df.fk_cab_factura = cf.id_cab_factur 
	where cf.id_cab_factura = id_cab_factur and df.fk_producto = id_producto;	

	update det_factura set estado = 0 where id_det_factura = var_id_det_factura;
end


create or replace procedure delete_det_fac_and_delete_det_pedido(in id_cab_factura int, id_producto int)
begin 
	call delete_det_factura(id_cab_factura, id_producto);
	call delete_detalle_producto(id_cab_factura, id_producto);
end

call delete_det_fac_and_delete_det_pedido(1, 1);


create or replace procedure update_final_cab_factura (in id_cab_factura int)
begin 
	declare sub_total decimal(12,2);
	declare total_final decimal(12,2);
	select sum (total) into sub_total from det_factura where fk_cab_factura = id_cab_factura;
	select  ((sum (total)*0.12)+sum (total)) into total_final from det_factura where fk_cab_factura = id_cab_factura;
	call update_cabecera_factura(id_cab_factura, sub_total, total_final);

end

call update_final_cab_factura (1)
select * from cab_factura cf ;