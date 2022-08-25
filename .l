DELIMITER $$
CREATE FUNCTION total(idpedido int,idproducto int)
RETURNS FLOAT
BEGIN
	SELECT IdPedido, IdProducto, PrecioUnidad, Descuento,(PrecioUnidad*Descuento) AS descuentoPlata, (PrecioUnidad-(PrecioUnidad*Descuento)) as Total FROM `detalles_de_pedido` WHERE detalles_de_pedido.IdPedido=IdPedido AND detalles_de_pedido.IdProducto
END $$
DELIMITER;

CREATE VIEW verFactura
AS
	SELECT pedido.IdPedido, pedido.FechaPedido, cliente.NombreEmpresa AS nombre_del_cliente, CONCAT(empleado.Nombre,' ', empleado.Apellidos) AS nombre_apellido_empleado, empresastransporte.NombreEmpresa, CONCAT(pedido.CiudadDestinatario,' ',pedido.PaisDestinatario, ' ', pedido.Destinatario) AS Datos_De_Entrega_del_pedido, pedido.Cargo, subtotalproducto.Name_exp_7 AS total,
    FROM pedido 
    INNER JOIN cliente  ON cliente.IdCliente=pedido.IdCliente 
    INNER JOIN empleado ON empleado.IdEmpleado=pedido.IdEmpleado 
    INNER JOIN empresastransporte ON empresastransporte.IdEmpresasTransporte=pedido.IdEmpresasTransporte
    INNER JOIN subtotalproducto ON subtotalproducto.idPedido=pedido.IdPedido
-- 
    CREATE VIEW verFactura
AS
	SELECT pedido.IdPedido, pedido.FechaPedido, cliente.NombreEmpresa AS nombre_del_cliente, CONCAT(empleado.Nombre,' ', empleado.Apellidos) AS nombre_apellido_empleado, empresastransporte.NombreEmpresa, CONCAT(pedido.CiudadDestinatario,' ',pedido.PaisDestinatario, ' ', pedido.Destinatario) AS Datos_De_Entrega_del_pedido, pedido.Cargo,
   (subtotalproducto.Name_exp_7 - (subtotalproducto.Name_exp_7 * subtotalproducto.Descuento)) as totalDescuento ,SUM(subtotalproducto.Name_exp_7)AS total GROUP BY IdPedido
    FROM pedido 
    INNER JOIN cliente  ON cliente.IdCliente=pedido.IdCliente 
    INNER JOIN empleado ON empleado.IdEmpleado=pedido.IdEmpleado 
    INNER JOIN empresastransporte ON empresastransporte.IdEmpresasTransporte=pedido.IdEmpresasTransporte
    INNER JOIN subtotalproducto ON subtotalproducto.idPedido=pedido.IdPedido
    -- 

    CREATE VIEW verFactura
AS
	SELECT pedido.IdPedido, pedido.FechaPedido, cliente.NombreEmpresa AS nombre_del_cliente, CONCAT(empleado.Nombre,' ', empleado.Apellidos) AS nombre_apellido_empleado, empresastransporte.NombreEmpresa, CONCAT(pedido.CiudadDestinatario,' ',pedido.PaisDestinatario, ' ', pedido.Destinatario) AS Datos_De_Entrega_del_pedido, pedido.Cargo,
   (subtotalproducto.Name_exp_7 - (subtotalproducto.Name_exp_7 * subtotalproducto.Descuento)) as totalDescuento ,SUM(subtotalproducto.Name_exp_7)AS total 
    FROM pedido 
    INNER JOIN cliente  ON cliente.IdCliente=pedido.IdCliente 
    INNER JOIN empleado ON empleado.IdEmpleado=pedido.IdEmpleado 
    INNER JOIN empresastransporte ON empresastransporte.IdEmpresasTransporte=pedido.IdEmpresasTransporte
    INNER JOIN subtotalproducto ON subtotalproducto.idPedido=pedido.IdPedido
    GROUP BY IdPedido


SELECT pedido.IdPedido, pedido.FechaPedido, cliente.NombreEmpresa AS nombre_del_cliente, CONCAT(empleado.Nombre,' ', empleado.Apellidos) AS nombre_apellido_empleado, empresastransporte.NombreEmpresa, CONCAT(pedido.CiudadDestinatario,' ',pedido.PaisDestinatario, ' ', pedido.Destinatario) AS Datos_De_Entrega_del_pedido, pedido.Cargo, SUM(subtotalproducto.Name_exp_7 - (subtotalproducto.Name_exp_7 * subtotalproducto.Descuento)) as totalDescuento, CONCAT(ROUND((subtotalproducto.Descuento * 100),0),'%'),SUM(subtotalproducto.Name_exp_7) + pedido.Cargo AS total FROM pedido INNER JOIN cliente ON cliente.IdCliente=pedido.IdCliente INNER JOIN empleado ON empleado.IdEmpleado=pedido.IdEmpleado INNER JOIN empresastransporte ON empresastransporte.IdEmpresasTransporte=pedido.IdEmpresasTransporte INNER JOIN subtotalproducto ON subtotalproducto.idPedido=pedido.IdPedido GROUP BY IdPedido;

SELECT pedido.IdPedido, pedido.FechaPedido, cliente.NombreEmpresa AS nombre_del_cliente, CONCAT(empleado.Nombre,' ', empleado.Apellidos) AS nombre_apellido_empleado, empresastransporte.NombreEmpresa, CONCAT(pedido.CiudadDestinatario,' ',pedido.PaisDestinatario, ' ', pedido.Destinatario) AS Datos_De_Entrega_del_pedido, pedido.Cargo, SUM(subtotalproducto.Name_exp_7 - (subtotalproducto.Name_exp_7 * subtotalproducto.Descuento)) as totalDescuento,subtotalproducto.Name_exp_7 * subtotalproducto.Descuento as plataahorrada, CONCAT(ROUND((subtotalproducto.Descuento * 100),0),'%'),SUM(subtotalproducto.Name_exp_7) + pedido.Cargo AS total FROM pedido INNER JOIN cliente ON cliente.IdCliente=pedido.IdCliente INNER JOIN empleado ON empleado.IdEmpleado=pedido.IdEmpleado INNER JOIN empresastransporte ON empresastransporte.IdEmpresasTransporte=pedido.IdEmpresasTransporte INNER JOIN subtotalproducto ON subtotalproducto.idPedido=pedido.IdPedido GROUP BY IdPedido;