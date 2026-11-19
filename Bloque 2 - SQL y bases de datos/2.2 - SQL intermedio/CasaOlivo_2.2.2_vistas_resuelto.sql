-- =====================================================================
-- Casa Olivo · 2.2.2 · Vistas
-- Solución de referencia
-- Ejecutar completo (F5) una vez. Si se recarga la base de datos con
-- 01_crear_tablas.sql, hay que borrar antes las vistas (al final de
-- este script) y volver a crearlas después.
-- =====================================================================

-- Pedidos que cuentan para las ventas netas: ni cancelados ni devueltos.
-- Una fila es un pedido.
CREATE VIEW v_pedidos_validos AS
SELECT pedido_id,
       cliente_id,
       fecha_pedido,
       estado,
       metodo_pago,
       codigo_promo,
       subtotal,
       gastos_envio
FROM pedidos
WHERE estado NOT IN ('Cancelado', 'Devuelto');

-- Líneas de los pedidos válidos, con producto, categoría, importe y
-- margen. Una fila es un producto dentro de un pedido válido. El
-- criterio de exclusión lo hereda de v_pedidos_validos.
CREATE VIEW v_lineas_validas AS
SELECT l.pedido_id,
       l.num_linea,
       p.fecha_pedido,
       p.cliente_id,
       l.producto_id,
       pr.nombre                                   AS producto,
       c.nombre                                    AS categoria,
       l.cantidad,
       l.precio_unitario,
       l.cantidad * l.precio_unitario              AS importe,
       l.cantidad * (l.precio_unitario - pr.coste) AS margen
FROM v_pedidos_validos AS p
INNER JOIN lineas_pedido AS l
        ON p.pedido_id = l.pedido_id
INNER JOIN productos AS pr
        ON l.producto_id = pr.producto_id
INNER JOIN categorias AS c
        ON pr.categoria_id = c.categoria_id;

-- Resumen de cada comprador: pedidos válidos, gasto y fechas de la
-- primera y la última compra. Una fila es un cliente con algún pedido
-- válido.
CREATE VIEW v_clientes_resumen AS
SELECT cliente_id,
       COUNT(*)          AS pedidos,
       SUM(subtotal)     AS gasto,
       MIN(fecha_pedido) AS primera_compra,
       MAX(fecha_pedido) AS ultima_compra
FROM v_pedidos_validos
GROUP BY cliente_id;

-- =====================================================================
-- Comprobaciones: las tres tienen que dar 464.381,25 €
-- =====================================================================

SELECT COUNT(*)      AS pedidos,
       SUM(subtotal) AS ventas_netas
FROM v_pedidos_validos;                        -- 6.505 pedidos

SELECT COUNT(*)     AS lineas,
       SUM(importe) AS ventas_netas,
       SUM(margen)  AS margen
FROM v_lineas_validas;                         -- 12.000 líneas, 280.534,15 € de margen

SELECT COUNT(*)   AS clientes,
       SUM(gasto) AS ventas_netas
FROM v_clientes_resumen;                       -- 3.855 clientes

-- Para borrar las vistas (en orden inverso al de creación):
-- DROP VIEW v_clientes_resumen, v_lineas_validas, v_pedidos_validos;
