# Café Lumen: fichas de KPI

**Bloque 1 · Sesión 1.1.2** · Solución de referencia

Propuesta de indicadores para el seguimiento mensual de la dirección. Todas las cifras son del primer semestre de 2025.

## Ventas netas

| Campo | Definición |
|---|---|
| **Nombre** | Ventas netas |
| **Objetivo de negocio** | Seguir la facturación de cada tienda frente a su objetivo mensual |
| **Fórmula** | Suma de `importe` de `ventas.csv` |
| **Fuente** | `ventas.csv`: `importe`, `estado_ticket`, `fecha`, `tienda_id` |
| **Criterios de exclusión** | Se excluyen las líneas con `estado_ticket = Anulado` |
| **Meta** | `objetivo_ventas_eur` de `objetivos_mensuales.csv` para esa tienda y mes |
| **Frecuencia y desglose** | Mensual, por tienda; seguimiento semanal del acumulado |
| **Responsable** | Encargado de cada tienda; consolidado, dirección de operaciones |

**Valor del semestre:** 237.144,91 €. Sin excluir los anulados saldría 240.451,99 €.

## Ticket medio

| Campo | Definición |
|---|---|
| **Nombre** | Ticket medio |
| **Objetivo de negocio** | Saber cuánto gasta cada cliente por visita, para valorar la venta cruzada (añadir bollería o salado al café) y los cambios de carta y de precios |
| **Fórmula** | Ventas netas / número de tickets distintos (valores distintos de `ticket_id`). El denominador son tickets, no filas: una fila es una línea de ticket |
| **Fuente** | `ventas.csv`: `importe`, `ticket_id`, `estado_ticket`, `fecha`, `tienda_id`, `canal` |
| **Criterios de exclusión** | Se excluyen los tickets anulados, en el numerador y en el denominador. Los 66 tickets completados de 0 € (canjes de puntos de la app) **sí se cuentan**: son clientes atendidos, y excluirlos haría parecer el ticket de la app mayor de lo que es. Su efecto es pequeño: 5,01 € con ellos, 5,02 € sin ellos |
| **Meta** | Sin histórico no hay una referencia fiable. Meta provisional: no bajar de 5,00 € en la cadena, y revisarla cuando tengamos los datos de 2024 |
| **Frecuencia y desglose** | Mensual, por tienda y por canal |
| **Responsable** | Encargado de cada tienda; consolidado, dirección de operaciones |

**Valor del semestre:** 5,01 € (237.144,91 € entre 47.318 tickets). Si se dividiera entre filas, saldría 2,97 €.

Es una medida **no aditiva**: el ticket medio de la cadena no es la media de los de cada tienda. Se recalcula con los totales.

## Peso de la app

| Campo | Definición |
|---|---|
| **Nombre** | Peso de la app |
| **Objetivo de negocio** | Medir la adopción de la app, que la empresa quiere hacer crecer |
| **Fórmula** | Tickets con `canal = App` / total de tickets × 100. Se cuentan tickets, no ventas: lo que medimos es cuántas compras pasan por la app. En ventas, el peso sale más bajo (10,7 %) por el descuento del 10 % y los canjes, y mezclaría la adopción con el precio |
| **Fuente** | `ventas.csv`: `ticket_id`, `canal`, `estado_ticket`, `fecha`, `tienda_id` |
| **Criterios de exclusión** | Se excluyen los tickets anulados, en el numerador y en el denominador |
| **Meta** | 25 % de los tickets en diciembre de 2025. Supone ganar algo más de un punto al mes, la mitad del ritmo del primer semestre, porque el crecimiento de una app se frena con el tiempo |
| **Frecuencia y desglose** | Mensual, por tienda |
| **Responsable** | Responsable de la app (marketing); en cada tienda, el encargado, que la promociona en barra |

**Valor del semestre:** 11,9 % (5.621 de 47.318 tickets). Ha pasado del 5,3 % en enero al 18,1 % en junio.

Este KPI se lee siempre junto a las ventas netas: si la app crece porque clientes que ya venían pasan a pedir con descuento, el peso sube pero los ingresos bajan.

## Satisfacción del cliente (reto opcional)

| Campo | Definición |
|---|---|
| **Nombre** | Satisfacción del cliente |
| **Objetivo de negocio** | Detectar problemas de servicio en los pedidos de la app (esperas, pedidos incompletos) |
| **Fórmula** | Media de `valoracion_ticket` con un valor por ticket, sobre los tickets valorados. Se publica junto al número de valoraciones y al % de pedidos de la app valorados |
| **Fuente** | `ventas.csv`: `valoracion_ticket`, `ticket_id`, `canal`, `estado_ticket`, `fecha`, `tienda_id` |
| **Criterios de exclusión** | Se excluyen los tickets anulados. Los tickets sin valoración no se cuentan como 0: no entran en el cálculo |
| **Meta** | Media de 4,0 o más y, como mucho, un 10 % de valoraciones de 1 o 2 estrellas |
| **Frecuencia y desglose** | Mensual, por tienda. Con menos de 30 valoraciones en un mes, la cifra no se publica sola: se acumula con la del mes anterior |
| **Responsable** | Encargado de cada tienda; responsable de la app |

**Valor del semestre:** 4,07 sobre 2.546 tickets valorados, el 45 % de los pedidos de la app. El 76 % de las valoraciones son de 4 o 5 estrellas y el 10 %, de 1 o 2.

Limitación importante: solo valoran los clientes de la app, y solo los que quieren. Este KPI no mide la satisfacción de los clientes de barra, que son casi nueve de cada diez.
