-- =====================================================================
-- Casa Olivo · 2.1.3 · JOINs y operaciones de conjuntos
-- Solución de referencia
-- KPI: ventas netas = suma de las líneas de los pedidos que no están
--      cancelados ni devueltos; sin gastos de envío.
-- =====================================================================

-- 1. Las líneas de un pedido con el nombre de cada producto
SELECT l.pedido_id,
       l.num_linea,
       pr.nombre,
       l.cantidad,
       l.precio_unitario
FROM lineas_pedido AS l
INNER JOIN productos AS pr
        ON l.producto_id = pr.producto_id
WHERE l.pedido_id = 10001
ORDER BY l.num_linea;                          -- 3 filas

-- 2a. Ventas netas y margen por categoría en 2025
SELECT c.nombre                                         AS categoria,
       SUM(l.cantidad * l.precio_unitario)              AS ventas_netas,
       SUM(l.cantidad * (l.precio_unitario - pr.coste)) AS margen,
       ROUND(100 * SUM(l.cantidad * (l.precio_unitario - pr.coste))
                 / SUM(l.cantidad * l.precio_unitario), 1) AS margen_pct
FROM pedidos AS p
INNER JOIN lineas_pedido AS l
        ON p.pedido_id = l.pedido_id
INNER JOIN productos AS pr
        ON l.producto_id = pr.producto_id
INNER JOIN categorias AS c
        ON pr.categoria_id = c.categoria_id
WHERE p.estado NOT IN ('Cancelado', 'Devuelto')
  AND p.fecha_pedido >= '2025-01-01'
GROUP BY c.nombre
ORDER BY ventas_netas DESC;                    -- 6 filas

-- 2b. Comprobación: el total desde las líneas tiene que coincidir con
--     las ventas netas de 2025 de la 2.1.2 (296.757,50 €)
SELECT SUM(l.cantidad * l.precio_unitario) AS ventas_netas_lineas
FROM pedidos AS p
INNER JOIN lineas_pedido AS l
        ON p.pedido_id = l.pedido_id
WHERE p.estado NOT IN ('Cancelado', 'Devuelto')
  AND p.fecha_pedido >= '2025-01-01';

-- 3. Los 10 productos con más ventas netas en 2025, con su categoría
SELECT pr.nombre                           AS producto,
       c.nombre                            AS categoria,
       SUM(l.cantidad)                     AS unidades,
       SUM(l.cantidad * l.precio_unitario) AS ventas_netas
FROM pedidos AS p
INNER JOIN lineas_pedido AS l
        ON p.pedido_id = l.pedido_id
INNER JOIN productos AS pr
        ON l.producto_id = pr.producto_id
INNER JOIN categorias AS c
        ON pr.categoria_id = c.categoria_id
WHERE p.estado NOT IN ('Cancelado', 'Devuelto')
  AND p.fecha_pedido >= '2025-01-01'
GROUP BY pr.nombre, c.nombre
ORDER BY ventas_netas DESC
LIMIT 10;                                      -- 10 filas

-- 4. Los 5 mejores clientes por gasto, con nombre y ciudad
SELECT c.cliente_id,
       c.nombre || ' ' || c.apellidos AS cliente,
       c.ciudad,
       COUNT(*)        AS pedidos,
       SUM(p.subtotal) AS gasto
FROM clientes AS c
INNER JOIN pedidos AS p
        ON c.cliente_id = p.cliente_id
WHERE p.estado NOT IN ('Cancelado', 'Devuelto')
GROUP BY c.cliente_id, c.nombre, c.apellidos, c.ciudad
ORDER BY gasto DESC
LIMIT 5;                                       -- 5 filas

-- 5a. Clientes registrados que nunca han hecho un pedido (anti-join)
SELECT c.cliente_id,
       c.nombre,
       c.apellidos,
       c.fecha_registro,
       c.origen
FROM clientes AS c
LEFT JOIN pedidos AS p
       ON c.cliente_id = p.cliente_id
WHERE p.pedido_id IS NULL;                     -- 1.210 filas

-- 5b. Porcentaje de registrados sin compra, por origen
SELECT c.origen,
       COUNT(DISTINCT c.cliente_id)                                    AS registrados,
       COUNT(DISTINCT c.cliente_id) FILTER (WHERE p.pedido_id IS NULL) AS sin_compra,
       ROUND(100.0 * COUNT(DISTINCT c.cliente_id) FILTER (WHERE p.pedido_id IS NULL)
                   / COUNT(DISTINCT c.cliente_id), 1)                  AS pct_sin_compra
FROM clientes AS c
LEFT JOIN pedidos AS p
       ON c.cliente_id = p.cliente_id
GROUP BY c.origen
ORDER BY pct_sin_compra DESC;                  -- 5 filas

-- 6. Productos que nunca se han vendido
SELECT pr.producto_id,
       pr.nombre,
       pr.fecha_alta
FROM productos AS pr
LEFT JOIN lineas_pedido AS l
       ON pr.producto_id = l.producto_id
WHERE l.producto_id IS NULL;                   -- 4 filas

-- 7. Devoluciones por producto: los 5 con más pedidos devueltos en %
SELECT pr.nombre,
       COUNT(*)                                      AS pedidos,
       COUNT(*) FILTER (WHERE p.estado = 'Devuelto') AS devueltos,
       ROUND(100.0 * COUNT(*) FILTER (WHERE p.estado = 'Devuelto') / COUNT(*), 1) AS pct_devueltos
FROM pedidos AS p
INNER JOIN lineas_pedido AS l
        ON p.pedido_id = l.pedido_id
INNER JOIN productos AS pr
        ON l.producto_id = pr.producto_id
GROUP BY pr.nombre
ORDER BY pct_devueltos DESC
LIMIT 5;                                       -- 5 filas

-- 8a. Clientes suscritos a la newsletter
SELECT email FROM clientes
INTERSECT
SELECT email FROM newsletter;                  -- 2.327 filas

-- 8b. Suscriptores que todavía no son clientes
SELECT email FROM newsletter
EXCEPT
SELECT email FROM clientes;                    -- 1.600 filas

-- 8c. Clientes que no están suscritos
SELECT email FROM clientes
EXCEPT
SELECT email FROM newsletter;                  -- 2.917 filas

-- 9a. Clientes de 2024 que volvieron en 2025
SELECT cliente_id FROM pedidos WHERE fecha_pedido <  '2025-01-01'
INTERSECT
SELECT cliente_id FROM pedidos WHERE fecha_pedido >= '2025-01-01';   -- 695 filas

-- 9b. Clientes de 2024 que no volvieron: la lista para reactivar
SELECT cliente_id FROM pedidos WHERE fecha_pedido <  '2025-01-01'
EXCEPT
SELECT cliente_id FROM pedidos WHERE fecha_pedido >= '2025-01-01';   -- 981 filas
