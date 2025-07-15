-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema libreria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema libreria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `libreria` DEFAULT CHARACTER SET utf8 ;
USE `libreria` ;

-- -----------------------------------------------------
-- Table `libreria`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`autor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `edad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`categoria` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`libro` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `autor_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  PRIMARY KEY (`id`, `autor_id`),
  INDEX `fk_libro_autor_idx` (`autor_id` ASC) ,
  INDEX `fk_libro_categoria1_idx` (`categoria_id` ASC) ,
  CONSTRAINT `fk_libro_autor`
    FOREIGN KEY (`autor_id`)
    REFERENCES `libreria`.`autor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `libreria`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `libreria`.`categoria` (`id`, `nombre`) VALUES ('1', 'Novela');
INSERT INTO `libreria`.`categoria` (`id`, `nombre`) VALUES ('2', 'Romance');
INSERT INTO `libreria`.`categoria` (`id`, `nombre`) VALUES ('3', 'Clasicos');

INSERT INTO `libreria`.`autor` (`id`, `nombre`, `apellido`, `edad`) VALUES ('1', 'Gabriel', 'Garcia Marquez', '50');
INSERT INTO `libreria`.`autor` (`id`, `nombre`, `apellido`, `edad`) VALUES ('2', 'Jane', 'Austen', '42');
INSERT INTO `libreria`.`autor` (`id`, `nombre`, `apellido`, `edad`) VALUES ('3', 'Fiodor', 'Dostoyevski', '54');

INSERT INTO `libreria`.`libro` (`id`, `nombre`, `autor_id`, `categoria_id`) VALUES ('1', '100 Años de soledad', '1', '1');
INSERT INTO `libreria`.`libro` (`id`, `nombre`, `autor_id`, `categoria_id`) VALUES ('2', 'Orgullo y prejuicio', '2', '2');
INSERT INTO `libreria`.`libro` (`id`, `nombre`, `autor_id`, `categoria_id`) VALUES ('3', 'Crimen y Castigo', '3', '3');
INSERT INTO `libreria`.`libro` (`id`, `nombre`, `autor_id`, `categoria_id`) VALUES ('4', 'Crónica de una muerte anunciada', '1', '1');
INSERT INTO `libreria`.`libro` (`id`, `nombre`, `autor_id`, `categoria_id`) VALUES ('5', 'En agosto nos vemos', '1', '1');



SELECT  l.nombre as nombre_libro, c.nombre as categoria, concat(a.nombre, ' ', a.apellido) as autor
from libro l
right join categoria c on l.categoria_id= c.id
right join autor a on a.id= l.autor_id;

SELECT  l.nombre as nombre_libro, c.nombre as categoria, concat(a.nombre, ' ', a.apellido) as autor
from libro l
left join categoria c on l.categoria_id= c.id
left join autor a on a.id= l.autor_id;

SELECT group_concat(l.nombre separator', ') as nombre_libro, c.nombre as categoria, concat(a.nombre, ' ', a.apellido) as autor
from libro l
left join categoria c on l.categoria_id= c.id
left join autor a on a.id= l.autor_id group by a.id;

SELECT c.nombre, group_concat(l.nombre separator', '), concat(a.nombre, ' ', a.apellido) as autor
from categoria c 
right join libro l on l.categoria_id=c.id 
right join autor a on l.autor_id =a.id group by a.id;