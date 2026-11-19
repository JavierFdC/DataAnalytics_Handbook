-- =====================================================================
-- Casa Olivo · 2.2.1 · Subconsultas
-- Solución de referencia
-- KPI: ventas netas = SUM(subtotal) de los pedidos que no están
--      cancelados ni devueltos; sin gastos de envío.
-- =====================================================================

-- 1. ¿Qué pedidos están por encima del ticket medio, y qué parte de las
--    ventas suponen? (escalar en el WHERE)
SELECT COUNT(*)      AS pedidos,
       SUM(subtotal) AS ventas
FROM pedidos
WHERE estado NOT IN ('Cancelado', 'Devuelto')
  AND subtotal > (SELECT AVG(subtotal)
                  FROM pedidos
                  WHERE estado NOT IN ('Cancelado', 'Devuelto'));
-- 2.343 de 6.505 pedidos (el 36 %) suman 316.358,70 €, el 68 % de las
-- ventas netas (464.381,25 €)

-- 2. ¿Cuál es el pedido más grande de la historia? (escalar en el WHERE)
SELECT *
FROM pedidos
WHERE subtotal = (SELECT MAX(subtotal) FROM pedidos);     -- 1 fila

-- 3a. ¿Cuántos clientes han comprado las sábanas de percal? (lista con IN)
SELECT COUNT(*)
FROM clientes
WHERE cliente_id IN (SELECT p.cliente_id
                     FROM pedidos AS p
                     INNER JOIN lineas_pedido AS l
                             ON p.pedido_id = l.pedido_id
                     WHERE l.producto_id = 203);          -- 347

-- 3b. Lo mismo con JOIN: sale más porque los clientes que compraron las
--     sábanas en varios pedidos se cuentan una vez por pedido
SELECT COUNT(*)                     AS filas,
       COUNT(DISTINCT c.cliente_id) AS clientes
FROM clientes AS c
INNER JOIN pedidos AS p
        ON c.cliente_id = p.cliente_id
INNER JOIN lineas_pedido AS l
        ON p.pedido_id = l.pedido_id
WHERE l.producto_id = 203;                                -- 358 filas, 347 clientes

-- 4. ¿Qué clientes no han hecho ningún pedido? (NOT EXISTS, correlacionada)
--    Tiene que coincidir con el anti-join de la 2.1.3: 1.210
SELECT COUNT(*)
FROM clientes AS c
WHERE NOT EXISTS (SELECT 1
                  FROM pedidos AS p
                  WHERE c.cliente_id = p.cliente_id);     -- 1.210

-- 5. ¿Qué suscriptores de la newsletter son clientes pero nunca han
--    comprado? (EXISTS y NOT EXISTS)
SELECT COUNT(*)
FROM clientes AS c
WHERE EXISTS (SELECT 1
              FROM newsletter AS n
              WHERE c.email = n.email)
  AND NOT EXISTS (SELECT 1
                  FROM pedidos AS p
                  WHERE c.cliente_id = p.cliente_id);     -- 526

-- 6. ¿Qué productos son más caros que la media de su categoría?
--    (correlacionada en el WHERE y en el SELECT)
SELECT pr.producto_id,
       pr.nombre,
       pr.precio,
       (SELECT ROUND(AVG(p2.precio), 2)
        FROM productos AS p2
        WHERE p2.categoria_id = pr.categoria_id) AS media_categoria
FROM productos AS pr
WHERE pr.precio > (SELECT AVG(p2.precio)
                   FROM productos AS p2
                   WHERE p2.categoria_id = pr.categoria_id)
ORDER BY pr.categoria_id, pr.precio DESC;                 -- 18 filas

-- 7. ¿Qué peso tiene cada categoría sobre las ventas de 2025?
--    (escalar en el SELECT)
SELECT c.nombre                            AS categoria,
       SUM(l.cantidad * l.precio_unitario) AS ventas_netas,
       ROUND(100 * SUM(l.cantidad * l.precio_unitario)
                 / (SELECT SUM(subtotal)
                    FROM pedidos
                    WHERE estado NOT IN ('Cancelado', 'Devuelto')
                      AND fecha_pedido >= '2025-01-01'), 1) AS pct_total
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
ORDER BY ventas_netas DESC;                               -- 6 filas

-- 8a. ¿Cuántos pedidos hace de media cada cliente? (tabla derivada)
SELECT ROUND(AVG(pedidos), 2) AS media_pedidos,
       MAX(pedidos)           AS maximo
FROM (SELECT cliente_id,
             COUNT(*) AS pedidos
      FROM pedidos
      GROUP BY cliente_id) AS por_cliente;                -- 1,73 y 13

