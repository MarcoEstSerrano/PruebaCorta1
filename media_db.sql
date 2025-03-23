CREATE DATABASE media_db;

USE media_db;

CREATE TABLE multimedia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    url VARCHAR(255) NOT NULL,
    tipo VARCHAR(20) NOT NULL
);

ALTER USER 'root'@'localhost' IDENTIFIED BY 'Admin$1234';
FLUSH PRIVILEGES;