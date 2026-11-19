-- =====================================================================
-- Casa Olivo · 2.1.2 · Agregaciones
-- Solución de referencia
-- KPI: ventas netas = SUM(subtotal) de los pedidos que no están
--      cancelados ni devueltos; sin gastos de envío.
-- =====================================================================

-- 1. Resumen global: pedidos, ventas netas y ticket medio
SELECT COUNT(*)                AS pedidos,
       SUM(subtotal)           AS ventas_netas,
       ROUND(AVG(subtotal), 2) AS ticket_medio
FROM pedidos
WHERE estado NOT IN ('Cancelado', 'Devuelto');
-- 6.505 pedidos, 464.381,25 € y 71,39 € de ticket medio

-- 2. Ventas netas por año, comparando de marzo a diciembre
--    (la tienda abrió el 1 de marzo de 2024)
SELECT EXTRACT(YEAR FROM fecha_pedido) AS anio,
       COUNT(*)                        AS pedidos,
       SUM(subtotal)                   AS ventas_netas,
       ROUND(AVG(subtotal), 2)         AS ticket_medio
FROM pedidos
WHERE estado NOT IN ('Cancelado', 'Devuelto')
  AND EXTRACT(MONTH FROM fecha_pedido) >= 3
GROUP BY EXTRACT(YEAR FROM fecha_pedido)
ORDER BY anio;
-- 2024: 2.377 pedidos y 167.623,75 €; 2025: 3.614 pedidos y 258.470,27 €

-- 3. Evolución mensual: pedidos y ventas netas por mes
SELECT TO_CHAR(fecha_pedido, 'YYYY-MM') AS mes,
       COUNT(*)                         AS pedidos,
       SUM(subtotal)                    AS ventas_netas
FROM pedidos
WHERE estado NOT IN ('Cancelado', 'Devuelto')
GROUP BY TO_CHAR(fecha_pedido, 'YYYY-MM')
ORDER BY mes;                                  -- 22 filas

-- 4. Pedidos por estado
SELECT estado,
       COUNT(*)      AS pedidos,
       SUM(subtotal) AS importe
FROM pedidos
GROUP BY estado
ORDER BY pedidos DESC;                         -- 4 filas

-- 5. Cancelaciones por método de pago (FILTER)
SELECT metodo_pago,
       COUNT(*)                                     AS pedidos,
       COUNT(*) FILTER (WHERE estado = 'Cancelado') AS cancelados,
       ROUND(100.0 * COUNT(*) FILTER (WHERE estado = 'Cancelado') / COUNT(*), 1) AS pct_cancelados
FROM pedidos
GROUP BY metodo_pago
ORDER BY pct_cancelados DESC;                  -- 4 filas

-- 6. Clientes por provincia: top 10
SELECT provincia,
       COUNT(*) AS clientes
FROM clientes
GROUP BY provincia
ORDER BY clientes DESC
LIMIT 10;                                      -- 10 filas

-- 7. Clientes por origen
SELECT origen,
       COUNT(*) AS clientes
FROM clientes
GROUP BY origen
ORDER BY clientes DESC;

-- 8a. Clientes que repiten: dos pedidos o más
SELECT cliente_id,
       COUNT(*) AS pedidos
FROM pedidos
GROUP BY cliente_id
HAVING COUNT(*) >= 2;                          -- 1.485 filas

-- 8b. Los más fieles: 8 pedidos válidos o más
SELECT cliente_id,
       COUNT(*)      AS pedidos,
       SUM(subtotal) AS gasto
FROM pedidos
WHERE estado NOT IN ('Cancelado', 'Devuelto')
GROUP BY cliente_id
HAVING COUNT(*) >= 8
ORDER BY pedidos DESC, gasto DESC;             -- 20 filas

-- =====================================================================
-- Conclusiones
-- =====================================================================
-- * Crecimiento: de marzo a diciembre, las ventas netas crecen un 54 %
--   (de 168.000 € a 258.000 €) y los pedidos, un 52 %. El ticket medio
--   apenas cambia (unos 71 €): Casa Olivo crece porque tiene más
--   pedidos, no porque cada pedido sea mayor. El 77 % que sale al
--   comparar los años completos es engañoso: 2024 solo tiene diez meses.
-- * Estacionalidad: noviembre es el mejor mes los dos años, por el
--   Black Friday, y diciembre sigue fuerte por la Navidad. Agosto es el
--   peor mes. Julio y enero repuntan con las rebajas.
-- * Cancelaciones: el 18 % de los pedidos pagados por transferencia se
--   cancela, frente al 2-3 % del resto de métodos. Probablemente el
--   cliente no llega a pagar. Habría que confirmarlo con la agencia y
--   proponer un recordatorio a las 48 horas.
-- * Repetición: el 37 % de los clientes con algún pedido ha repetido
--   (1.485 de 4.034). Los 20 más fieles tienen 8 pedidos válidos o más;
--   el que más, el cliente 245, con 11 pedidos y unos 1.360 €.
-- * Captación: Instagram y Google traen casi seis de cada diez clientes
--   registrados. Falta saber cuántos de ellos llegan a comprar.
-- * Pendiente para la 2.1.3: qué productos y categorías venden más
--   (lineas_pedido solo tiene el producto_id), quién es el cliente 245
--   y quiénes son los registrados que nunca compran.
