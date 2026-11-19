-- =====================================================================
-- Casa Olivo · 2.1.1 · Reconocimiento de la base de datos
-- Solución de referencia
-- =====================================================================

-- 1. ¿Cuántos productos tiene el catálogo y qué aspecto tienen?
SELECT *
FROM productos;                                -- 48 filas

-- 2. ¿Hay productos retirados?
SELECT *
FROM productos
WHERE activo = FALSE;                          -- 1 fila: la toalla de playa

-- 3. ¿Qué margen dejan los productos de Iluminación?
SELECT nombre,
       precio,
       coste,
       precio - coste                              AS margen_unitario,
       ROUND((precio - coste) / precio * 100, 1)   AS margen_pct
FROM productos
WHERE categoria_id = 5;                        -- 7 filas

-- 4. ¿Qué productos se dieron de alta en 2025, y cuándo entró cada uno?
SELECT nombre,
       fecha_alta
FROM productos
WHERE fecha_alta >= '2025-01-01';              -- 5 filas

-- 5. ¿Qué clientes viven en las islas (Baleares y Canarias)?
SELECT nombre,
       apellidos,
       ciudad,
       provincia
FROM clientes
WHERE provincia IN ('Islas Baleares', 'Las Palmas', 'Santa Cruz de Tenerife');   -- 373 filas

-- 6. ¿Qué pedidos se hicieron en la semana del Black Friday de 2025?
SELECT *
FROM pedidos
WHERE fecha_pedido BETWEEN '2025-11-24' AND '2025-11-30';   -- 285 filas

-- 7a. ¿Qué pedidos se cancelaron?
SELECT *
FROM pedidos
WHERE estado = 'Cancelado';                    -- 238 filas

-- 7b. ¿Y cuántos de los cancelados se pagaron por transferencia?
SELECT *
FROM pedidos
WHERE estado = 'Cancelado'
  AND metodo_pago = 'Transferencia';            -- 101 filas

-- 8. ¿Qué pedidos tienen un subtotal de 200 € o más, y cuál es su total?
SELECT pedido_id,
       fecha_pedido,
       subtotal,
       gastos_envio,
       subtotal + gastos_envio AS total
FROM pedidos
WHERE subtotal >= 200;                         -- 316 filas

-- =====================================================================
-- Primeras observaciones
-- =====================================================================
-- * El catálogo tiene 48 productos y solo uno retirado: la toalla de
--   playa de rizo, un producto de temporada.
-- * Iluminación deja márgenes altos, de entre el 54 % y el 61 % del
--   precio. La lámpara de pie Arco, a 189 €, es el producto más caro de
--   la categoría y deja 103 € por unidad.
-- * Hay 5 productos dados de alta en 2025. Tres entraron en la última
--   semana de diciembre: no han tenido tiempo de venderse. El rallador
--   de cerámica lleva desde marzo. ¿Se ha vendido alguno? (-> 2.1.3)
-- * 373 clientes viven en las islas. Si los gastos de envío son
--   distintos para ellos, conviene revisar si compran menos.
-- * En la semana del Black Friday de 2025 hubo 285 pedidos, unos 40 al
--   día. Es una semana excepcional: habrá que tenerla en cuenta al
--   comparar meses. (-> 2.1.2)
-- * 101 de los 238 pedidos cancelados se pagaron por transferencia.
--   Los pedidos por transferencia son 562 de 6.974 (un 8 %), pero se
--   llevan el 42 % de las cancelaciones. ¿Por qué? (-> 2.1.2)
-- * 316 pedidos tienen un subtotal de 200 € o más, y ninguno de los
--   que aparecen paga gastos de envío. ¿A partir de qué importe es
--   gratis el envío?
