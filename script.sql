-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS db_springboot;

-- Seleccionar la base de datos
USE db_springboot;

-- Crear la tabla
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,  -- Similar a @Id y @GeneratedValue(strategy = GenerationType.IDENTITY)
    name VARCHAR(255) NOT NULL,            -- Campo 'name' con restricción NOT NULL
    lastname VARCHAR(255) NOT NULL,        -- Campo 'lastname' con restricción NOT NULL
    email VARCHAR(255) NOT NULL UNIQUE,    -- Campo 'email' con restricción NOT NULL y UNIQUE para evitar duplicados
    username VARCHAR(16) NOT NULL,         -- Campo 'username' con restricción NOT NULL
    password VARCHAR(255) NOT NULL,        -- Campo 'password' con restricción NOT NULL
    CHECK (CHAR_LENGTH(username) >= 4 AND CHAR_LENGTH(username) <= 16)  -- Restricción de tamaño para 'username'
);

ALTER TABLE users ADD COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP;


-- Agregar un índice único en 'email' si no está presente (para garantizar que no haya duplicados)
CREATE UNIQUE INDEX idx_email ON users(email);
USE db_springboot;
SELECT * FROM users
