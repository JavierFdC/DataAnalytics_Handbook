-- =====================================================================
-- Casa Olivo · 2.2.2 · Análisis con CTEs
-- Solución de referencia
-- Usa las vistas de CasaOlivo_2.2.2_vistas_resuelto.sql.
-- =====================================================================

-- 1. ¿Cuál fue el mejor día de ventas? (un CTE usado dos veces)
WITH ventas_dia AS (
    SELECT fecha_pedido,
           SUM(subtotal) AS ventas
    FROM pedidos
    WHERE estado NOT IN ('Cancelado', 'Devuelto')
    GROUP BY fecha_pedido
)
SELECT fecha_pedido,
       ventas
FROM ventas_dia
WHERE ventas = (SELECT MAX(ventas) FROM ventas_dia);      -- 2025-11-30: 2.709,02 €

-- 2. ¿Vuelven los clientes cuyo primer pedido llevaba sábanas, según
--    cómo terminó? (el análisis de la 2.2.1 con CTEs encadenados)
WITH primeras_compras AS (
    -- Paso 1: la fecha de la primera compra de cada cliente
    SELECT cliente_id,
           MIN(fecha_pedido) AS primera_compra
    FROM pedidos
    GROUP BY cliente_id
),
primer_pedido_sabanas AS (
    -- Paso 2: los primeros pedidos que incluyen las sábanas
    SELECT p.cliente_id,
           p.fecha_pedido,
           p.estado
    FROM pedidos AS p
    INNER JOIN primeras_compras AS f
            ON p.cliente_id = f.cliente_id
           AND p.fecha_pedido = f.primera_compra
    WHERE p.pedido_id IN (SELECT pedido_id
                          FROM lineas_pedido
                          WHERE producto_id = 203)
),
con_vuelta AS (
    -- Paso 3: si cada cliente volvió a comprar después
    SELECT s.estado,
           EXISTS (SELECT 1
                   FROM pedidos AS p2
                   WHERE p2.cliente_id = s.cliente_id
                     AND p2.fecha_pedido > s.fecha_pedido) AS vuelve
    FROM primer_pedido_sabanas AS s
)
SELECT estado,
       COUNT(*)                                                    AS clientes,
       COUNT(*) FILTER (WHERE vuelve)                              AS vuelven,
       ROUND(100.0 * COUNT(*) FILTER (WHERE vuelve) / COUNT(*), 1) AS pct_vuelven
FROM con_vuelta
GROUP BY estado
ORDER BY clientes DESC;                                   -- 3 filas

-- 3. Ventas netas y margen por categoría en 2025, desde la vista
SELECT categoria,
       SUM(importe)                              AS ventas_netas,
       SUM(margen)                               AS margen,
       ROUND(100 * SUM(margen) / SUM(importe), 1) AS margen_pct
FROM v_lineas_validas
WHERE fecha_pedido >= '2025-01-01'
GROUP BY categoria
ORDER BY ventas_netas DESC;                               -- 6 filas

-- 4. Segmentación de clientes a 31 de diciembre de 2025
WITH segmentos AS (
    SELECT cliente_id,
           pedidos,
           gasto,
           CASE WHEN pedidos >= 3 AND ultima_compra >= '2025-07-01' THEN 'Fiel'
                WHEN pedidos >= 2 AND ultima_compra >= '2025-07-01' THEN 'Repetidor'
                WHEN pedidos >= 2                                  THEN 'En riesgo'
                WHEN primera_compra >= '2025-10-01'                THEN 'Nuevo'
                ELSE 'Una sola compra'
           END AS segmento
    FROM v_clientes_resumen
)
SELECT segmento,
       COUNT(*)                                                          AS clientes,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM segmentos), 1)     AS pct_clientes,
       SUM(gasto)                                                        AS gasto,
       ROUND(100.0 * SUM(gasto) / (SELECT SUM(gasto) FROM segmentos), 1) AS pct_gasto,
       ROUND(AVG(gasto), 2)                                              AS gasto_medio
FROM segmentos
GROUP BY segmento
ORDER BY gasto DESC;                                      -- 5 filas

-- 5a. Cohortes por el código del primer pedido: todos los clientes
WITH primeros_pedidos AS (
    -- Paso 1: el primer pedido de cada cliente y cuántos ha hecho en total
    SELECT cliente_id,
           MIN(pedido_id) AS primer_pedido,
           COUNT(*)       AS pedidos
    FROM pedidos
    GROUP BY cliente_id
),
cohortes AS (
    -- Paso 2: el código y el año de ese primer pedido
    SELECT COALESCE(p.codigo_promo, 'Sin código') AS codigo,
           EXTRACT(YEAR FROM p.fecha_pedido)      AS anio,
           f.pedidos
    FROM primeros_pedidos AS f
    INNER JOIN pedidos AS p
            ON f.primer_pedido = p.pedido_id
)
SELECT codigo,
       COUNT(*)                                                         AS clientes,
       COUNT(*) FILTER (WHERE pedidos > 1)                              AS vuelven,
       ROUND(100.0 * COUNT(*) FILTER (WHERE pedidos > 1) / COUNT(*), 1) AS pct_vuelven
FROM cohortes
GROUP BY codigo
ORDER BY clientes DESC;                                   -- 4 filas

-- 5b. Las mismas cohortes, solo con los clientes que llegaron en 2024:
--     todos han tenido al menos un año para volver
WITH primeros_pedidos AS (
    SELECT cliente_id,
           MIN(pedido_id) AS primer_pedido,
           COUNT(*)       AS pedidos
    FROM pedidos
    GROUP BY cliente_id
),
cohortes AS (
    SELECT COALESCE(p.codigo_promo, 'Sin código') AS codigo,
           EXTRACT(YEAR FROM p.fecha_pedido)      AS anio,
           f.pedidos
    FROM primeros_pedidos AS f
    INNER JOIN pedidos AS p
            ON f.primer_pedido = p.pedido_id
)
SELECT codigo,
       COUNT(*)                                                         AS clientes,
       COUNT(*) FILTER (WHERE pedidos > 1)                              AS vuelven,
       ROUND(100.0 * COUNT(*) FILTER (WHERE pedidos > 1) / COUNT(*), 1) AS pct_vuelven
FROM cohortes
WHERE anio = 2024
GROUP BY codigo
ORDER BY clientes DESC;                                   -- 4 filas

-- =====================================================================
-- Conclusiones: ¿a qué clientes dirigimos cada campaña?
-- =====================================================================
-- * Segmentos: los 3.855 compradores se reparten en cinco grupos. Los
--   fieles son el 11 % de los clientes y aportan el 29 % de las ventas,
--   con más de 300 € de gasto medio. Casi la mitad solo ha comprado una
--   vez, hace más de tres meses, y los 683 nuevos del último trimestre
--   son el 18 %.
-- * Prioridad 1 (en riesgo): 501 clientes que compraron dos o más veces
--   y llevan más de seis meses sin volver. Ya conocen la tienda y han
--   gastado de media 193 €: recuperarlos es más barato que captar
--   clientes nuevos. Después, los nuevos: conseguir su segunda compra.
-- * Black Friday: a primera vista, sus clientes vuelven menos (27 %
--   frente al 37 %), pero la mitad llegó en 2025 y no ha tenido tiempo.
--   Con los clientes de 2024, vuelve el 48,5 %, frente al 53 % del
--   resto. Es una buena puerta de entrada: lo que conviene es preparar
--   la segunda compra de quienes llegan con él.
