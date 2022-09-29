drop procedure if exists detalle_pedido_productos;
create or replace procedure detalle_pedido_productos ( in id int)
begin 
	select     
		dp.fk_producto  as producto , 
		count (dp.fk_producto) as cantidad,  
		pcp.precio as "prec/unid", 
		(count (dp.fk_producto)* pcp.precio ) as total 
	from det_pedido as dp
		inner join precio_catalogo_producto as pcp on dp.fk_producto = pcp.id_prec_cata_prod  where dp.fk_cab_pedido = id
		group by dp.fk_producto; 
end

call detalle_pedido_productos(1);
select df.fk_producto, df.cantidad, df.total  from det_factura as df inner join cab_factura as cf on df.fk_cab_factura = cf.id_cab_factura  where cf.fk_cab_pedido = 1;


-- COMPARACION 
drop procedure if exists detalle_pedido_productos;
create or replace procedure detalle_pedido_productos ( in id int)
begin 
	select     
		dp.fk_producto  as producto , 
		count (dp.fk_producto) as cantidad,  
		pcp.precio as "prec/unid", 
		(count (dp.fk_producto)* pcp.precio ) as total 
	from det_pedido as dp
		inner join precio_catalogo_producto as pcp on dp.fk_producto = pcp.id_prec_cata_prod  where dp.fk_cab_pedido = id
		group by dp.fk_producto; 
end

call detalle_pedido_productos(1);
select df.fk_producto, df.cantidad, df.total  from det_factura as df inner join cab_factura as cf on df.fk_cab_factura = cf.id_cab_factura  where cf.fk_cab_pedido = 1;


-- COMPARACION 
create or replace procedure compare_change(in id_cab_factura int)
begin 
 	declare var_producto integer;
	declare var_cantidad integer;
	declare var_total decimal(12,2);
	declare var_final integer default 0;
	declare var_id_cab_pedido int default (select fk_cab_pedido from cab_factura as cf where cf.id_cab_factura=id_cab_factura);
	
	declare detalles_pedido_despues cursor for 
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


select fk_cab_pedido from cab_factura cf 
