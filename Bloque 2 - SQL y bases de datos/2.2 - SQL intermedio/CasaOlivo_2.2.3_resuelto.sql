-- =====================================================================
-- Casa Olivo · 2.2.3 · Cuadro de mando
-- Solución de referencia
-- Usa las vistas de CasaOlivo_2.2.2_vistas_resuelto.sql.
-- =====================================================================

-- Pasos 1 a 3. Cuadro de mando mensual de 2025: ventas, mismo mes del
-- año anterior, crecimiento interanual, acumulado del año y media móvil
-- de tres meses. El filtro de 2025 va en la consulta final: si fuera en
-- el CTE mensual, LAG(ventas, 12) no encontraría los meses de 2024.
WITH mensual AS (
    -- Paso 1: una fila por mes
    SELECT TO_CHAR(fecha_pedido, 'YYYY-MM') AS mes,
           COUNT(*)                         AS pedidos,
           SUM(subtotal)                    AS ventas
    FROM v_pedidos_validos
    GROUP BY TO_CHAR(fecha_pedido, 'YYYY-MM')
),
cuadro AS (
    -- Pasos 2 y 3: las columnas calculadas con funciones de ventana
    SELECT mes,
           pedidos,
           ventas,
           LAG(ventas, 12) OVER (ORDER BY mes)                                AS ventas_anio_anterior,
           ROUND(100 * (ventas / LAG(ventas, 12) OVER (ORDER BY mes) - 1), 1) AS crec_interanual,
           SUM(ventas) OVER (PARTITION BY LEFT(mes, 4) ORDER BY mes)          AS acumulado_anio,
           ROUND(AVG(ventas) OVER (ORDER BY mes
                                   ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS media_movil_3m
    FROM mensual
)
SELECT *
FROM cuadro
WHERE mes >= '2025-01'
ORDER BY mes;                                  -- 12 filas; el acumulado de diciembre da 296.757,50 €

-- Paso 4a. ¿De dónde sale el crecimiento del último trimestre? Primeras
-- compras frente a clientes que repiten, de octubre a diciembre
SELECT EXTRACT(YEAR FROM p.fecha_pedido) AS anio,
       CASE WHEN p.fecha_pedido = r.primera_compra THEN 'Primera compra'
            ELSE 'Repite'
       END                               AS tipo,
       COUNT(*)                          AS pedidos,
       SUM(p.subtotal)                   AS ventas
FROM v_pedidos_validos AS p
INNER JOIN v_clientes_resumen AS r
        ON p.cliente_id = r.cliente_id
WHERE EXTRACT(MONTH FROM p.fecha_pedido) >= 10
GROUP BY EXTRACT(YEAR FROM p.fecha_pedido),
         CASE WHEN p.fecha_pedido = r.primera_compra THEN 'Primera compra'
              ELSE 'Repite'
         END
ORDER BY anio, tipo;                           -- 4 filas

-- Paso 4b. Lo mismo de marzo a septiembre, para comparar
SELECT EXTRACT(YEAR FROM p.fecha_pedido) AS anio,
       CASE WHEN p.fecha_pedido = r.primera_compra THEN 'Primera compra'
            ELSE 'Repite'
       END                               AS tipo,
       COUNT(*)                          AS pedidos,
       SUM(p.subtotal)                   AS ventas
FROM v_pedidos_validos AS p
INNER JOIN v_clientes_resumen AS r
        ON p.cliente_id = r.cliente_id
WHERE EXTRACT(MONTH FROM p.fecha_pedido) BETWEEN 3 AND 9
GROUP BY EXTRACT(YEAR FROM p.fecha_pedido),
         CASE WHEN p.fecha_pedido = r.primera_compra THEN 'Primera compra'
              ELSE 'Repite'
         END
ORDER BY anio, tipo;                           -- 4 filas

-- Paso 5. Pareto de productos: ventas y porcentaje acumulado
WITH ventas_producto AS (
    SELECT producto,
           SUM(importe) AS ventas
    FROM v_lineas_validas
    GROUP BY producto
)
SELECT ROW_NUMBER() OVER (ORDER BY ventas DESC)                                      AS puesto,
       producto,
       ventas,
       ROUND(100 * SUM(ventas) OVER (ORDER BY ventas DESC) / SUM(ventas) OVER (), 1) AS pct_acumulado
FROM ventas_producto
ORDER BY puesto;                               -- 44 filas; el 80 % se alcanza en el puesto 29

-- Complemento para la nota: ¿cuánto tarda un cliente en hacer su segunda
-- compra? Sirve para decidir cuándo escribir a los nuevos y para validar
-- el umbral de seis meses del segmento "En riesgo"
WITH compras AS (
    SELECT cliente_id,
           fecha_pedido,
           ROW_NUMBER() OVER (PARTITION BY cliente_id ORDER BY fecha_pedido, pedido_id) AS num_compra,
           fecha_pedido - LAG(fecha_pedido) OVER (PARTITION BY cliente_id
                                                  ORDER BY fecha_pedido, pedido_id)  AS dias_desde_anterior
    FROM v_pedidos_validos
)
SELECT COUNT(*)                                                                        AS segundas_compras,
       PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY dias_desde_anterior)                AS mediana_dias,
       ROUND(100.0 * COUNT(*) FILTER (WHERE dias_desde_anterior <= 90) / COUNT(*), 1)  AS pct_90_dias,
       ROUND(100.0 * COUNT(*) FILTER (WHERE dias_desde_anterior <= 180) / COUNT(*), 1) AS pct_180_dias
FROM compras
WHERE num_compra = 2;                          -- 1 fila

-- =====================================================================
-- Conclusiones: ¿cómo seguimos el negocio mes a mes?
-- =====================================================================
-- * Crecimiento: de marzo a octubre de 2025, cada mes vende entre un 53 %
--   y un 92 % más que el mismo mes de 2024. En noviembre el crecimiento
--   baja al 35 % y en diciembre al 17 %: el último trimestre crece un
--   34 %, frente al 71 % de marzo a septiembre.
-- * De dónde sale: en el último trimestre, las ventas de clientes que
--   repiten crecen un 73 % y las de primera compra solo un 9,5 % (de
--   marzo a septiembre crecían un 35 %). Casa Olivo crece gracias a los
--   clientes que vuelven, y le cuesta cada vez más atraer nuevos.
-- * Productos: no hay un 80/20. Hacen falta 29 de los 44 productos
--   vendidos para llegar al 80 % de las ventas, y el primero, las
--   sábanas, solo aporta el 4,6 %.
-- * Segunda compra: la mitad llega antes de 95 días y tres de cada
--   cuatro antes de seis meses. Es el momento de escribir a los nuevos,
--   y confirma el umbral del segmento "En riesgo".
