-- Crear Base de Datos e Ingresar a ella
CREATE DATABASE biblioteca;
\c biblioteca

-- Crear Tablas
CREATE TABLE libros(codigo INT PRIMARY KEY, nombre VARCHAR(100) NOT NULL);

CREATE TABLE autores(id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL);

CREATE TABLE editoriales(id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL);

CREATE TABLE editoriales_libros(libro_cod INT UNIQUE, editorial_id INT, FOREIGN KEY(libro_cod) REFERENCES libros(codigo), FOREIGN KEY(editorial_id) REFERENCES editoriales(id));

CREATE TABLE autores_libros(libro_cod INT NOT NULL, autor_id INT NOT NULL, FOREIGN KEY(libro_cod) REFERENCES libros(codigo), FOREIGN KEY(autor_id) REFERENCES autores(id));

CREATE TABLE lectores(id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL);

CREATE TABLE prestamos(id SERIAL PRIMARY KEY, fecha_devolucion DATE NOT NULL, lector_id INT NOT NULL, libro_cod INT NOT NULL, FOREIGN KEY(lector_id) REFERENCES lectores(id), FOREIGN KEY(libro_cod) REFERENCES libros(codigo));