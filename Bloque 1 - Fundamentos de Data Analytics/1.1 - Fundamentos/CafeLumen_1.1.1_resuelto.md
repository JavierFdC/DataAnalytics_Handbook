# Café Lumen: ciclo de vida del dato

**Bloque 1 · Sesión 1.1.1** · Solución de referencia

## Contexto

Café Lumen es una cadena de cafeterías de especialidad con cuatro locales (Madrid, Barcelona, Valencia y Sevilla) y, desde enero de 2025, una app de pedidos y fidelización. La directora de operaciones, Elena Ruiz, quiere dejar de decidir por intuición y nos ha planteado tres preguntas: qué indicadores mirar cada mes, por qué las ventas de junio fueron peores que las de mayo y si la app está funcionando.

## Datos recibidos

| Archivo | Qué contiene | Filas |
|---|---|--:|
| `ventas.csv` | Las ventas de las cuatro tiendas y de la app, de enero a junio de 2025, con una fila por producto vendido en cada ticket | 80.874 |
| `tiendas.csv` | Las características de cada local: ciudad, tipo de ubicación, apertura, superficie y plazas | 4 |
| `productos.csv` | La carta: categoría, precio de venta y coste de cada producto | 22 |
| `objetivos_mensuales.csv` | El objetivo de ventas de cada tienda en cada mes del semestre | 24 |

## Ciclo de vida

```mermaid
flowchart LR
    A(["TPV y app"]) --> B("<b>Servidores</b><br/>TPV, app y Excel") --> C("<b>Extracto</b><br/>ventas.csv") --> D("<b>Análisis</b><br/>nosotros") --> E("<b>Informe</b><br/>mensual") --> F(["Decisión"])

    classDef pill fill:#37474f,stroke:#37474f,color:#ffffff
    classDef s1 fill:#e3f2fd,stroke:#90caf9,color:#0d47a1
    classDef s2 fill:#bbdefb,stroke:#64b5f6,color:#0d47a1
    classDef s3 fill:#90caf9,stroke:#42a5f5,color:#0d47a1
    classDef s4 fill:#64b5f6,stroke:#1e88e5,color:#0d2a5c
    class A,F pill
    class B s1
    class C s2
    class D s3
    class E s4
    linkStyle default stroke:#90a4ae,stroke-width:2px
```

| Fase | En Café Lumen | Responsable |
|---|---|---|
| 1. Generación | El TPV de cada tienda registra cada venta: productos, cantidades, precios, hora y estado del ticket. La app registra además el cliente y, si la deja, su valoración. | Personal de tienda y clientes de la app |
| 2. Ingesta | Cada noche, el TPV de cada local envía el cierre del día al servidor central de su proveedor. Los pedidos de la app ya están en la nube de otro proveedor. | Proveedores del TPV y de la app |
| 3. Almacenamiento | Los datos están repartidos en tres sitios: la base de datos del TPV, la de la app y un Excel con los objetivos mensuales. | Proveedores del TPV y de la app; dirección financiera (objetivos) |
| 4. Transformación | Alguien ha unido las ventas del TPV y de la app en una sola tabla, con los mismos códigos de tienda y de producto. El resultado es el extracto que hemos recibido. | Equipo de sistemas |
| 5. Análisis | Calculamos los indicadores, investigamos la caída de junio y evaluamos la app. | Nosotros, como analistas |
| 6. Visualización | Un informe mensual de una página y, más adelante, un dashboard para la dirección. | Nosotros, como analistas |
| 7. Decisión | Ajustar horarios y plantillas, preparar la carta de verano y decidir si se sigue invirtiendo en la app. | Elena Ruiz y los encargados de tienda |

Recibimos los datos en la fase 4: la ingesta, el almacenamiento y buena parte de la transformación ya los ha hecho otra persona. Antes de analizar conviene saber qué decisiones se tomaron por el camino.

## Primeras observaciones

- Una fila de `ventas.csv` no es un ticket: el mismo `ticket_id` aparece en varias filas, una por cada producto del pedido (por ejemplo, `T000002`, con un flat white y dos sándwiches).
- `cliente_id` está vacío en la mayoría de las filas. Los pedidos de la app siempre lo tienen; en tienda solo aparece en algunas ventas.
- `valoracion_ticket` solo tiene valor en algunos pedidos de la app. En las ventas de tienda está siempre vacía.
- `canal` toma tres valores (`Local`, `Para llevar` y `App`) y `estado_ticket`, dos (`Completado` y `Anulado`).
- `descuento_pct` vale casi siempre 0. Los descuentos del 10 % y del 100 % solo aparecen en pedidos de la app.
- `tienda_id` aparece en `ventas.csv`, `tiendas.csv` y `objetivos_mensuales.csv`, y `producto_id` en `ventas.csv` y `productos.csv`: son las columnas que relacionan las tablas.
- `ventas.csv` repite el nombre y la categoría de cada producto, que ya están en `productos.csv`.
- `objetivos_mensuales.csv` tiene una fila por tienda y mes: 4 tiendas × 6 meses = 24 filas.

## Preguntas para el equipo de sistemas

- ¿Qué significa que un ticket esté `Anulado`? ¿Se cobró y se devolvió, o nunca llegó a cobrarse?
- ¿Por qué hay filas sin `cliente_id`? ¿Corresponden a clientes que pagan sin tarjeta de socio?
- ¿`importe` lleva IVA?
- ¿Qué significa un descuento del 100 %? ¿Son productos canjeados con los puntos de la app?
- ¿Por qué solo tienen valoración los pedidos de la app? ¿La app pide valorar todos los pedidos o solo algunos?
- ¿La `hora` es la del pedido o la del pago? En la app pueden no coincidir.
- ¿Los objetivos mensuales se fijaron antes de empezar cada mes o después?
- ¿Podemos tener los datos de 2024, para comparar con el mismo periodo del año anterior?
