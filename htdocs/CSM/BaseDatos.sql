CREATE DATABASE EncomiendasCSM;
use EncomiendasCSM;

CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT,
    cliente_nombres VARCHAR(255) NOT NULL,
    cliente_apellidos VARCHAR(255) NOT NULL,
    direccion_origen VARCHAR(255) NOT NULL,
    direccion_destino VARCHAR(255) NOT NULL,
    PRIMARY KEY (cliente_id)
);

CREATE TABLE Usuarios (
    usuario_id INT AUTO_INCREMENT,
    usuario_nombre VARCHAR(255) NOT NULL,
    usuario_email VARCHAR(255) UNIQUE NOT NULL,
    usuario_password VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('usuario', 'admin') DEFAULT 'usuario',
    PRIMARY KEY (usuario_id)
);

CREATE TABLE Envios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    hora_salida DATETIME NOT NULL,
    hora_llegada DATETIME,
    producto_perdido BOOLEAN DEFAULT FALSE,
    retrasos BOOLEAN DEFAULT FALSE,
    costo DECIMAL(10, 2) NOT NULL,
    estado ENUM('pendiente', 'en camino', 'entregado', 'cancelado') DEFAULT 'pendiente',
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

