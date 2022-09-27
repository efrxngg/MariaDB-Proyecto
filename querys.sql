drop procedure if exists detalle_pedido_productos;
create or replace procedure detalle_pedido_productos ( in id int)
begin 
	select     
		dp.fk_producto  as producto , 
		count (dp.fk_producto) as cantidad,  
		pcp.precio as "prec/unid", 
		(count (dp.fk_producto)* pcp.precio ) as total 
	from det_pedido as dp
		inner join precio_catalogo_producto as pcp on dp.fk_producto = pcp.id_prec_cata_prod  where dp.fk_cab_pedido = 1
		group by dp.fk_producto; 
end
call  detalle_pedido_productos(1);
-- 



create procedure detalle_pedido()
begin
	declare var_producto integer;
	declare var_cantidad integer;
	declare var_total decimal(12,2);
	declare var_final integer default 0;

	declare detalles_pedido cursor for 
		select     
			dp.fk_producto  as producto , 
			count (dp.fk_producto) as cantidad,  
			(count (dp.fk_producto)* pcp.precio ) as total 
		from det_pedido as dp
			inner join precio_catalogo_producto as pcp on dp.fk_producto = pcp.id_prec_cata_prod  where dp.fk_cab_pedido = 1
			group by dp.fk_producto;
	
	declare continue handler for not found set var_final = 1;

	open detalles_pedido;
		bucle: loop
			fetch detalles_pedido into var_producto, var_cantidad, var_total;
				call insert_detalle_factura (1, var_producto, var_cantidad, var_total);
			if var_final = 1 then
				leave bucle;
			end if;		
		end loop bucle;
	close detalles_pedido;
end

CALL detalle_pedido();


select * from det_factura df ;



select   
	dp.fk_producto  as producto , 
	(count (dp.fk_producto))as cantidad,  
	pcp.precio as "prec/unid",
	(pcp.precio * count (dp.fk_producto)) as total
from det_pedido as dp
	inner join precio_catalogo_producto as pcp on dp.fk_producto = pcp.id_prec_cata_prod  
	where dp.fk_cab_pedido = 1
	group by dp.fk_producto

