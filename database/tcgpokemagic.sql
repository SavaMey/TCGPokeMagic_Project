/* BASE DE DATOS TCGPOKEMAGIC */

CREATE DATABASE IF NOT EXISTS tcgpokemagic
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE tcgpokemagic;


/* BORRAR TABLAS ANTERIORES */

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS detalle_pedido;
DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS categoria;

SET FOREIGN_KEY_CHECKS = 1;


/* TABLA CATEGORIA */

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);


/* TABLA PRODUCTO */

CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(150) NOT NULL,
    descripcion VARCHAR(500),
    precio INT NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    imagen VARCHAR(255),
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,

    CONSTRAINT fk_producto_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria)
);


/* TABLA CLIENTE */

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    rut VARCHAR(12) NOT NULL UNIQUE
);


/* TABLA PEDIDO */

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total INT NOT NULL,
    estado VARCHAR(30) NOT NULL,
    id_cliente INT NOT NULL,

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
);


/* TABLA DETALLE PEDIDO */

CREATE TABLE detalle_pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    cantidad INT NOT NULL,
    precio_unitario INT NOT NULL,
    subtotal INT NOT NULL,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,

    CONSTRAINT fk_detalle_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido),

    CONSTRAINT fk_detalle_producto
        FOREIGN KEY (id_producto)
        REFERENCES producto(id_producto)
);


/* CATEGORIAS */

INSERT INTO categoria (nombre) VALUES
('Pokemon'),
('Magic'),
('Hololive'),
('Otros');


/* PRODUCTOS */


/* CARTA 1 */

INSERT INTO producto (
    codigo,
    nombre,
    descripcion,
    precio,
    stock,
    imagen,
    id_categoria
)
VALUES (
    'carta_1',
    'Hololive: Ouro Kronii',
    'Carta de tipo Oshi de Ouro Kronii en su versión de máxima rareza paralela (OUR), con acabado holográfico especial (Foil).',
    177830,
    3,
    'images (16).webp',
    3
);


/* CARTA 2 */

INSERT INTO producto (
    codigo,
    nombre,
    descripcion,
    precio,
    stock,
    imagen,
    id_categoria
)
VALUES (
    'carta_2',
    'Pokemon: Sceptile',
    'Carta coleccionable de Pokemon Sceptile.',
    206964,
    5,
    '88948_in_1000x1000.webp',
    1
);


/* CARTA 3 */

INSERT INTO producto (
    codigo,
    nombre,
    descripcion,
    precio,
    stock,
    imagen,
    id_categoria
)
VALUES (
    'carta_3',
    'MAGIC: Cloud, Midgar Mercenary',
    'Carta especial dibujada por TETSUYA NOMURA, una de las más valiosas.',
    62999991,
    1,
    '638818_in_1000x1000.webp',
    2
);


/* CARTA 4 */

INSERT INTO producto (
    codigo,
    nombre,
    descripcion,
    precio,
    stock,
    imagen,
    id_categoria
)
VALUES (
    'carta_4',
    'Pokemon: Vaporeon Star',
    'Carta especial de Vaporeon, edición X Power Keepers, ULTRA RARE.',
    1259955,
    2,
    '90292_in_1000x1000.webp',
    1
);


/* CARTA 5 */

INSERT INTO producto (
    codigo,
    nombre,
    descripcion,
    precio,
    stock,
    imagen,
    id_categoria
)
VALUES (
    'carta_5',
    'Leonardo, Sewer Samurai Art Card (20/54) (Gold-Stamped Signature)',
    'Carta especial de Leonardo de las Tortugas Ninja, edición limitada Art Series: Teenage Mutant Ninja Turtles.',
    13770,
    8,
    '680290_in_1000x1000.webp',
    4
);


/* CARTA 6 */

INSERT INTO producto (
    codigo,
    nombre,
    descripcion,
    precio,
    stock,
    imagen,
    id_categoria
)
VALUES (
    'carta_6',
    'Hololive: Houshou Marine',
    'Carta especial de Houshou Marine edición Quintet Spectrum, de gran rareza.',
    2700000,
    2,
    '657538_in_1000x1000.webp',
    3
);