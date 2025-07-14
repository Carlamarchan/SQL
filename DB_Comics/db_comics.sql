-- CRUD DATABASE

-- CREATE DATABASE
CREATE DATABASE db_Comics;
USE db_Comics;   -- OJO SELECCIONARLA ANTES DE SEGUIR

-- CREATE TABLE
CREATE TABLE personajesDeComic(id INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(60) NOT NULL, especie VARCHAR(50), fraseFavorita VARCHAR(200));
DESCRIBE personajesDeComic;
INSERT INTO personajesDeComic(nombre, especie, fraseFavorita) VALUES 
('Spider Man', 'Humano','Un gran poder conlleva una gran responsabilidad.'),
('Wolverine','Mutante', 'Soy el mejor en lo que hago, pero lo que hago no es muy bonito.'),
('Batman','Humano','Yo soy la noche. Yo soy Batman.'),
('Deadpool','Humano mutado','Mátenme si pueden, zorros con garras!'),
('Harley Quinn','Humano','¡Estoy cuerda, doctor, y eso me hace más peligrosa!');

-- READ
SELECT * FROM personajesDeComic;

-- UPDATE
UPDATE personajesDeComic SET nombre = 'Harley Quinn' WHERE ID=5;

-- DROP PARA ELIMINAR TABLA Y DELETE PARA ELIMINAR REGISTRO
DELETE FROM personajesDeComic WHERE id=5;

SELECT * FROM personajesDeComic;


-- CREATE AUTORES TABLE

REATE TABLE `autores_de_comic` (
  `id_autores_de_comic` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apellido` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_autores_de_comic`),
  UNIQUE KEY `idautores_de_comic_UNIQUE` (`id_autores_de_comic`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

INSERT INTO `autores_de_comic` VALUES (1,'Stan','Lee','1922-12-28'),(2,'Jack','Kirby','1917-08-28'),(3,'Frank','Miller','1957-01-27'),(4,'Alan','Moore','1953-11-18'),(5,'Marjane','Satrapi','1969-11-22'),(6,'Neil','Gaiman','1960-11-10');


-- CREATE TABLE PAISES

CREATE TABLE `paises` (
  `idpaises` int(10) unsigned NOT NULL,
  `nombre_del_pais` varchar(45) NOT NULL,
  `capital` varchar(45) NOT NULL,
  `indice_de_riqueza` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpaises`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `paises` VALUES (1,'Suiza','Berna',94000),(2,'Noruega','Oslo',88000),(3,'Estados Unidos','Washington DC',85000),(4,'Irlanda','Dublin',10000),(5,'Singapur','Singapur',90000),(6,'Luxemburgo','Luxemburgo',NULL);
