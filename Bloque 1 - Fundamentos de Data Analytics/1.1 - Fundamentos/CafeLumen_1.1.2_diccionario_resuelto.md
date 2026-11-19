# Café Lumen: diccionario de datos

**Bloque 1 · Sesión 1.1.2** · Solución de referencia

## ventas.csv

**Granularidad:** una fila por producto dentro de un ticket (línea de ticket). Clave: `linea_id`. Las columnas marcadas con *(ticket)* son datos del ticket y se repiten en todas sus líneas.

| Columna | Tipo de variable | Dimensión / medida | Descripción | Ejemplo |
|---|---|---|---|---|
| `linea_id` | Cualitativa nominal (identificador) | Dimensión | Identificador único de la línea | `L000001` |
| `ticket_id` | Cualitativa nominal (identificador) | Dimensión; su recuento de valores distintos es el número de tickets | Ticket al que pertenece la línea; se repite en todas sus líneas | `T000002` |
| `fecha` | Temporal | Dimensión | Día de la venta *(ticket)* | `2025-01-02` |
| `hora` | Temporal | Dimensión | Hora de la venta, en horas y minutos *(ticket)* | `07:15` |
| `tienda_id` | Cualitativa nominal (identificador) | Dimensión | Tienda donde se vende o se recoge el pedido; enlaza con `tiendas.csv` *(ticket)* | `MAD` |
| `canal` | Cualitativa nominal | Dimensión | Cómo se hizo el pedido: `Local`, `Para llevar` o `App` *(ticket)* | `Local` |
| `cliente_id` | Cualitativa nominal (identificador) | Dimensión; su recuento de valores distintos es el número de clientes identificados | Socio del programa de fidelización. Vacío cuando el cliente no se identifica (el 69 % de las líneas) *(ticket)* | `C00072` |
| `producto_id` | Cualitativa nominal (identificador) | Dimensión | Producto vendido; enlaza con `productos.csv` | `P05` |
| `producto` | Cualitativa nominal | Dimensión | Nombre del producto; repite el de `productos.csv` | `Flat white` |
| `categoria` | Cualitativa nominal | Dimensión | Categoría del producto (cinco valores); repite la de `productos.csv` | `Café` |
| `cantidad` | Cuantitativa discreta | Medida aditiva | Unidades del producto en la línea (de 1 a 3) | `2` |
| `precio_unitario` | Cuantitativa continua | Medida no aditiva | Precio de una unidad en euros, antes del descuento; coincide con el de la carta | `4.20` |
| `descuento_pct` | Cuantitativa (solo toma 0, 10 y 100) | Medida no aditiva; en la práctica se usa como dimensión para agrupar | Descuento aplicado a la línea, en porcentaje. El 10 % y el 100 % solo aparecen en la app | `10` |
| `importe` | Cuantitativa continua | Medida aditiva | Importe de la línea en euros: cantidad × precio × (1 − descuento) | `8.40` |
| `estado_ticket` | Cualitativa nominal | Dimensión | `Completado` o `Anulado`. Los anulados se excluyen de las ventas *(ticket)* | `Completado` |
| `valoracion_ticket` | Cualitativa ordinal (de 1 a 5) | Medida no aditiva (media por ticket); también dimensión ("tickets con 1 estrella") | Valoración del pedido. Solo existe en pedidos de la app, y no en todos *(ticket)* | `5` |

## tiendas.csv

**Granularidad:** una fila por tienda. Clave: `tienda_id`.

| Columna | Tipo de variable | Dimensión / medida | Descripción | Ejemplo |
|---|---|---|---|---|
| `tienda_id` | Cualitativa nominal (identificador) | Dimensión | Código de la tienda | `MAD` |
| `nombre` | Cualitativa nominal | Dimensión | Nombre comercial del local | `Lumen Sol` |
| `ciudad` | Cualitativa nominal | Dimensión | Ciudad del local | `Madrid` |
| `tipo_ubicacion` | Cualitativa nominal | Dimensión | Tipo de zona: calle comercial, barrio residencial, campus o estación | `Calle comercial` |
| `fecha_apertura` | Temporal | Dimensión | Día en que abrió el local | `2019-03-15` |
| `superficie_m2` | Cuantitativa continua | Medida; atributo fijo de la tienda, útil para ratios como ventas por m² | Superficie del local en metros cuadrados | `120` |
| `plazas_sentado` | Cuantitativa discreta | Medida aditiva entre tiendas | Número de plazas para sentarse | `40` |

## productos.csv

**Granularidad:** una fila por producto de la carta. Clave: `producto_id`.

| Columna | Tipo de variable | Dimensión / medida | Descripción | Ejemplo |
|---|---|---|---|---|
| `producto_id` | Cualitativa nominal (identificador) | Dimensión | Código del producto | `P01` |
| `producto` | Cualitativa nominal | Dimensión | Nombre del producto | `Espresso` |
| `categoria` | Cualitativa nominal | Dimensión | Categoría: café, té e infusiones, bebidas frías, bollería o salado | `Café` |
| `precio_venta` | Cuantitativa continua | Medida no aditiva | Precio de venta en euros | `1.40` |
| `coste_unitario` | Cuantitativa continua | Medida no aditiva | Coste de una unidad en euros. Multiplicado por la cantidad vendida da el coste de lo vendido, que sí se suma | `0.30` |

## objetivos_mensuales.csv

**Granularidad:** una fila por tienda y mes. Clave: `tienda_id` + `mes`.

| Columna | Tipo de variable | Dimensión / medida | Descripción | Ejemplo |
|---|---|---|---|---|
| `tienda_id` | Cualitativa nominal (identificador) | Dimensión | Tienda a la que se asigna el objetivo; enlaza con `tiendas.csv` | `MAD` |
| `mes` | Temporal (año y mes) | Dimensión | Mes del objetivo | `2025-01` |
| `objetivo_ventas_eur` | Cuantitativa continua | Medida aditiva entre tiendas y meses | Ventas que la dirección espera de la tienda en ese mes, en euros | `11500` |

Para comparar las ventas con el objetivo, primero se agregan las ventas a tienda y mes, y después se unen las dos tablas.

## Preguntas abiertas

- ¿`importe` lleva IVA? Si lo lleva, nuestras ventas no coincidirán con las de la dirección financiera.
- ¿Qué significa un ticket `Anulado`? ¿Se cobró y se devolvió, o nunca llegó a cobrarse?
- ¿Por qué solo tienen valoración los pedidos de la app? ¿La app pide valorar todos los pedidos o solo algunos?
- ¿Qué significa un descuento del 100 %? ¿Son productos canjeados con puntos de la app?
- Todas las líneas de la app llevan un 10 % de descuento, salvo las canjeadas, que llevan el 100 %. ¿Es el descuento de socio? ¿Se mantendrá igual el resto del año?
- ¿Los objetivos mensuales se fijaron antes de empezar cada mes o después?
- ¿Cambiaron los precios de la carta durante el semestre? En el extracto, todos coinciden con `productos.csv`.
