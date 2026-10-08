-- =====================================================================
-- Casa Olivo · Bloque 2 - SQL y bases de datos
-- Script 1 de 2: creación de las tablas
--
-- Cómo usarlo: en pgAdmin, abrir el Query Tool sobre la base de datos
-- casa_olivo, abrir este archivo y ejecutarlo completo (F5).
-- Después, ejecutar 02_insertar_datos.sql.
--
-- Se puede volver a ejecutar: borra las tablas si ya existen y las
-- crea de nuevo, vacías.
-- =====================================================================

DROP TABLE IF EXISTS lineas_pedido, pedidos, newsletter, clientes, productos, categorias;


-- Familias de productos del catálogo
CREATE TABLE categorias (
    categoria_id  SMALLINT      PRIMARY KEY,
    nombre        VARCHAR(30)   NOT NULL UNIQUE,
    descripcion   VARCHAR(120)  NOT NULL
);


-- Catálogo: un producto por fila, con su precio de venta actual (IVA incluido)
-- y su coste de compra al proveedor
CREATE TABLE productos (
    producto_id   INTEGER       PRIMARY KEY,
    nombre        VARCHAR(60)   NOT NULL,
    categoria_id  SMALLINT      NOT NULL REFERENCES categorias (categoria_id),
    precio        NUMERIC(7,2)  NOT NULL CHECK (precio > 0),
    coste         NUMERIC(7,2)  NOT NULL CHECK (coste > 0),
    fecha_alta    DATE          NOT NULL,
    activo        BOOLEAN       NOT NULL DEFAULT TRUE
);


-- Personas registradas en la web, hayan comprado o no
CREATE TABLE clientes (
    cliente_id        INTEGER       PRIMARY KEY,
    nombre            VARCHAR(40)   NOT NULL,
    apellidos         VARCHAR(80)   NOT NULL,
    email             VARCHAR(100)  NOT NULL UNIQUE,
    fecha_nacimiento  DATE,
    ciudad            VARCHAR(40)   NOT NULL,
    provincia         VARCHAR(30)   NOT NULL,
    fecha_registro    DATE          NOT NULL,
    origen            VARCHAR(20)   NOT NULL
);


-- Cabecera de cada pedido: quién, cuándo, cómo pagó y en qué estado está.
-- subtotal es la suma de sus líneas; gastos_envio se cobra aparte.
CREATE TABLE pedidos (
    pedido_id     INTEGER       PRIMARY KEY,
    cliente_id    INTEGER       NOT NULL REFERENCES clientes (cliente_id),
    fecha_pedido  DATE          NOT NULL,
    estado        VARCHAR(12)   NOT NULL
                  CHECK (estado IN ('Entregado', 'Enviado', 'Cancelado', 'Devuelto')),
    metodo_pago   VARCHAR(15)   NOT NULL,
    codigo_promo  VARCHAR(20),
    subtotal      NUMERIC(8,2)  NOT NULL CHECK (subtotal >= 0),
    gastos_envio  NUMERIC(5,2)  NOT NULL CHECK (gastos_envio >= 0)
);


-- Detalle de cada pedido: un producto por línea, con el precio
-- realmente cobrado (ya incluye el descuento del código promocional)
CREATE TABLE lineas_pedido (
    pedido_id        INTEGER       NOT NULL REFERENCES pedidos (pedido_id),
    num_linea        SMALLINT      NOT NULL,
    producto_id      INTEGER       NOT NULL REFERENCES productos (producto_id),
    cantidad         SMALLINT      NOT NULL CHECK (cantidad > 0),
    precio_unitario  NUMERIC(7,2)  NOT NULL CHECK (precio_unitario > 0),
    PRIMARY KEY (pedido_id, num_linea)
);


-- Suscriptores del boletín de correo. Lo gestiona otra herramienta
-- de marketing: no está relacionada con clientes por ninguna clave.
CREATE TABLE newsletter (
    email       VARCHAR(100)  PRIMARY KEY,
    fecha_alta  DATE          NOT NULL
);
