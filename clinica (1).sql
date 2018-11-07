-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 07-11-2018 a las 19:39:30
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clinica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id_cajas` int(11) NOT NULL,
  `total_efectivo` float NOT NULL,
  `total_banco` float NOT NULL,
  `total_mercado` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id_cajas`, `total_efectivo`, `total_banco`, `total_mercado`) VALUES
(1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carnet`
--
-- Error leyendo la estructura de la tabla clinica.carnet: #1932 - Table 'clinica.carnet' doesn't exist in engine
-- Error leyendo datos de la tabla clinica.carnet: #1064 - Algo está equivocado en su sintax cerca 'FROM `clinica`.`carnet`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costos`
--

CREATE TABLE `costos` (
  `id_costos` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `costos`
--

INSERT INTO `costos` (`id_costos`, `nombre`, `importe`) VALUES
(3, 'Ayuda social', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuotas`
--

CREATE TABLE `cuotas` (
  `id_cuotas` int(100) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `mes` int(20) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_pago` date NOT NULL,
  `lugar_emision` varchar(20) NOT NULL,
  `id_pacientes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuotas`
--

INSERT INTO `cuotas` (`id_cuotas`, `fecha_vencimiento`, `mes`, `fecha_emision`, `fecha_pago`, `lugar_emision`, `id_pacientes`) VALUES
(29, '2018-10-31', 10, '2018-10-01', '0000-00-00', 'Rosario', 42),
(30, '2018-10-31', 10, '2018-10-01', '0000-00-00', 'Rosario', 24),
(56, '2019-10-31', 11, '2018-11-01', '0000-00-00', 'Rosario', 24),
(57, '0000-00-00', 9, '2018-09-01', '0000-00-00', 'Rosario', 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha_medica`
--

CREATE TABLE `ficha_medica` (
  `id_visitas` int(100) NOT NULL,
  `motivo` varchar(50) DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `recordatorio` varchar(100) DEFAULT NULL,
  `id_turnos` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_profesionales`
--

CREATE TABLE `horarios_profesionales` (
  `dia` varchar(20) NOT NULL,
  `hora_desde` time NOT NULL,
  `hora_hasta` time NOT NULL,
  `estado` varchar(20) NOT NULL,
  `id_profesionales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `horarios_profesionales`
--

INSERT INTO `horarios_profesionales` (`dia`, `hora_desde`, `hora_hasta`, `estado`, `id_profesionales`) VALUES
('Lunes', '08:00:00', '09:00:00', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_caja`
--

CREATE TABLE `movimientos_caja` (
  `id_mov` int(250) NOT NULL,
  `fecha_movimiento` date NOT NULL,
  `tipo_movimiento` varchar(20) NOT NULL,
  `motivo` varchar(40) NOT NULL,
  `retencion` float DEFAULT NULL,
  `observacion` varchar(40) DEFAULT NULL,
  `forma_pago` varchar(20) NOT NULL,
  `fecha_cobro` date NOT NULL,
  `lugar_cobro` varchar(30) DEFAULT NULL,
  `numero_tarjeta` varchar(30) DEFAULT NULL,
  `nombre_tarjeta` varchar(20) DEFAULT NULL,
  `importe` float NOT NULL,
  `id_profesionales` int(11) NOT NULL,
  `id_usuarios` int(11) DEFAULT NULL,
  `id_proveedores` int(11) NOT NULL,
  `id_pacientes` int(11) DEFAULT NULL,
  `id_cuotas` int(100) NOT NULL,
  `id_cajas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_pacientes` int(11) NOT NULL,
  `dni` varchar(40) DEFAULT NULL,
  `apellido` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `num_socio` int(20) DEFAULT NULL,
  `asociado` varchar(20) NOT NULL,
  `telefonos` varchar(40) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `localidad` varchar(20) DEFAULT NULL,
  `codigo_postal` int(11) DEFAULT NULL,
  `sexo` varchar(20) NOT NULL,
  `fecha_alta` date DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `saldo_pendiente` float DEFAULT NULL,
  `saldo_cuotas` float DEFAULT NULL,
  `forma_pago` varchar(20) DEFAULT NULL,
  `vigencia_sepelio` date DEFAULT NULL,
  `tarjetas_numeros` varchar(40) DEFAULT NULL,
  `otros_datos` varchar(60) DEFAULT NULL,
  `ayuda_escolar` varchar(11) DEFAULT NULL,
  `dni_titular` varchar(20) DEFAULT NULL,
  `id_planes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_pacientes`, `dni`, `apellido`, `nombre`, `num_socio`, `asociado`, `telefonos`, `email`, `fecha_nacimiento`, `direccion`, `localidad`, `codigo_postal`, `sexo`, `fecha_alta`, `fecha_baja`, `saldo_pendiente`, `saldo_cuotas`, `forma_pago`, `vigencia_sepelio`, `tarjetas_numeros`, `otros_datos`, `ayuda_escolar`, `dni_titular`, `id_planes`) VALUES
(24, '33333333', 'Manuale', 'Federico', 1, 'Si', '3413502691', 'manualef@gmail.com', '1992-01-01', 'Crespo y Urquiza', 'Rosario', 2000, 'Masculino', '2018-10-22', NULL, NULL, NULL, 'Efectivo', NULL, '', '', 'No', '33333333', 3),
(29, '11111111', 'Flores', 'Antonio', NULL, 'No', '3413502691', 'manualef@gmail.com', '1992-01-01', 'Crespo y Urquiza', 'Rosario', 2000, 'Masculino', NULL, NULL, NULL, NULL, '', NULL, '', '', 'No', NULL, NULL),
(30, '22222222', 'Manuale', 'Gisel', 2, 'Si', '3413502691', 'manualef@gmail.com', '1992-01-01', 'Crespo y Urquiza', 'Rosario', 2000, 'Femenino', '2018-10-24', NULL, NULL, NULL, 'Efectivo', NULL, '', '', 'No', '33333333', 3),
(39, '44444444', 'Baer', 'Walter', NULL, 'No', '', '', '0000-00-00', '', '', 0, 'Masculino', NULL, NULL, NULL, NULL, '', NULL, '', '', 'No', NULL, NULL),
(42, '66666666', 'Tamanini', 'Elsa', 3, 'Si', '', '', '0000-00-00', '', '', 0, 'Femenino', '2018-10-24', NULL, NULL, NULL, 'Efectivo', NULL, '', '', 'No', '66666666', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes_planes`
--
-- Error leyendo la estructura de la tabla clinica.pacientes_planes: #1932 - Table 'clinica.pacientes_planes' doesn't exist in engine
-- Error leyendo datos de la tabla clinica.pacientes_planes: #1064 - Algo está equivocado en su sintax cerca 'FROM `clinica`.`pacientes_planes`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE `planes` (
  `id_planes` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `monto` float NOT NULL,
  `servicios` varchar(60) NOT NULL,
  `id_costos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `planes`
--

INSERT INTO `planes` (`id_planes`, `nombre`, `monto`, `servicios`, `id_costos`) VALUES
(2, 'Individual', 110, 'Emergencia y Sepelio', NULL),
(3, 'Familiar', 160, 'Emergencia', NULL),
(4, 'Familiar1', 180, 'Emergencia', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesionales`
--

CREATE TABLE `profesionales` (
  `id_profesionales` int(11) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `apellido_nombre` varchar(20) NOT NULL,
  `telefonos` varchar(40) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `localidad` varchar(20) DEFAULT NULL,
  `codigo_postal` int(10) DEFAULT NULL,
  `sexo` varchar(20) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `num_matricula` varchar(30) DEFAULT NULL,
  `especialidad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesionales`
--

INSERT INTO `profesionales` (`id_profesionales`, `dni`, `apellido_nombre`, `telefonos`, `email`, `fecha_nacimiento`, `direccion`, `localidad`, `codigo_postal`, `sexo`, `fecha_ingreso`, `fecha_baja`, `num_matricula`, `especialidad`) VALUES
(1, '33333333', 'gi', '', '', '0000-00-00', '', '', 0, 'Femenino', '2010-01-01', '0000-00-00', '', 'Clinica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedores` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  `categoria` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedores`, `nombre`, `descripcion`, `categoria`) VALUES
(1, 'Cuotas', 'cuotas mensuales', 'Mutual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `id_turnos` int(100) NOT NULL,
  `fecha_turno` date NOT NULL,
  `hora_desde` time NOT NULL,
  `hora_hasta` time NOT NULL,
  `dia` varchar(20) NOT NULL,
  `estado_turno` varchar(20) NOT NULL,
  `pago` varchar(10) NOT NULL,
  `tipo_turno` varchar(20) NOT NULL,
  `importe_adicional` float DEFAULT NULL,
  `id_costos` int(11) DEFAULT NULL,
  `id_pacientes` int(11) DEFAULT NULL,
  `id_profesionales` int(11) DEFAULT NULL,
  `color` varchar(100) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`id_turnos`, `fecha_turno`, `hora_desde`, `hora_hasta`, `dia`, `estado_turno`, `pago`, `tipo_turno`, `importe_adicional`, `id_costos`, `id_pacientes`, `id_profesionales`, `color`, `start`, `end`) VALUES
(1, '2018-11-05', '15:00:00', '15:15:00', 'Lunes', 'Reservado', 'No', 'Socio', 0, NULL, 24, 1, '#53CACE', '2018-11-08 13:00:00', '2018-11-08 13:25:00'),
(2, '2018-11-05', '11:00:00', '11:15:00', 'Lunes', 'Reservado', 'No', 'Socio', 0, NULL, 24, 1, '#53CACE', '2018-11-05 11:00:00', '2018-11-05 11:20:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `apellido_nombre` varchar(40) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `tipo_usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `apellido_nombre`, `usuario`, `clave`, `tipo_usuario`) VALUES
(7, 'gi', 'giselburatti', 'programadora', 'Administrador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id_cajas`);

--
-- Indices de la tabla `costos`
--
ALTER TABLE `costos`
  ADD PRIMARY KEY (`id_costos`);

--
-- Indices de la tabla `cuotas`
--
ALTER TABLE `cuotas`
  ADD PRIMARY KEY (`id_cuotas`),
  ADD KEY `id_pacientes` (`id_pacientes`);

--
-- Indices de la tabla `ficha_medica`
--
ALTER TABLE `ficha_medica`
  ADD PRIMARY KEY (`id_visitas`),
  ADD KEY `id_turnos` (`id_turnos`);

--
-- Indices de la tabla `horarios_profesionales`
--
ALTER TABLE `horarios_profesionales`
  ADD KEY `id_profesionales` (`id_profesionales`);

--
-- Indices de la tabla `movimientos_caja`
--
ALTER TABLE `movimientos_caja`
  ADD PRIMARY KEY (`id_mov`),
  ADD KEY `id_profesionales` (`id_profesionales`),
  ADD KEY `id_usuarios` (`id_usuarios`),
  ADD KEY `id_proveedores` (`id_proveedores`),
  ADD KEY `id_pacientes` (`id_pacientes`),
  ADD KEY `id_cuotas` (`id_cuotas`),
  ADD KEY `id_cajas` (`id_cajas`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_pacientes`),
  ADD KEY `id_planes` (`id_planes`);

--
-- Indices de la tabla `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`id_planes`),
  ADD KEY `id_costos` (`id_costos`);

--
-- Indices de la tabla `profesionales`
--
ALTER TABLE `profesionales`
  ADD PRIMARY KEY (`id_profesionales`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedores`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id_turnos`),
  ADD KEY `id_costos` (`id_costos`,`id_pacientes`,`id_profesionales`),
  ADD KEY `turnos_pac` (`id_pacientes`),
  ADD KEY `turnos_prf` (`id_profesionales`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id_cajas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `costos`
--
ALTER TABLE `costos`
  MODIFY `id_costos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cuotas`
--
ALTER TABLE `cuotas`
  MODIFY `id_cuotas` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `ficha_medica`
--
ALTER TABLE `ficha_medica`
  MODIFY `id_visitas` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos_caja`
--
ALTER TABLE `movimientos_caja`
  MODIFY `id_mov` int(250) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_pacientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `planes`
--
ALTER TABLE `planes`
  MODIFY `id_planes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `profesionales`
--
ALTER TABLE `profesionales`
  MODIFY `id_profesionales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuotas`
--
ALTER TABLE `cuotas`
  ADD CONSTRAINT `cuotas_ibfk_1` FOREIGN KEY (`id_pacientes`) REFERENCES `pacientes` (`id_pacientes`);

--
-- Filtros para la tabla `ficha_medica`
--
ALTER TABLE `ficha_medica`
  ADD CONSTRAINT `ficha_medica_ibfk_1` FOREIGN KEY (`id_turnos`) REFERENCES `turnos` (`id_turnos`);

--
-- Filtros para la tabla `horarios_profesionales`
--
ALTER TABLE `horarios_profesionales`
  ADD CONSTRAINT `horarios_profesionales_ibfk_1` FOREIGN KEY (`id_profesionales`) REFERENCES `profesionales` (`id_profesionales`);

--
-- Filtros para la tabla `movimientos_caja`
--
ALTER TABLE `movimientos_caja`
  ADD CONSTRAINT `fkcaja` FOREIGN KEY (`id_cajas`) REFERENCES `caja` (`id_cajas`) ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_caja_ibfk_1` FOREIGN KEY (`id_proveedores`) REFERENCES `proveedores` (`id_proveedores`) ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_caja_ibfk_2` FOREIGN KEY (`id_profesionales`) REFERENCES `profesionales` (`id_profesionales`) ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_caja_ibfk_3` FOREIGN KEY (`id_pacientes`) REFERENCES `pacientes` (`id_pacientes`) ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_caja_ibfk_4` FOREIGN KEY (`id_cuotas`) REFERENCES `cuotas` (`id_cuotas`) ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_caja_ibfk_5` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_fk_aplan` FOREIGN KEY (`id_planes`) REFERENCES `planes` (`id_planes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `planes`
--
ALTER TABLE `planes`
  ADD CONSTRAINT `planes_fk_acostos` FOREIGN KEY (`id_costos`) REFERENCES `costos` (`id_costos`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `turnos_cost` FOREIGN KEY (`id_costos`) REFERENCES `costos` (`id_costos`) ON UPDATE CASCADE,
  ADD CONSTRAINT `turnos_pac` FOREIGN KEY (`id_pacientes`) REFERENCES `pacientes` (`id_pacientes`) ON UPDATE CASCADE,
  ADD CONSTRAINT `turnos_prf` FOREIGN KEY (`id_profesionales`) REFERENCES `profesionales` (`id_profesionales`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
