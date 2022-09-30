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
-- Ejemplo: 
call detalle_pedido_productos(1);
select df.fk_producto, df.cantidad, df.total  from det_factura as df inner join cab_factura as cf on df.fk_cab_factura = cf.id_cab_factura  where cf.fk_cab_pedido = 1 and df.estado = 1;







