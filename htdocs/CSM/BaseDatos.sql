CREATE DATABASE EncomiendasCSM;
USE EncomiendasCSM;

-- Crear la tabla de usuarios
CREATE TABLE Usuarios (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_nombre VARCHAR(255) NOT NULL,
    usuario_email VARCHAR(255) UNIQUE NOT NULL,
    usuario_password VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('usuario', 'admin') DEFAULT 'usuario'
);

-- Crear la tabla de clientes
CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    cliente_nombres VARCHAR(255) NOT NULL,
    cliente_apellidos VARCHAR(255) NOT NULL,
    direccion_origen VARCHAR(255) NOT NULL,
    direccion_destino VARCHAR(255) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id) 
);

-- Crear la tabla de envíos
CREATE TABLE Envios (
    envio_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    usuario_id INT NOT NULL,
    descripcion TEXT NOT NULL,
    costo DECIMAL(10, 2),
    hora_salida DATETIME NOT NULL,
    hora_llegada DATETIME,
    producto_perdido BOOLEAN DEFAULT FALSE,
    retrasos BOOLEAN DEFAULT FALSE,
    estado ENUM('pendiente', 'en camino', 'entregado', 'cancelado') DEFAULT 'pendiente',
    numero_seguimiento VARCHAR(10),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id) ,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id) 
);
