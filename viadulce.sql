-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-09-2020 a las 20:09:38
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `viadulce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `nombre` varchar(255) NOT NULL,
  `idcat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `categoria`:
--

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`nombre`, `idcat`) VALUES
('Golosinas', 2),
('Alfajores', 3),
('Caramelos', 4),
('Chupetines', 5),
('Papas', 6),
('Bebidas', 7),
('Helados', 8),
('Chocolates', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `Direccion 1` varchar(255) NOT NULL,
  `Direccion 2` varchar(255) NOT NULL,
  `Ciudad` varchar(255) NOT NULL,
  `Provincia` varchar(255) NOT NULL,
  `Pais` varchar(255) NOT NULL,
  `Telefono` int(14) NOT NULL,
  `Codigo Postal` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `direcciones`:
--   `user_id`
--       `users` -> `id`
--

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`Direccion 1`, `Direccion 2`, `Ciudad`, `Provincia`, `Pais`, `Telefono`, `Codigo Postal`, `user_id`) VALUES
('Ricardo Rojas 1635', '', 'Grand Bourg', 'Buenos Aires', 'Argentina', 1159076280, 1615, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `pedidos`:
--   `user_id`
--       `users` -> `id`
--   `id`
--       `pedido_detalle` -> `pedido_id`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalle`
--

CREATE TABLE `pedido_detalle` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `pedido_detalle`:
--   `producto_id`
--       `producto` -> `id`
--   `pedido_id`
--       `pedidos` -> `id`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `imagen` varchar(2555) NOT NULL,
  `imagenes` mediumtext NOT NULL,
  `cantidad` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `producto`:
--   `cat_id`
--       `categoria` -> `idcat`
--

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `precio`, `descripcion`, `imagen`, `imagenes`, `cantidad`, `cat_id`) VALUES
(1, 'Terrabusi', 550, 'Terrabusi  Caja x12', '', '', 50, 3),
(2, 'Alfajor Guaymallen Negro x 12', 500, 'Alfajor Guaymallen Negro x12', '', '', 400, 3),
(3, 'Alfajor Guaymallen Blanco x 12', 500, 'Alfajor Guaymallen Blanco x12', '', '', 400, 3),
(4, 'Alfajor Guaymallen Fruta x 12', 500, 'Alfajor Guaymallen Fruta x12', '', '', 400, 3),
(5, 'Alfajor Guaymallen Mixto x 12', 500, 'Alfajor Guaymallen Mixto x12', '', '', 400, 3),
(6, 'Alfajor Jorgito x 12', 300, 'Alfajor Jorgito x 12', '', '', 400, 3),
(7, 'Alfajor Havanna x 6', 500, 'Alfajor Havanna x 6', '', '', 400, 3),
(8, 'Alfajor Aguila x 6', 500, 'Alfajor Aguila x 6', '', '', 400, 3),
(9, 'Coca-Cola', 120, 'Coca-Cola 2Litros', '', '', 1000, 7),
(10, 'Seven-Up', 120, 'Seven-Up 2Litros', '', '', 1000, 7),
(11, 'Fanta', 120, 'Fanta 2Litros', '', '', 1000, 7),
(12, 'Cerveza Brahma', 120, 'Cerveza Brahma 2Litros', '', '', 1000, 7),
(13, 'Cerveza Quilmes', 120, 'Cerveza Quilmes 2Litros', '', '', 1000, 7),
(14, 'Manaos', 120, 'Manaos 2Litros', '', '', 1000, 7),
(15, 'Caramelos Mixto Billiken', 70, 'Caramelos Mixto Billiken x1U', '', '', 999, 4),
(16, 'Caramelos Menta ', 70, 'Caramelos Menta  x1U', '', '', 999, 4),
(17, 'Caramelos Arcor Relleno', 70, 'Caramelos Arcor Relleno x1U', '', '', 999, 4),
(18, 'Caramelos Menta ', 70, 'Caramelos Menta  x1U', '', '', 999, 4),
(19, 'Caramelos Flynn Paff', 70, 'Caramelos Flynn Paff', '', '', 999, 4),
(20, 'Caramelos Menta ', 70, 'Caramelos Menta  x1U', '', '', 999, 4),
(21, 'Caramelos Tofi', 70, 'Caramelos Tofi', '', '', 999, 4),
(22, 'Caramelos Menta ', 70, 'Caramelos Menta  x1U', '', '', 999, 4),
(23, 'Chupetin Pico Dulce', 250, 'Chupetin Pico Dulce Caja', '', '', 99, 5),
(24, 'Chupetin Pop Evolution', 55, 'Chupetin Pop Evolution Caja', '', '', 88, 5),
(25, 'Helados de Chocolate', 200, 'Helados de Chocolate Caja', '', '', 500, 8),
(26, 'Helados de Agua Mixto', 350, 'Helados de Agua Mixto Caja', '', '', 888, 8),
(27, 'Papas Lays', 75, 'Papas Lays 1U', '', '', 500, 6),
(28, 'Papas Pringles', 75, 'Papas Pringles 1U', '', '', 500, 6),
(29, 'Papas Pehuamar', 55, 'Papas Pehuamar 1U', '', '', 500, 6),
(30, 'Papas Kranchitos', 45, 'Papas Kranchitos 1U', '', '', 500, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `repeatpassword` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `users`:
--

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `user`, `password`, `repeatpassword`, `fullname`, `usertype`) VALUES
(1, 'atotaro1998', 'homero1998', 'homero1998', 'Alejo Totaro', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD KEY `idcat` (`idcat`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id`) REFERENCES `pedido_detalle` (`pedido_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD CONSTRAINT `pedido_detalle_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_detalle_ibfk_2` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categoria` (`idcat`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
