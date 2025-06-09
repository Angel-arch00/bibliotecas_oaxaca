-- Script SQL 
-- Creación de la base de datos y tablas

CREATE DATABASE IF NOT EXISTS bibliotecas_oaxaca;
USE bibliotecas_oaxaca;

-- Tabla: bibliotecas
CREATE TABLE IF NOT EXISTS bibliotecas (
biblioteca_id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(150) NOT NULL,
direccion VARCHAR(255) NOT NULL,
tipo VARCHAR(50) NOT NULL,
ciudad VARCHAR(100),
municipio VARCHAR(100),
codigo_postal VARCHAR(10),
telefono VARCHAR(20),
email VARCHAR(100),
sitio_web VARCHAR(255),
fecha_fundacion DATE
);

-- Tabla: autores
CREATE TABLE IF NOT EXISTS autores (
autor_id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
nacionalidad VARCHAR(50),
fecha_nacimiento DATE
);

-- Tabla: libros
CREATE TABLE IF NOT EXISTS libros (
libro_id INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(150) NOT NULL,
isbn VARCHAR(30),
ano_publicacion INT,
editorial VARCHAR(100),
genero VARCHAR(50),
idioma VARCHAR(50),
ejemplares_disponibles INT,
biblioteca_id INT,
FOREIGN KEY (biblioteca_id) REFERENCES bibliotecas(biblioteca_id)
);

-- Tabla intermedia: libro_autor
CREATE TABLE IF NOT EXISTS libro_autor (
libro_id INT,
autor_id INT,
PRIMARY KEY (libro_id, autor_id),
FOREIGN KEY (libro_id) REFERENCES libros(libro_id),
FOREIGN KEY (autor_id) REFERENCES autores(autor_id)
);

-- Inserts de ejemplo
-- Bibliotecas
INSERT INTO bibliotecas (biblioteca_id, nombre, direccion, tipo, ciudad, municipio, codigo_postal, telefono, email, sitio_web, fecha_fundacion) VALUES
(1, 'Biblioteca Pública Central Lic. Benito Juárez García', 'Macedonio Alcalá 303, Centro', 'Pública', 'Oaxaca de Juárez', 'Oaxaca de Juárez', '68000', '9515162458', 'contacto@bibliotecacentraloaxaca.gob.mx', 'http://www.culturas.oaxaca.gob.mx/', '1959-03-21'),
(2, 'Biblioteca Universitaria "Dr. Jorge Fernando Iturribarría"', 'Ciudad Universitaria, Av. Universidad S/N', 'Universitaria', 'Oaxaca de Juárez', 'Oaxaca de Juárez', '68120', '9515020700', 'biblioteca@uabjo.mx', 'http://www.uabjo.mx/bibliotecas', '1955-01-08'),
(3, 'Hemeroteca Pública de Oaxaca “Néstor Sánchez Hernández”', 'Reforma s/n, Centro', 'Hemeroteca', 'Oaxaca de Juárez', 'Oaxaca de Juárez', '68000', '9515162458', 'hemeroteca@oaxaca.gob.mx', NULL, '1982-07-15'),
(4, 'Biblioteca de Investigación Juan de Córdova', 'Macedonio Alcalá 403, Centro', 'Especializada', 'Oaxaca de Juárez', 'Oaxaca de Juárez', '68000', '9515165600', 'investigacion@juanpa.org', 'http://www.juanpa.org/', '1983-11-20'),
(5, 'Biblioteca Pública Municipal de la Villa de Etla', 'Morelos s/n, Centro', 'Pública', 'Villa de Etla', 'Villa de Etla', '68200', '9515215011', NULL, NULL, '1995-05-10'),
(6, 'Biblioteca Comunal de Teotitlán del Valle', 'Juárez s/n, Centro', 'Comunitaria', 'Teotitlán del Valle', 'Teotitlán del Valle', '68290', NULL, NULL, NULL, '2005-08-01');

-- Autores
INSERT INTO autores (autor_id, nombre, apellido, nacionalidad, fecha_nacimiento) VALUES
(1, 'Gabriel', 'García Márquez', 'Colombiana', '1927-03-06'),
(2, 'Octavio', 'Paz', 'Mexicana', '1914-03-31'),
(3, 'Elena', 'Poniatowska', 'Mexicana', '1932-08-19'),
(4, 'Jorge Luis', 'Borges', 'Argentina', '1899-08-24'),
(5, 'Frida', 'Kahlo', 'Mexicana', '1907-07-06'),
(6, 'Mario', 'Vargas Llosa', 'Peruana', '1936-03-28'),
(7, 'Julio', 'Cortázar', 'Argentina', '1914-08-26'),
(8, 'Carlos', 'Fuentes', 'Mexicana', '1928-11-11'),
(9, 'Isabel', 'Allende', 'Chilena', '1942-08-02'),
(10, 'Laura', 'Esquivel', 'Mexicana', '1950-09-30');

-- Libros
INSERT INTO libros (libro_id, titulo, isbn, ano_publicacion, editorial, genero, idioma, ejemplares_disponibles, biblioteca_id) VALUES
(1, 'Cien años de soledad', '978-84-376-0494-7', 1967, 'Editorial Sudamericana', 'Realismo Mágico', 'Español', 5, 1),
(2, 'El laberinto de la soledad', '978-968-16-0391-9', 1950, 'Fondo de Cultura Económica', 'Ensayo', 'Español', 3, 2),
(3, 'La noche de Tlatelolco', '978-968-411-233-6', 1971, 'Ediciones Era', 'Crónica', 'Español', 2, 1),
(4, 'Ficciones', '978-84-204-7182-4', 1944, 'Emecé Editores', 'Cuentos', 'Español', 4, 4),
(5, 'Pedro Páramo', '978-968-16-0371-1', 1955, 'Fondo de Cultura Económica', 'Novela', 'Español', 6, 5),
(6, 'El amor en los tiempos del cólera', '978-84-376-0495-4', 1985, 'Editorial Sudamericana', 'Novela Romántica', 'Español', 3, 1),
(7, 'Libertad bajo palabra', '978-968-16-0392-6', 1949, 'Fondo de Cultura Económica', 'Poesía', 'Español', 1, 2),
(8, 'Hasta no verte Jesús mío', '978-968-411-234-3', 1969, 'Ediciones Era', 'Biografía', 'Español', 2, 4),
(9, 'La casa de los espíritus', '978-0553383805', 1982, 'Plaza & Janés', 'Realismo Mágico', 'Español', 4, 3),
(10, 'Como agua para chocolate', '978-0553270744', 1989, 'Random House', 'Novela', 'Español', 5, 6);

-- Relación libro_autor
INSERT INTO libro_autor (libro_id, autor_id) VALUES
(1, 1),
(1, 6),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 9),
(10, 10);

