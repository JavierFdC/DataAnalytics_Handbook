# Casa Olivo: respuestas al segundo encargo

**Para:** Clara Benítez · **De:** Javier Fernández · Solución de referencia

## Resumen

Las sábanas de percal cuestan mucho más de lo que parecía: generan la mitad de todo el dinero devuelto y, además, hacen perder clientes, porque quien las devuelve en su primera compra casi nunca vuelve. Los dos grupos de clientes prioritarios son los 501 que compraron varias veces y llevan más de seis meses sin volver, y los 683 que llegaron en el último trimestre, a los que hay que escribir en enero y febrero. Y hay una señal de alerta: en el último trimestre de 2025 Casa Olivo creció bastante menos, porque le cuesta cada vez más atraer clientes nuevos.

## 1. ¿Cuánto nos cuestan de verdad las sábanas?

Los 77 pedidos devueltos que incluían las sábanas suman 10.443 €: casi la mitad de los 20.992 € devueltos en toda la historia de la tienda, por un solo producto de 48. Y el problema va a más: se devolvió el 18 % de los pedidos con sábanas en 2024 y el 24 % en 2025.

El coste no termina ahí. De los clientes que estrenaron Casa Olivo con unas sábanas y se las quedaron, volvió el 45 %, más que la media de la tienda (37 %). De los que las devolvieron, solo el 22 %. No es por devolver en general: cuando el primer pedido devuelto no lleva sábanas, vuelve el 42 %.

La causa no está en los datos. La hipótesis más probable es que no encajan en los colchones de los clientes (medidas, profundidad del bajo) o que el tejido no es lo que esperaban. Los grupos son pequeños (46 clientes devolvieron las sábanas en su primera compra), pero todos los datos apuntan en la misma dirección.

## 2. ¿A qué clientes dirigimos cada campaña?

| Segmento | Clientes | Ventas | Gasto medio | Acción |
|---|--:|--:|--:|---|
| Fiel | 433 (11 %) | 29 % | 312 € | Novedades en primicia, sin descuentos |
| Repetidor | 434 (11 %) | 13 % | 142 € | Llevarlos al tercer pedido |
| En riesgo | 501 (13 %) | 21 % | 193 € | Reactivarlos antes de perderlos |
| Nuevo | 683 (18 %) | 10 % | 69 € | Conseguir la segunda compra |
| Una sola compra | 1.804 (47 %) | 27 % | 68 € | Campaña de recuerdo, de bajo coste |

Las dos prioridades son los clientes **en riesgo**, que ya conocen la tienda y han gastado bastante, y los **nuevos**. La mitad de las segundas compras llega antes de 95 días, así que a los nuevos del último trimestre hay que escribirles en enero y febrero de 2026. Tres de cada cuatro segundas compras llegan antes de seis meses: pasado ese plazo, es difícil que un cliente vuelva.

Sobre el Black Friday: a primera vista, sus clientes vuelven menos (27 % frente a 37 %), pero la mitad llegó en noviembre de 2025 y no ha tenido tiempo de volver. Comparando solo los clientes que llegaron en 2024, la diferencia casi desaparece: vuelve el 48,5 %, frente al 53 % del resto. El Black Friday es una buena puerta de entrada.

## 3. ¿Cómo seguimos el negocio mes a mes?

El cuadro de mando compara cada mes con el mismo mes del año anterior, y añade el acumulado del año y la media de los tres últimos meses. Comparar con el mes anterior engaña: noviembre siempre vende más que octubre por el Black Friday.

De marzo a octubre de 2025, cada mes vendió entre un 53 % y un 92 % más que el mismo mes de 2024. En noviembre el crecimiento bajó al 35 % y en diciembre al 17 %, aunque noviembre fue el mejor mes de la historia. La explicación está en el tipo de cliente: en el último trimestre, las ventas de clientes que repiten crecieron un 73 %, pero las de primeras compras solo un 9,5 % (de marzo a septiembre crecían un 35 %). La causa de que se frene la captación hay que contrastarla con marketing.

Las ventas están muy repartidas por el catálogo: hacen falta 29 de los 44 productos vendidos para llegar al 80 % de las ventas, y el que más vende, las sábanas, solo aporta el 5 %. El negocio no depende de unos pocos productos.

## Recomendaciones

1. **Arreglar la ficha de las sábanas de percal** (medidas, profundidad del bajo y tejido) con el equipo de atención al cliente. Evita devoluciones y conserva clientes que volverían más que la media.
2. **Escribir a los 683 clientes nuevos en enero y febrero** para conseguir su segunda compra, y lanzar una campaña de reactivación para los 501 clientes en riesgo.
3. **Revisar con marketing la captación de clientes nuevos**, que se ha frenado justo en la temporada fuerte, y mantener el Black Friday preparando la segunda compra de quienes llegan con él.

## Anexo: definiciones, vistas y consultas

- **Ventas netas:** suma del `subtotal` de los pedidos, sin los cancelados ni los devueltos y sin gastos de envío.
- **Segmentos**, a 31 de diciembre de 2025: *Fiel*, 3 o más pedidos, el último desde julio de 2025; *Repetidor*, 2 pedidos, el último desde julio; *En riesgo*, 2 o más pedidos, el último antes de julio; *Nuevo*, 1 pedido, desde octubre; *Una sola compra*, 1 pedido, anterior a octubre.
- **Vistas:** `v_pedidos_validos` (los pedidos que cuentan para las ventas netas), `v_lineas_validas` (sus líneas, con producto, categoría, importe y margen) y `v_clientes_resumen` (pedidos, gasto y fechas de primera y última compra de cada comprador).
- **Consultas:** [CasaOlivo_2.2.1_resuelto.sql](CasaOlivo_2.2.1_resuelto.sql), [CasaOlivo_2.2.2_vistas_resuelto.sql](CasaOlivo_2.2.2_vistas_resuelto.sql), [CasaOlivo_2.2.2_ctes_resuelto.sql](CasaOlivo_2.2.2_ctes_resuelto.sql) y [CasaOlivo_2.2.3_resuelto.sql](CasaOlivo_2.2.3_resuelto.sql).