-- 8b. ¿Cómo se reparten los clientes por número de pedidos? (tabla derivada)
SELECT pedidos,
       COUNT(*) AS clientes
FROM (SELECT cliente_id,
             COUNT(*) AS pedidos
      FROM pedidos
      GROUP BY cliente_id) AS por_cliente
GROUP BY pedidos
ORDER BY pedidos;                                         -- 12 filas

-- 9. ¿Cuánto se ha devuelto en pedidos con sábanas, frente al total
--    devuelto? (lista con IN y escalar en el SELECT)
SELECT COUNT(*)      AS pedidos_devueltos,
       SUM(subtotal) AS importe_devuelto,
       (SELECT SUM(subtotal)
        FROM pedidos
        WHERE estado = 'Devuelto') AS total_devuelto,
       ROUND(100 * SUM(subtotal) / (SELECT SUM(subtotal)
                                    FROM pedidos
                                    WHERE estado = 'Devuelto'), 1) AS pct_devuelto
FROM pedidos
WHERE estado = 'Devuelto'
  AND pedido_id IN (SELECT pedido_id
                    FROM lineas_pedido
                    WHERE producto_id = 203);
-- 77 pedidos y 10.443,47 € de 20.992,42 €: casi la mitad

-- 10a. ¿Vuelven los clientes según cómo terminó su primer pedido, cuando
--      ese primer pedido incluía las sábanas? (tabla derivada, IN y
--      EXISTS correlacionada)
SELECT p.estado,
       COUNT(*) AS clientes,
       COUNT(*) FILTER (WHERE EXISTS (SELECT 1
                                      FROM pedidos AS p2
                                      WHERE p2.cliente_id = p.cliente_id
                                        AND p2.fecha_pedido > p.fecha_pedido)) AS vuelven
FROM pedidos AS p
INNER JOIN (SELECT cliente_id,
                   MIN(fecha_pedido) AS primera_compra
            FROM pedidos
            GROUP BY cliente_id) AS f
        ON p.cliente_id = f.cliente_id
       AND p.fecha_pedido = f.primera_compra
WHERE p.pedido_id IN (SELECT pedido_id
                      FROM lineas_pedido
                      WHERE producto_id = 203)
GROUP BY p.estado;                                        -- 3 filas

-- 10b. Lo mismo para los primeros pedidos sin sábanas (NOT IN: la columna
--      pedido_id no admite NULL, así que no hay trampa)
SELECT p.estado,
       COUNT(*) AS clientes,
       COUNT(*) FILTER (WHERE EXISTS (SELECT 1
                                      FROM pedidos AS p2
                                      WHERE p2.cliente_id = p.cliente_id
                                        AND p2.fecha_pedido > p.fecha_pedido)) AS vuelven
FROM pedidos AS p
INNER JOIN (SELECT cliente_id,
                   MIN(fecha_pedido) AS primera_compra
            FROM pedidos
            GROUP BY cliente_id) AS f
        ON p.cliente_id = f.cliente_id
       AND p.fecha_pedido = f.primera_compra
WHERE p.pedido_id NOT IN (SELECT pedido_id
                          FROM lineas_pedido
                          WHERE producto_id = 203)
GROUP BY p.estado;                                        -- 4 filas

-- =====================================================================
-- Conclusiones: ¿cuánto nos cuestan las sábanas?
-- =====================================================================
-- * Importe: los 77 pedidos devueltos con sábanas suman 10.443 €, casi
--   la mitad de todo lo que se ha devuelto en Casa Olivo (20.992 €).
--   Un solo producto de 48 genera la mitad de las devoluciones, y va a
--   más: el 18 % de los pedidos con sábanas se devolvió en 2024 y el
--   24 % en 2025.
-- * Clientes: de quienes estrenaron Casa Olivo con unas sábanas y se las
--   quedaron, volvió el 45 % (73 de 161), más que la media de la tienda
--   (37 %). De quienes las devolvieron, solo el 22 % (10 de 46). Cuando
--   el primer pedido devuelto no lleva sábanas, vuelve el 42 % (35 de
--   83): una devolución cualquiera no espanta al cliente; la de las
--   sábanas, sí.
-- * Hipótesis y siguiente paso: las sábanas no encajan en las camas de
--   los clientes (medidas, profundidad del bajo) o el tejido no es lo
--   que esperaban. 46 clientes son pocos para estar seguros, pero
--   apuntan en la misma dirección que las devoluciones. Revisar la ficha
--   del producto con atención al cliente es probablemente la acción más
--   rentable: evita devoluciones y conserva clientes que volverían más
--   que la media.
