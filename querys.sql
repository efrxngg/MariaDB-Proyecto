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



