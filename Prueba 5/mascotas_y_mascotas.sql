-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2022 at 03:45 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mascotas_y_mascotas`
--

-- --------------------------------------------------------

--
-- Table structure for table `mascota`
--

CREATE TABLE `mascota` (
  `idmascota` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `idtipo_mascota` int(11) NOT NULL,
  `idpropietario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mascota`
--

INSERT INTO `mascota` (`idmascota`, `nombre`, `idtipo_mascota`, `idpropietario`) VALUES
(1, 'Adrienne', 5, 1),
(2, 'Jasmine', 4, 2),
(3, 'Minerva', 7, 3),
(4, 'Madaline', 1, 4),
(5, 'Ora', 6, NULL),
(6, 'Savannah', 2, 5),
(7, 'Berk', 3, NULL),
(8, 'Nelle', 4, NULL),
(9, 'Tyrone', 2, 5),
(10, 'Randall', 3, NULL),
(11, 'Adrienne', 5, 1),
(12, 'Jasmine', 4, 2),
(13, 'Minerva', 7, 3),
(14, 'Madaline', 1, 4),
(15, 'Ora', 6, NULL),
(16, 'Savannah', 2, 5),
(17, 'Berk', 3, NULL),
(18, 'Nelle', 4, NULL),
(19, 'Tyrone', 2, 5),
(20, 'Randall', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `propietario`
--

CREATE TABLE `propietario` (
  `idpropietario` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `correo` varchar(60) DEFAULT NULL,
  `comentarios` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `propietario`
--

INSERT INTO `propietario` (`idpropietario`, `nombre`, `direccion`, `telefono`, `correo`, `comentarios`) VALUES
(1, 'Randall Powell', 'P.O. Box 500, 3580 Metus. Av.', '1-637-742', 'fringilla.purus@hotmail.org', 'Estoy muy feliz con mi nuevo perro, es bastante cariñoso'),
(2, 'Chadwick Mccoy', '2375 Feugiat Street', '1-692-182', 'vivamus@protonmail.ca', 'Mi gato se enfermó a los días de haber venido a mi casa.'),
(3, 'Walker Yang', '455-7144 Aenean Street', '455-8261', 'imperdiet.non@icloud.net', 'Primera vez que tengo un conejito, gracias por los consejos'),
(4, 'Hunter Faulkner', '9071 Justo Ave', '1-279-66', 'iaculis.nec@aol.ca', NULL),
(5, 'Fritz Cole', '963-2469 Bibendum Road', '649-8143', 'vel.vulputate@aol.com', NULL),
(6, 'Alana Schmidt', 'P.O. Box 418, 1446 Dolor, Av.', '1-408-8', 'eget.metus@aol.edu', NULL),
(7, 'Rhoda Rowe', 'P.O. Box 577, 4939 At, Rd.', '1-538-82', 'cum.sociis@hotmail.org', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tipo_mascota`
--

CREATE TABLE `tipo_mascota` (
  `idtipo_mascota` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipo_mascota`
--

INSERT INTO `tipo_mascota` (`idtipo_mascota`, `descripcion`) VALUES
(1, 'aves'),
(2, 'peces'),
(3, 'roedores'),
(4, 'felinos'),
(5, 'perros'),
(6, 'reptiles'),
(7, 'mamifero'),
(8, 'anfibios');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`idmascota`),
  ADD KEY `idtipo_mascota` (`idtipo_mascota`),
  ADD KEY `idpropietario` (`idpropietario`);

--
-- Indexes for table `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`idpropietario`);

--
-- Indexes for table `tipo_mascota`
--
ALTER TABLE `tipo_mascota`
  ADD PRIMARY KEY (`idtipo_mascota`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mascota`
--
ALTER TABLE `mascota`
  MODIFY `idmascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`idtipo_mascota`) REFERENCES `tipo_mascota` (`idtipo_mascota`),
  ADD CONSTRAINT `mascota_ibfk_2` FOREIGN KEY (`idpropietario`) REFERENCES `propietario` (`idpropietario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



/*********************CONSULTAS*****************************/
/*LISTAR TODAS LAS MASCOTAS*/
SELECT * FROM mascota;

/*LISTAR MASCOTAS QUE NO HAN SIDO ADOPTADAS*/
SELECT nombre AS "mascotas que no han sido adoptadas" FROM mascota
WHERE idpropietario IS NULL;

/*NUMERO DE MASCOTAS POR CADA TIPO DE MASCOTA*/
SELECT t.descripcion as "Tipo de mascota" , count(m.idtipo_mascota) as "cantidad de tipos"
FROM mascota m INNER JOIN tipo_mascota t
ON t.idtipo_mascota = m.idtipo_mascota
group by m.idtipo_mascota;

/*LOS PROPIETARIOS QUE TENGAN MÁS DE UNA MASCOTA*/
SELECT p.nombre as "Nombre de propietario", COUNT(m.idpropietario)  as "Numero de mascotas"
FROM mascota m INNER JOIN propietario p
ON p.idpropietario = m.idpropietario
WHERE m.idpropietario IS NOT NULL
group by m.idpropietario
HAVING COUNT(m.idpropietario) > 1;

/*LISTAR EL NÚMERO DE MASCOTAS POR CADA TIPO DE MASCOTA Y POR CADA PROPIETARIO*/
SELECT t.descripcion as "tipo de mascotas", count(m.idtipo_mascota) as "cantidad de mascotas" , p.nombre as "propietario"
FROM mascota m
INNER JOIN tipo_mascota t
ON t.idtipo_mascota = m.idtipo_mascota
INNER JOIN propietario p
ON p.idpropietario = m.idpropietario
group by m.idtipo_mascota;


/*LISTAR LOS PROPIETARIOS QUE NO TIENEN MASCOTAS*/
SELECT p.nombre as "propietario sin mascota"
FROM propietario p
left JOIN mascota m on p.idpropietario = m.idpropietario
where m.idpropietario IS NULL;