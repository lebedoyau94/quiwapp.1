# +===================================================================
# | Generado el 13-04-2020 a las 09:03:50 AM 
# | Servidor: localhost
# | MySQL Version: 5.5.5-10.4.10-MariaDB
# | PHP Version: 7.3.12
# | Base de datos: 'softrestaurantes'
# | Tablas: abonoscreditos;  arqueocaja;  cajas;  categorias;  clientes;  compras;  configuracion;  creditosxclientes;  departamentos;  detallecompras;  detallepedidos;  detalleventas;  documentos;  impuestos;  ingredientes;  kardex_ingredientes;  kardex_productos;  log;  medidas;  mediospagos;  mesas;  movimientoscajas;  productos;  productosxingredientes;  proveedores;  provincias;  salas;  tiposcambio;  tiposmoneda;  usuarios;  ventas
# +-------------------------------------------------------------------
# Si tienen tablas con relacion y no estan en orden dara problemas al recuperar datos. Para evitarlo:
SET FOREIGN_KEY_CHECKS=0; 
SET time_zone = '+00:00';
SET sql_mode = ''; 


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

# | Vaciado de tabla 'abonoscreditos'
# +-------------------------------------
DROP TABLE IF EXISTS `abonoscreditos`;


# | Estructura de la tabla 'abonoscreditos'
# +-------------------------------------
CREATE TABLE `abonoscreditos` (
  `codabono` int(11) NOT NULL AUTO_INCREMENT,
  `codcaja` int(11) NOT NULL,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montoabono` decimal(12,2) NOT NULL,
  `fechaabono` datetime NOT NULL,
  PRIMARY KEY (`codabono`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'abonoscreditos'
# +-------------------------------------

# | Vaciado de tabla 'arqueocaja'
# +-------------------------------------
DROP TABLE IF EXISTS `arqueocaja`;


# | Estructura de la tabla 'arqueocaja'
# +-------------------------------------
CREATE TABLE `arqueocaja` (
  `codarqueo` int(11) NOT NULL AUTO_INCREMENT,
  `codcaja` int(11) NOT NULL,
  `montoinicial` decimal(12,2) NOT NULL,
  `ingresos` decimal(12,2) NOT NULL,
  `egresos` decimal(12,2) NOT NULL,
  `creditos` decimal(12,2) NOT NULL,
  `abonos` decimal(12,2) NOT NULL,
  `propinas` decimal(12,2) NOT NULL,
  `dineroefectivo` decimal(12,2) NOT NULL,
  `diferencia` decimal(12,2) NOT NULL,
  `comentarios` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaapertura` datetime NOT NULL,
  `fechacierre` datetime NOT NULL,
  `statusarqueo` int(2) NOT NULL,
  PRIMARY KEY (`codarqueo`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'arqueocaja'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `arqueocaja` (`codarqueo`, `codcaja`, `montoinicial`, `ingresos`, `egresos`, `creditos`, `abonos`, `propinas`, `dineroefectivo`, `diferencia`, `comentarios`, `fechaapertura`, `fechacierre`, `statusarqueo`) VALUES 
      ('1', '1', '0.00', '495627.12', '0.00', '0.00', '0.00', '10.00', '0.00', '0.00', '', '2019-10-28 04:21:56', '0000-00-00 00:00:00', '1'), 
      ('2', '2', '50.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2019-11-29 08:00:35', '0000-00-00 00:00:00', '1');
COMMIT;

# | Vaciado de tabla 'cajas'
# +-------------------------------------
DROP TABLE IF EXISTS `cajas`;


# | Estructura de la tabla 'cajas'
# +-------------------------------------
CREATE TABLE `cajas` (
  `codcaja` int(11) NOT NULL AUTO_INCREMENT,
  `nrocaja` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomcaja` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`codcaja`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'cajas'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `cajas` (`codcaja`, `nrocaja`, `nomcaja`, `codigo`) VALUES 
      ('1', '100', 'CAJA PRINCIPAL', '1'), 
      ('2', '114', 'CAJA SECUNDARIA', '3');
COMMIT;

# | Vaciado de tabla 'categorias'
# +-------------------------------------
DROP TABLE IF EXISTS `categorias`;


# | Estructura de la tabla 'categorias'
# +-------------------------------------
CREATE TABLE `categorias` (
  `codcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nomcategoria` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'categorias'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `categorias` (`codcategoria`, `nomcategoria`) VALUES 
      ('1', 'ASADOS'), 
      ('2', 'SUIZOS'), 
      ('3', 'SALCHIPAPAS'), 
      ('4', 'PICADAS'), 
      ('5', 'MAIZ DESGRANADOS'), 
      ('6', 'HAMBURGUESAS'), 
      ('7', 'CHUZOS DESGRANADOS'), 
      ('8', 'PERROS'), 
      ('9', 'PATACONES'), 
      ('10', 'BEBIDAS'), 
      ('11', 'ADICIONALES');
COMMIT;

# | Vaciado de tabla 'clientes'
# +-------------------------------------
DROP TABLE IF EXISTS `clientes`;


# | Estructura de la tabla 'clientes'
# +-------------------------------------
CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `documcliente` int(11) NOT NULL,
  `dnicliente` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomcliente` varchar(90) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tlfcliente` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_provincia` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `direccliente` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `emailcliente` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipocliente` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `limitecredito` float(12,2) NOT NULL,
  `fechaingreso` date NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'clientes'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `clientes` (`idcliente`, `codcliente`, `documcliente`, `dnicliente`, `nomcliente`, `tlfcliente`, `id_provincia`, `id_departamento`, `direccliente`, `emailcliente`, `tipocliente`, `limitecredito`, `fechaingreso`) VALUES 
      ('1', 'C1', '0', '15885748', 'RUBEN CHIRINOS', '', '0', '0', 'SANTA CRUZ D EMORA', '', 'NATURAL', '0.00', '2019-09-09'), 
      ('2', 'C2', '16', '10471723', 'VICTOR LOVERA ', '(0414) 0073940', '0', '0', 'VISTA ALEGRE EL LLANO TOVAR ', '', 'NATURAL', '0.00', '2019-09-11'), 
      ('3', 'C3', '16', '16604603', 'RONAL DAVILA', '(0412) 7914045', '0', '0', 'SANTA CRUZ DE MORA ', '', 'NATURAL', '0.00', '2019-09-11'), 
      ('4', 'C4', '16', '10901301', 'ZAIDA MARINA MONTOYA GUILLEN ', '', '0', '0', 'VISTA ALEGRE EL LLANO TOVAR ', '', 'NATURAL', '0.00', '2019-09-13'), 
      ('5', 'C5', '16', '8709182', 'CARNICERIA Y TRANSPORTE LA CANA BRAVA ', '', '0', '0', 'LA PLAYA BAILADORES ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-09-13'), 
      ('6', 'C6', '16', '8712928', 'INVERSIONES JOZLIRA DE JOSE ANGEL ROA ZAMBRANO ', '', '0', '0', 'CALLE PRINCIPAL DE VISTA ALEGRE EL LLANO TOVAR', '', 'NATURAL', '0.00', '2019-09-13'), 
      ('7', 'C7', '16', '8714909', 'HAMBURGUESERIA VISTA ALEGRE', '', '0', '0', 'VISTA ALEGRE EL LLANO TOVAR AL LADO DE BODEGA JAIMARY ', '', 'NATURAL', '0.00', '2019-09-13'), 
      ('8', 'C8', '16', '12048555', 'DISTRIBUIDORA DUALMAR ', '', '0', '0', 'EL LLANO TOVAR ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-09-13'), 
      ('9', 'C9', '16', '10900155', 'CONFITERIA YOHANA ', '(0414) 7486145', '0', '0', 'EL TERMINAL TOVAR ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-09-13'), 
      ('10', 'C10', '16', '20218518', 'NORMAN GUERRERO LUGO ', '(0414) 3753387', '0', '0', 'ESQUINA CARRERA 2 CON CALLE 4 ', '', 'NATURAL', '0.00', '2019-09-13'), 
      ('11', 'C11', '16', '16316704', 'MANUEL EPIFANIO MONTALVO', '(0424) 7725918', '0', '0', 'ZEA ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-09-16'), 
      ('12', 'C12', '16', '13092019', 'EVENTO ESTANQUES ', '', '0', '0', 'TOVAR MERIDA ', '', 'NATURAL', '0.00', '2019-09-16'), 
      ('13', 'C13', '16', '9198626', 'RAMONA MOLINA ', '', '0', '0', 'MERCADO MUNICIPAL TOVAR MERIDA ', '', 'NATURAL', '0.00', '2019-09-16'), 
      ('14', 'C14', '16', '19486261', 'COMERCIALIZADORA LAS PALMAS ', '', '0', '0', 'AV CRISTOBAL MENDOZA TOVAR ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-09-16'), 
      ('15', 'C15', '16', '124860853', 'PANADERIA MAHYLEN DE ALEXANDER MONTES ', '', '0', '0', 'SANTA CRUZ DE MORA SECTOR PUERTO RICO ', '', 'NATURAL', '0.00', '2019-09-17'), 
      ('16', 'C16', '16', '11111111', 'DENILSON ', '', '0', '0', 'CARRERA 4TA PASOS ARRIBA DEL HOSPITAL ', '', 'NATURAL', '0.00', '2019-09-17'), 
      ('17', 'C17', '16', '20301662', 'YERALDIN', '', '0', '0', 'LA PLAYA BAILADORES ', '', 'NATURAL', '0.00', '2019-09-17'), 
      ('18', 'C18', '16', '194867650', 'INVERSIONES EL MININO DE RIGOBERTOPEREIRA ', '', '0', '0', 'BAILADORES ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-09-18'), 
      ('19', 'C19', '16', '156946580', 'HELADERIA INDIA CARU DE CAROLINA RAMIREZ ROSALES ', '', '0', '0', 'BAILADORES ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-09-18'), 
      ('20', 'C20', '16', '279340430', 'INVERSIONES VG DE GABRIEL AUGUSTO HERNANDEZ ', '', '0', '0', 'FRENTE A LA FARMACIA TRINIDAD BAILADORES ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-09-18'), 
      ('21', 'C21', '16', '156954825', 'HELADERIA LOS SAUCES DE TRINIDAD ARELLANO RAMOS ', '', '0', '0', 'BAILADORES ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-09-18'), 
      ('22', 'C22', '16', '229285676', 'SUMINISTROS Y CARNICERIA HERMANOS MONTAMEZN', '', '0', '0', 'BAILADORES ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-09-18'), 
      ('23', 'C23', '16', '141317640', 'ABASTO EL PARAMERO DE EDUARDO ALEXIS ALARCON ', '', '0', '0', 'VISTA ALEGRE EL LLANO TOVAR', '', 'NATURAL', '0.00', '2019-09-18'), 
      ('24', 'C24', '16', '8711112', 'ABASTO DENISLON', '', '0', '0', 'EL LLANO TOVAR ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-09-18'), 
      ('25', 'C25', '16', '8088762', 'DISTRIBUIDORA GUZMAN BARRERA ', '', '0', '0', 'URBANIZACI&Oacute;N LA VEGA CASA 62 CALLE 4 TOVAR MERIDA ', '', 'NATURAL', '0.00', '2019-09-19'), 
      ('26', 'C26', '16', '14131239', 'JOEL MORA ', '', '0', '0', 'URBANIZACI&Oacute;N LA JABONERA TOVAR ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-09-19'), 
      ('27', 'C27', '16', '8705828', 'YAJAIRA ABREU ', '', '0', '0', 'CARRERA 4TA TOVAR ESTDO MERIDA ', '', 'NATURAL', '0.00', '2019-09-19'), 
      ('28', 'C28', '16', '21330209', 'FUENTE DE SODA SANTIAGO DE CARLOS IBARRA BARRIOS ', '', '0', '0', 'SECTOR CUCUCHICA TOVAR ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-09-19'), 
      ('29', 'C29', '16', '18208164', 'GROOVY ', '', '0', '0', 'AVENIDA DOMINGO ALBERTO RANGEL TOVAR MERIDA', '', 'NATURAL', '0.00', '2019-09-20'), 
      ('30', 'C30', '16', '076630140', 'PANADERIA FLOR DE BAILAODRES ', '', '0', '0', 'BAILADORES ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-09-27'), 
      ('31', 'C31', '16', '20830072', 'LENIN MORA ', '', '0', '0', 'EL LLANO TOVAR ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-09-27'), 
      ('32', 'C32', '16', '11389580', 'DANIEL SULBARAN ', '', '0', '0', 'MARACAY ESTADO ARAGUA', '', 'NATURAL', '0.00', '2019-10-02'), 
      ('33', 'C33', '16', '23240326', 'ABASTO MIS CACHETONAS ', '', '0', '0', 'LA LAGUNITA TOVAR ESTADO MERIDA ', '', 'NATURAL', '0.00', '2019-10-02'), 
      ('34', 'C34', '9', '24154577', 'INES BARRERA', '', '0', '0', 'GUATEMALA', '', 'NATURAL', '0.00', '2019-12-26'), 
      ('35', 'C35', '16', '1002375468', 'FRANCISCO', '(0988) 052390', '0', '0', 'QUITO', 'PRUEBA@PRUEBA.COM', 'NATURAL', '1000.00', '2020-03-02');
COMMIT;

# | Vaciado de tabla 'compras'
# +-------------------------------------
DROP TABLE IF EXISTS `compras`;


# | Estructura de la tabla 'compras'
# +-------------------------------------
CREATE TABLE `compras` (
  `idcompra` int(11) NOT NULL AUTO_INCREMENT,
  `codcompra` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproveedor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `subtotalivasic` decimal(12,2) NOT NULL,
  `subtotalivanoc` decimal(12,2) NOT NULL,
  `ivac` decimal(12,2) NOT NULL,
  `totalivac` decimal(12,2) NOT NULL,
  `descuentoc` decimal(12,2) NOT NULL,
  `totaldescuentoc` decimal(12,2) NOT NULL,
  `totalpagoc` decimal(12,2) NOT NULL,
  `tipocompra` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `formacompra` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechavencecredito` date NOT NULL,
  `fechapagado` date NOT NULL,
  `observaciones` text CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `statuscompra` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaemision` date NOT NULL,
  `fecharecepcion` date NOT NULL,
  `codigo` int(11) NOT NULL,
  PRIMARY KEY (`idcompra`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'compras'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `compras` (`idcompra`, `codcompra`, `codproveedor`, `subtotalivasic`, `subtotalivanoc`, `ivac`, `totalivac`, `descuentoc`, `totaldescuentoc`, `totalpagoc`, `tipocompra`, `formacompra`, `fechavencecredito`, `fechapagado`, `observaciones`, `statuscompra`, `fechaemision`, `fecharecepcion`, `codigo`) VALUES 
      ('1', '0085423', 'P6', '0.00', '201195.14', '18.00', '0.00', '0.00', '0.00', '201195.14', 'CONTADO', '1', '0000-00-00', '0000-00-00', 'NINGUNA', 'PAGADA', '2019-10-24', '2019-10-25', '1'), 
      ('2', '096534', 'P1', '0.00', '629500.00', '18.00', '0.00', '0.00', '0.00', '629500.00', 'CONTADO', '6', '0000-00-00', '0000-00-00', 'NINGUNA', 'PAGADA', '2019-10-24', '2019-10-25', '1'), 
      ('3', '066798', 'P4', '0.00', '237000.00', '18.00', '0.00', '0.00', '0.00', '237000.00', 'CREDITO', 'CREDITO', '2019-10-30', '0000-00-00', 'NINGUNA', 'PENDIENTE', '2019-10-24', '2019-10-25', '1');
COMMIT;

# | Vaciado de tabla 'configuracion'
# +-------------------------------------
DROP TABLE IF EXISTS `configuracion`;


# | Estructura de la tabla 'configuracion'
# +-------------------------------------
CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `documsucursal` int(11) NOT NULL,
  `cuit` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomsucursal` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tlfsucursal` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correosucursal` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_provincia` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `direcsucursal` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nroactividad` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `iniciofactura` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaautorizacion` date NOT NULL,
  `llevacontabilidad` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `documencargado` int(11) NOT NULL,
  `dniencargado` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomencargado` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tlfencargado` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descuentoglobal` decimal(12,2) NOT NULL,
  `porcentaje` decimal(12,2) NOT NULL,
  `codmoneda` int(11) NOT NULL,
  `codmoneda2` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'configuracion'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `configuracion` (`id`, `documsucursal`, `cuit`, `nomsucursal`, `tlfsucursal`, `correosucursal`, `id_provincia`, `id_departamento`, `direcsucursal`, `nroactividad`, `iniciofactura`, `fechaautorizacion`, `llevacontabilidad`, `documencargado`, `dniencargado`, `nomencargado`, `tlfencargado`, `descuentoglobal`, `porcentaje`, `codmoneda`, `codmoneda2`) VALUES 
      ('1', '3', 'J-40737578-4', 'DONEBA RESTAURANTE', '(0414) 0073940', 'DONEBAREST@GMAIL.COM', '0', '0', 'AVENIDA ROMULO, CALLE 51 # 47-48', '0001', '000000001', '0000-00-00', 'SI', '16', '18633174', 'DORAINE NEGRETE BARRIOS', '(0412) 7652345', '0.00', '10.00', '1', '1');
COMMIT;

# | Vaciado de tabla 'creditosxclientes'
# +-------------------------------------
DROP TABLE IF EXISTS `creditosxclientes`;


# | Estructura de la tabla 'creditosxclientes'
# +-------------------------------------
CREATE TABLE `creditosxclientes` (
  `codcredito` int(11) NOT NULL AUTO_INCREMENT,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montocredito` decimal(12,2) NOT NULL,
  PRIMARY KEY (`codcredito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'creditosxclientes'
# +-------------------------------------

# | Vaciado de tabla 'departamentos'
# +-------------------------------------
DROP TABLE IF EXISTS `departamentos`;


# | Estructura de la tabla 'departamentos'
# +-------------------------------------
CREATE TABLE `departamentos` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_provincia` int(11) NOT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'departamentos'
# +-------------------------------------

# | Vaciado de tabla 'detallecompras'
# +-------------------------------------
DROP TABLE IF EXISTS `detallecompras`;


# | Estructura de la tabla 'detallecompras'
# +-------------------------------------
CREATE TABLE `detallecompras` (
  `coddetallecompra` int(11) NOT NULL AUTO_INCREMENT,
  `codcompra` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipoentrada` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `preciocomprac` decimal(12,2) NOT NULL,
  `precioventac` decimal(12,2) NOT NULL,
  `cantcompra` decimal(12,2) NOT NULL,
  `ivaproductoc` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descproductoc` decimal(12,2) NOT NULL,
  `descfactura` decimal(12,2) NOT NULL,
  `valortotal` decimal(12,2) NOT NULL,
  `totaldescuentoc` decimal(12,2) NOT NULL,
  `valorneto` decimal(12,2) NOT NULL,
  `lotec` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaelaboracionc` date NOT NULL,
  `fechaexpiracionc` date NOT NULL,
  PRIMARY KEY (`coddetallecompra`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'detallecompras'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `detallecompras` (`coddetallecompra`, `codcompra`, `tipoentrada`, `codproducto`, `producto`, `codcategoria`, `preciocomprac`, `precioventac`, `cantcompra`, `ivaproductoc`, `descproductoc`, `descfactura`, `valortotal`, `totaldescuentoc`, `valorneto`, `lotec`, `fechaelaboracionc`, `fechaexpiracionc`) VALUES 
      ('1', '0085423', 'PRODUCTO', '87', 'GASEOSA 400', '10', '1300.00', '1430.00', '35.00', 'NO', '0.00', '0.00', '45500.00', '0.00', '45500.00', '0', '0000-00-00', '0000-00-00'), 
      ('2', '0085423', 'PRODUCTO', '88', 'GASEOSA 1.5', '10', '2500.00', '2750.00', '15.00', 'NO', '0.00', '0.00', '37500.00', '0.00', '37500.00', '0', '0000-00-00', '0000-00-00'), 
      ('3', '0085423', 'PRODUCTO', '97', 'GATORADE', '10', '2050.00', '2255.00', '37.00', 'NO', '0.00', '0.00', '75850.00', '0.00', '75850.00', '0', '0000-00-00', '0000-00-00'), 
      ('4', '0085423', ', ', '12', 'JAMON', '4', '173.00', '190.30', '12.00', 'NO', '0.00', '0.00', '2076.00', '0.00', '2076.00', '0', '2019-10-25', '2019-10-25'), 
      ('5', '0085423', 'INGREDIENTE', '11', 'CHORIZO', '4', '999.00', '1098.90', '15.00', 'NO', '0.00', '0.00', '14985.00', '0.00', '14985.00', '0', '0000-00-00', '0000-00-00'), 
      ('6', '0085423', 'INGREDIENTE', '15', 'MAIZ', '4', '1366.71', '1503.38', '18.50', 'NO', '0.00', '0.00', '25284.14', '0.00', '25284.14', '0', '0000-00-00', '0000-00-00'), 
      ('7', '096534', 'PRODUCTO', '89', 'GASEOSA 2.5', '10', '4500.00', '4950.00', '25.00', 'NO', '0.00', '0.00', '112500.00', '0.00', '112500.00', '0', '0000-00-00', '0000-00-00'), 
      ('8', '096534', 'INGREDIENTE', '13', 'MOZARELLA', '4', '250.00', '275.00', '24.00', 'NO', '0.00', '0.00', '6000.00', '0.00', '6000.00', '0', '0000-00-00', '0000-00-00'), 
      ('9', '096534', 'INGREDIENTE', '2', 'LOMO DE RES', '4', '9500.00', '10450.00', '44.00', 'NO', '0.00', '0.00', '418000.00', '0.00', '418000.00', '0', '0000-00-00', '0000-00-00'), 
      ('10', '096534', 'INGREDIENTE', '4', 'LOMO DE CERDO', '4', '6000.00', '6600.00', '15.50', 'NO', '0.00', '0.00', '93000.00', '0.00', '93000.00', '0', '0000-00-00', '0000-00-00'), 
      ('11', '066798', 'PRODUCTO', '87', 'GASEOSA 400', '10', '1300.00', '1430.00', '15.00', 'NO', '0.00', '0.00', '19500.00', '0.00', '19500.00', '0', '0000-00-00', '0000-00-00'), 
      ('12', '066798', 'INGREDIENTE', '2', 'LOMO DE RES', '4', '9500.00', '10450.00', '15.00', 'NO', '0.00', '0.00', '142500.00', '0.00', '142500.00', '0', '0000-00-00', '0000-00-00'), 
      ('13', '066798', 'INGREDIENTE', '24', 'CHUZO DE POLLO', '4', '3000.00', '3300.00', '25.00', 'NO', '0.00', '0.00', '75000.00', '0.00', '75000.00', '0', '0000-00-00', '0000-00-00');
COMMIT;

# | Vaciado de tabla 'detallepedidos'
# +-------------------------------------
DROP TABLE IF EXISTS `detallepedidos`;


# | Estructura de la tabla 'detallepedidos'
# +-------------------------------------
CREATE TABLE `detallepedidos` (
  `coddetallepedido` int(11) NOT NULL AUTO_INCREMENT,
  `codpedido` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `pedido` int(15) NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `cantventa` decimal(12,2) NOT NULL,
  `precioventa` decimal(12,2) NOT NULL,
  `ivaproducto` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `valortotal` decimal(12,2) NOT NULL,
  `totaldescuentov` decimal(12,2) NOT NULL,
  `valorneto` decimal(12,2) NOT NULL,
  `observacionespedido` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cocinero` int(2) NOT NULL,
  PRIMARY KEY (`coddetallepedido`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'detallepedidos'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `detallepedidos` (`coddetallepedido`, `codpedido`, `pedido`, `codproducto`, `producto`, `codcategoria`, `cantventa`, `precioventa`, `ivaproducto`, `descproducto`, `valortotal`, `totaldescuentov`, `valorneto`, `observacionespedido`, `cocinero`) VALUES 
      ('1', 'P1', '1', '15', 'SUIZO ESPECIAL_POLLO', '2', '1.00', '8800.00', 'NO', '0.00', '8800.00', '0.00', '8800.00', '0', '1'), 
      ('2', 'P1', '1', '16', 'SUIZO ESPECIAL_LOMITO', '2', '1.00', '9900.00', 'NO', '0.00', '9900.00', '0.00', '9900.00', '0', '1'), 
      ('3', 'P1', '1', '22', 'SALCHIPAPA SENCILLA', '3', '1.00', '4400.00', 'NO', '0.00', '4400.00', '0.00', '4400.00', '0', '1'), 
      ('4', 'P2', '1', '22', 'SALCHIPAPA SENCILLA', '3', '10.00', '4400.00', 'NO', '0.00', '44000.00', '0.00', '44000.00', '0', '1'), 
      ('5', 'P2', '1', '23', 'SALCHIPAPA CON POLLO', '3', '1.00', '7480.00', 'NO', '0.00', '7480.00', '0.00', '7480.00', '0', '1'), 
      ('6', 'P3', '1', '92', 'HIT 500 ML', '10', '1.00', '1677.50', 'NO', '0.00', '1677.50', '0.00', '1677.50', '0', '1'), 
      ('7', 'P3', '1', '88', 'GASEOSA 1.5', '10', '1.00', '2750.00', 'NO', '0.00', '2750.00', '0.00', '2750.00', '0', '1'), 
      ('43', 'P17', '1', '89', 'GASEOSA 2.5', '10', '1.00', '22.12', 'NO', '0.00', '22.12', '0.00', '22.12', '0', '1'), 
      ('17', 'P9', '1', '1', 'LOMITO DE RES', '1', '1.00', '11000.00', 'NO', '0.00', '11000.00', '0.00', '11000.00', '0', '1'), 
      ('18', 'P9', '1', '2', 'PECHUGA A LA PLANCHA', '1', '1.00', '8800.00', 'NO', '0.00', '8800.00', '0.00', '8800.00', '0', '1'), 
      ('16', 'P8', '1', '3', 'LOMITO DE CERDO', '1', '3.00', '9900.00', 'NO', '0.00', '29700.00', '0.00', '29700.00', '0', '1'), 
      ('15', 'P8', '1', '1', 'LOMITO DE RES', '1', '2.00', '11000.00', 'NO', '0.00', '22000.00', '0.00', '22000.00', '0', '1'), 
      ('41', 'P15', '1', '2', 'PECHUGA A LA PLANCHA', '1', '1.00', '8800.00', 'NO', '0.00', '8800.00', '0.00', '8800.00', '0', '1'), 
      ('63', 'P22', '1', '1', 'LOMITO DE RES', '1', '1.00', '11000.00', 'NO', '0.00', '11000.00', '0.00', '11000.00', '0', '1'), 
      ('64', 'P22', '1', '2', 'PECHUGA A LA PLANCHA', '1', '1.00', '8800.00', 'NO', '0.00', '8800.00', '0.00', '8800.00', '0', '1'), 
      ('65', 'P23', '1', '2', 'PECHUGA A LA PLANCHA', '1', '2.00', '8800.00', 'NO', '0.00', '17600.00', '0.00', '17600.00', '0', '1'), 
      ('66', 'P23', '1', '1', 'LOMITO DE RES', '1', '1.00', '11000.00', 'NO', '0.00', '11000.00', '0.00', '11000.00', '0', '1');
COMMIT;

# | Vaciado de tabla 'detalleventas'
# +-------------------------------------
DROP TABLE IF EXISTS `detalleventas`;


# | Estructura de la tabla 'detalleventas'
# +-------------------------------------
CREATE TABLE `detalleventas` (
  `coddetalleventa` int(11) NOT NULL AUTO_INCREMENT,
  `codpedido` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `cantventa` decimal(12,2) NOT NULL,
  `preciocompra` decimal(12,2) NOT NULL,
  `precioventa` decimal(12,2) NOT NULL,
  `ivaproducto` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `valortotal` decimal(12,2) NOT NULL,
  `totaldescuentov` decimal(12,2) NOT NULL,
  `valorneto` decimal(12,2) NOT NULL,
  `valorneto2` decimal(12,2) NOT NULL,
  PRIMARY KEY (`coddetalleventa`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'detalleventas'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `detalleventas` (`coddetalleventa`, `codpedido`, `codventa`, `codproducto`, `producto`, `codcategoria`, `cantventa`, `preciocompra`, `precioventa`, `ivaproducto`, `descproducto`, `valortotal`, `totaldescuentov`, `valorneto`, `valorneto2`) VALUES 
      ('1', 'P1', '0001-000000001', '15', 'SUIZO ESPECIAL_POLLO', '2', '1.00', '8000.00', '8800.00', 'NO', '0.00', '8800.00', '0.00', '8800.00', '8000.00'), 
      ('2', 'P1', '0001-000000001', '16', 'SUIZO ESPECIAL_LOMITO', '2', '1.00', '9000.00', '9900.00', 'NO', '0.00', '9900.00', '0.00', '9900.00', '9000.00'), 
      ('3', 'P1', '0001-000000001', '22', 'SALCHIPAPA SENCILLA', '3', '1.00', '4000.00', '4400.00', 'NO', '0.00', '4400.00', '0.00', '4400.00', '4000.00'), 
      ('4', 'P2', '0001-000000002', '22', 'SALCHIPAPA SENCILLA', '3', '10.00', '4000.00', '4400.00', 'NO', '0.00', '44000.00', '0.00', '44000.00', '40000.00'), 
      ('5', 'P2', '0001-000000002', '23', 'SALCHIPAPA CON POLLO', '3', '1.00', '6800.00', '7480.00', 'NO', '0.00', '7480.00', '0.00', '7480.00', '6800.00'), 
      ('6', 'P3', '0001-000000003', '92', 'HIT 500 ML', '10', '1.00', '1525.00', '1677.50', 'NO', '0.00', '1677.50', '0.00', '1677.50', '1525.00'), 
      ('7', 'P3', '0001-000000003', '88', 'GASEOSA 1.5', '10', '1.00', '2500.00', '2750.00', 'NO', '0.00', '2750.00', '0.00', '2750.00', '2500.00'), 
      ('18', 'P9', '0001-000000008', '2', 'PECHUGA A LA PLANCHA', '1', '1.00', '8000.00', '8800.00', 'NO', '0.00', '8800.00', '0.00', '8800.00', '8000.00'), 
      ('17', 'P9', '0001-000000008', '1', 'LOMITO DE RES', '1', '1.00', '10000.00', '11000.00', 'NO', '0.00', '11000.00', '0.00', '11000.00', '10000.00'), 
      ('10', 'P5', '0001-000000004', '1', 'LOMITO DE RES', '1', '2.00', '10000.00', '11000.00', 'NO', '0.00', '22000.00', '0.00', '22000.00', '20000.00'), 
      ('11', 'P6', '0001-000000005', '6', 'MIXTO', '1', '1.00', '9000.00', '9900.00', 'NO', '0.00', '9900.00', '0.00', '9900.00', '9000.00'), 
      ('12', 'P7', '0001-000000006', '3', 'LOMITO DE CERDO', '1', '1.00', '9000.00', '9900.00', 'NO', '0.00', '9900.00', '0.00', '9900.00', '9000.00'), 
      ('13', 'P7', '0001-000000006', '2', 'PECHUGA A LA PLANCHA', '1', '1.00', '8000.00', '8800.00', 'NO', '0.00', '8800.00', '0.00', '8800.00', '8000.00'), 
      ('14', 'P7', '0001-000000006', '1', 'LOMITO DE RES', '1', '2.00', '10000.00', '11000.00', 'NO', '0.00', '22000.00', '0.00', '22000.00', '20000.00'), 
      ('15', 'P8', '0001-000000007', '1', 'LOMITO DE RES', '1', '2.00', '10000.00', '11000.00', 'NO', '0.00', '22000.00', '0.00', '22000.00', '20000.00'), 
      ('16', 'P8', '0001-000000007', '3', 'LOMITO DE CERDO', '1', '3.00', '9000.00', '9900.00', 'NO', '0.00', '29700.00', '0.00', '29700.00', '27000.00'), 
      ('19', 'P10', '0001-000000011', '87', 'GASEOSA 400', '10', '2.00', '1300.00', '1430.00', 'NO', '0.00', '2860.00', '0.00', '2860.00', '2600.00'), 
      ('20', 'P10', '0001-000000011', '88', 'GASEOSA 1.5', '10', '2.00', '2500.00', '2750.00', 'NO', '0.00', '5500.00', '0.00', '5500.00', '5000.00'), 
      ('21', 'P10', '0001-000000011', '89', 'GASEOSA 2.5', '10', '1.00', '4500.00', '4950.00', 'NO', '0.00', '4950.00', '0.00', '4950.00', '4500.00'), 
      ('61', 'P21', '0001-000000018', '4', 'LOMITO DE CERDO ENCEBOLLADO Y GRATINADO', '1', '1.00', '10400.00', '11440.00', 'NO', '0.00', '11440.00', '0.00', '11440.00', '10400.00'), 
      ('60', 'P21', '0001-000000018', '3', 'LOMITO DE CERDO', '1', '1.00', '9000.00', '9900.00', 'NO', '0.00', '9900.00', '0.00', '9900.00', '9000.00'), 
      ('59', 'P20', '0001-000000016', '45', 'MAIZ CON SUIZO', '5', '1.00', '5800.00', '6380.00', 'NO', '0.00', '6380.00', '0.00', '6380.00', '5800.00'), 
      ('57', 'P20', '0001-000000016', '62', 'CHUZO DE POLLO', '7', '1.00', '5000.00', '5500.00', 'NO', '0.00', '5500.00', '0.00', '5500.00', '5000.00'), 
      ('58', 'P20', '0001-000000016', '54', 'HAMB. DE CARNE', '6', '1.00', '300.00', '330.00', 'NO', '0.00', '330.00', '0.00', '330.00', '300.00'), 
      ('56', 'P20', '0001-000000016', '90', 'MT TEE', '10', '1.00', '1525.00', '1677.50', 'NO', '0.00', '1677.50', '0.00', '1677.50', '1525.00'), 
      ('55', 'P20', '0001-000000016', '99', 'PAPAS A LA FRACESA', '11', '1.00', '1100.00', '1210.00', 'NO', '0.00', '1210.00', '0.00', '1210.00', '1100.00'), 
      ('54', 'P20', '0001-000000016', '1', 'LOMITO DE RES', '1', '1.00', '10000.00', '11000.00', 'NO', '0.00', '11000.00', '0.00', '11000.00', '10000.00'), 
      ('53', 'P19', '0001-000000017', '2', 'PECHUGA A LA PLANCHA', '1', '1.00', '8000.00', '8800.00', 'NO', '0.00', '8800.00', '0.00', '8800.00', '8000.00'), 
      ('52', 'P19', '0001-000000017', '1', 'LOMITO DE RES', '1', '1.00', '10000.00', '11000.00', 'NO', '0.00', '11000.00', '0.00', '11000.00', '10000.00'), 
      ('36', 'P14', '0001-000000010', '5', 'LOMITO DE RES ENCEBOLLADO Y GRATINADO', '1', '1.00', '11400.00', '12540.00', 'NO', '0.00', '12540.00', '0.00', '12540.00', '11400.00'), 
      ('37', 'P14', '0001-000000010', '104', 'RANCHERA', '11', '1.00', '1050.00', '1155.00', 'NO', '0.00', '1155.00', '0.00', '1155.00', '1050.00'), 
      ('38', 'P14', '0001-000000010', '99', 'PAPAS A LA FRACESA', '11', '2.00', '1100.00', '1210.00', 'NO', '0.00', '2420.00', '0.00', '2420.00', '2200.00'), 
      ('39', 'P14', '0001-000000010', '2', 'PECHUGA A LA PLANCHA', '1', '2.00', '8000.00', '8800.00', 'NO', '0.00', '17600.00', '0.00', '17600.00', '16000.00'), 
      ('40', 'P15', '0001-000000012', '2', 'PECHUGA A LA PLANCHA', '1', '1.00', '8000.00', '8800.00', 'NO', '0.00', '8800.00', '0.00', '8800.00', '8000.00'), 
      ('41', 'P16', '0001-000000013', '2', 'PECHUGA A LA PLANCHA', '1', '1.00', '8000.00', '8800.00', 'NO', '0.00', '8800.00', '0.00', '8800.00', '8000.00'), 
      ('42', 'P17', '0001-000000014', '89', 'GASEOSA 2.5', '10', '1.00', '10.12', '22.12', 'NO', '0.00', '22.12', '0.00', '22.12', '10.12'), 
      ('43', 'P18', '0001-000000015', '6', 'MIXTO', '1', '2.00', '9000.00', '9900.00', 'NO', '0.00', '19800.00', '0.00', '19800.00', '18000.00'), 
      ('44', 'P18', '0001-000000015', '5', 'LOMITO DE RES ENCEBOLLADO Y GRATINADO', '1', '1.00', '11400.00', '12540.00', 'NO', '0.00', '12540.00', '0.00', '12540.00', '11400.00'), 
      ('45', 'P18', '0001-000000015', '1', 'LOMITO DE RES', '1', '2.00', '10000.00', '11000.00', 'NO', '0.00', '22000.00', '0.00', '22000.00', '20000.00'), 
      ('46', 'P18', '0001-000000015', '2', 'PECHUGA A LA PLANCHA', '1', '1.00', '8000.00', '8800.00', 'NO', '0.00', '8800.00', '0.00', '8800.00', '8000.00'), 
      ('47', 'P18', '0001-000000015', '14', 'BANDEJA 5 CARNES', '1', '1.00', '16000.00', '17600.00', 'NO', '0.00', '17600.00', '0.00', '17600.00', '16000.00'), 
      ('48', 'P18', '0001-000000015', '67', 'CHUZO DE LOMITO GRATINADO', '7', '1.00', '6900.00', '7590.00', 'NO', '0.00', '7590.00', '0.00', '7590.00', '6900.00'), 
      ('49', 'P18', '0001-000000015', '63', 'CHUZO DE LOMITO', '7', '1.00', '6000.00', '6600.00', 'NO', '0.00', '6600.00', '0.00', '6600.00', '6000.00'), 
      ('50', 'P18', '0001-000000015', '62', 'CHUZO DE POLLO', '7', '1.00', '5000.00', '5500.00', 'NO', '0.00', '5500.00', '0.00', '5500.00', '5000.00'), 
      ('51', 'P18', '0001-000000015', '66', 'CHUZO DE POLLO GRATINADO', '7', '1.00', '5900.00', '6490.00', 'NO', '0.00', '6490.00', '0.00', '6490.00', '5900.00'), 
      ('62', 'P22', '0', '1', 'LOMITO DE RES', '1', '1.00', '10000.00', '11000.00', 'NO', '0.00', '11000.00', '0.00', '11000.00', '10000.00'), 
      ('63', 'P22', '0', '2', 'PECHUGA A LA PLANCHA', '1', '1.00', '8000.00', '8800.00', 'NO', '0.00', '8800.00', '0.00', '8800.00', '8000.00'), 
      ('64', 'P23', '0', '2', 'PECHUGA A LA PLANCHA', '1', '2.00', '8000.00', '8800.00', 'NO', '0.00', '17600.00', '0.00', '17600.00', '16000.00'), 
      ('65', 'P23', '0', '1', 'LOMITO DE RES', '1', '1.00', '10000.00', '11000.00', 'NO', '0.00', '11000.00', '0.00', '11000.00', '10000.00');
COMMIT;

# | Vaciado de tabla 'documentos'
# +-------------------------------------
DROP TABLE IF EXISTS `documentos`;


# | Estructura de la tabla 'documentos'
# +-------------------------------------
CREATE TABLE `documentos` (
  `coddocumento` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`coddocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'documentos'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `documentos` (`coddocumento`, `documento`, `descripcion`) VALUES 
      ('1', 'RUC', 'REGISTRO UNICO DE CONTRIBUYENTES'), 
      ('2', 'RUT', 'REGISTRO UNICO TRIBUTARIO'), 
      ('3', 'RIF', 'REGISTRO DE INFORMACION FISCAL'), 
      ('4', 'RFC', 'REGISTRO FEDERAL DE CONTRIBUYENTES'), 
      ('5', 'RTN', 'REGISTRO TRIBUTARIO NACIONAL'), 
      ('6', 'RTU', 'REGISTRO TRIBUTARIO UNIFICADO'), 
      ('7', 'RNC', 'REGISTRO NACIONAL DEL CONTRIBUYENTE'), 
      ('8', 'NIF', 'NUMERO DE IDENTIFICACION FISCAL'), 
      ('9', 'NIT', 'NUMERO DE IDENTIFICACION TRIBUTARIA'), 
      ('10', 'NITE', 'NUMERO DE IDENTIFICACION TRIBUTARIA ESPECIAL'), 
      ('11', 'DNI', 'DOCUMENTO NACIONAL DE IDENTIDAD'), 
      ('12', 'CUIL', 'CODIGO UNICO DE IDENTIFICACION LABORAL'), 
      ('13', 'CUIT', 'CODIGO UNICO DE IDENTIFICACION TRIBUTARIA'), 
      ('14', 'REGISTRO CIVIL', 'REGISTRO CIVIL'), 
      ('15', 'TARJ. DE IDENTIDAD', 'TARJETA DE IDENTIDAD'), 
      ('16', 'CI', 'CEDULA DE IDENTIDAD'), 
      ('17', 'PASAPORTE', 'PASAPORTE');
COMMIT;

# | Vaciado de tabla 'impuestos'
# +-------------------------------------
DROP TABLE IF EXISTS `impuestos`;


# | Estructura de la tabla 'impuestos'
# +-------------------------------------
CREATE TABLE `impuestos` (
  `codimpuesto` int(11) NOT NULL AUTO_INCREMENT,
  `nomimpuesto` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `valorimpuesto` decimal(12,2) NOT NULL,
  `statusimpuesto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaimpuesto` date NOT NULL,
  PRIMARY KEY (`codimpuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'impuestos'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `impuestos` (`codimpuesto`, `nomimpuesto`, `valorimpuesto`, `statusimpuesto`, `fechaimpuesto`) VALUES 
      ('1', 'IGV', '18.00', 'ACTIVO', '2019-06-02'), 
      ('2', 'IVA', '16.00', 'INACTIVO', '2019-06-02'), 
      ('3', 'ITBMS', '7.00', 'INACTIVO', '2019-06-02');
COMMIT;

# | Vaciado de tabla 'ingredientes'
# +-------------------------------------
DROP TABLE IF EXISTS `ingredientes`;


# | Estructura de la tabla 'ingredientes'
# +-------------------------------------
CREATE TABLE `ingredientes` (
  `idingrediente` int(11) NOT NULL AUTO_INCREMENT,
  `codingrediente` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomingrediente` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codmedida` int(11) NOT NULL,
  `preciocompra` decimal(12,2) NOT NULL,
  `precioventa` decimal(12,2) NOT NULL,
  `cantingrediente` decimal(12,2) NOT NULL,
  `stockminimo` decimal(12,2) NOT NULL,
  `stockmaximo` decimal(12,2) NOT NULL,
  `ivaingrediente` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descingrediente` decimal(12,2) NOT NULL,
  `lote` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaexpiracion` date NOT NULL,
  `codproveedor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idingrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'ingredientes'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `ingredientes` (`idingrediente`, `codingrediente`, `nomingrediente`, `codmedida`, `preciocompra`, `precioventa`, `cantingrediente`, `stockminimo`, `stockmaximo`, `ivaingrediente`, `descingrediente`, `lote`, `fechaexpiracion`, `codproveedor`) VALUES 
      ('1', '1', 'PAPAS A LA FRANCESA', '4', '1100.00', '1210.00', '117.50', '20.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('2', '2', 'LOMO DE RES', '4', '9500.00', '10450.00', '110.50', '0.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('3', '3', 'BUTIFARRA', '4', '430.20', '473.22', '82.00', '30.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('4', '4', 'LOMO DE CERDO', '4', '6000.00', '6600.00', '22.50', '15.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('5', '5', 'PECHUGA ', '4', '6000.00', '6600.00', '91.50', '15.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('6', '6', 'SALCHICHA DE PERRO', '4', '463.00', '509.30', '96.00', '30.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('7', '7', 'SALCHICHA AMERICANA', '4', '1248.00', '1372.80', '31.00', '10.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('8', '8', 'SUIZA', '4', '3075.00', '3382.50', '95.00', '10.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('9', '9', 'RANCHERA', '4', '1828.57', '2011.43', '75.00', '10.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('10', '10', 'MANGUERA', '4', '1016.00', '1117.60', '120.00', '30.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('11', '11', 'CHORIZO', '4', '999.00', '1098.90', '74.05', '20.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('12', '12', 'JAMON', '4', '173.00', '190.30', '134.00', '10.00', '0.00', 'NO', '0.00', '0', '2019-10-25', '0'), 
      ('13', '13', 'MOZARELLA', '4', '250.00', '275.00', '395.00', '10.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('14', '14', 'TOCINETA', '4', '473.48', '520.83', '17.00', '15.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('15', '15', 'MAIZ', '4', '1366.71', '1503.38', '47.50', '6.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('16', '16', 'PAN PERRO', '4', '350.00', '385.00', '87.00', '5.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('17', '17', 'PAN HAMBURGUESA', '4', '450.00', '495.00', '37.00', '0.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('18', '18', 'PATACON', '4', '300.00', '330.00', '120.00', '12.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('19', '19', 'HAMBURGUESA CARNE', '4', '2000.00', '2200.00', '80.00', '20.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('20', '20', 'HAMBURGUESA DE POLLO', '4', '2000.00', '2200.00', '48.00', '5.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('21', '21', 'PICADA DE POLLO', '4', '4000.00', '4400.00', '45.00', '10.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('22', '22', 'PICADA DE LOMITO', '4', '5000.00', '5500.00', '119.50', '10.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('23', '23', 'PICADA DE CERDO', '4', '4500.00', '4950.00', '39.00', '20.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('24', '24', 'CHUZO DE POLLO', '4', '3000.00', '3300.00', '202.50', '20.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('25', '25', 'CHUZO DE LOMITO', '4', '4000.00', '4400.00', '19.50', '8.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('26', '26', 'CHUZO DE CERDO', '4', '3500.00', '3850.00', '18.00', '5.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('27', '27', 'PUNTA ANCA', '4', '6500.00', '7150.00', '21.00', '10.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0'), 
      ('28', '28', 'CHURRASCO', '4', '6500.00', '7150.00', '21.00', '10.00', '0.00', 'NO', '0.00', '0', '0000-00-00', '0');
COMMIT;

# | Vaciado de tabla 'kardex_ingredientes'
# +-------------------------------------
DROP TABLE IF EXISTS `kardex_ingredientes`;


# | Estructura de la tabla 'kardex_ingredientes'
# +-------------------------------------
CREATE TABLE `kardex_ingredientes` (
  `codkardex` int(11) NOT NULL AUTO_INCREMENT,
  `codproceso` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codresponsable` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codingrediente` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `movimiento` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `entradas` decimal(12,2) NOT NULL,
  `salidas` decimal(12,2) NOT NULL,
  `devolucion` decimal(12,2) NOT NULL,
  `stockactual` decimal(12,2) NOT NULL,
  `ivaingrediente` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descingrediente` decimal(12,2) NOT NULL,
  `precio` decimal(12,2) NOT NULL,
  `documento` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechakardex` date NOT NULL,
  PRIMARY KEY (`codkardex`)
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'kardex_ingredientes'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `kardex_ingredientes` (`codkardex`, `codproceso`, `codresponsable`, `codingrediente`, `movimiento`, `entradas`, `salidas`, `devolucion`, `stockactual`, `ivaingrediente`, `descingrediente`, `precio`, `documento`, `fechakardex`) VALUES 
      ('1', '1', '0', '1', 'ENTRADAS', '177.50', '0.00', '0.00', '177.50', 'NO', '0.00', '1210.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('2', '2', '0', '2', 'ENTRADAS', '68.50', '0.00', '0.00', '68.50', 'NO', '0.00', '10450.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('3', '3', '0', '3', 'ENTRADAS', '83.00', '0.00', '0.00', '83.00', 'NO', '0.00', '473.22', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('4', '4', '0', '4', 'ENTRADAS', '13.50', '0.00', '0.00', '13.50', 'NO', '0.00', '6600.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('5', '5', '0', '5', 'ENTRADAS', '104.50', '0.00', '0.00', '104.50', 'NO', '0.00', '6600.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('6', '6', '0', '6', 'ENTRADAS', '96.00', '0.00', '0.00', '96.00', 'NO', '0.00', '509.30', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('7', '7', '0', '7', 'ENTRADAS', '31.00', '0.00', '0.00', '31.00', 'NO', '0.00', '1372.80', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('8', '8', '0', '8', 'ENTRADAS', '96.50', '0.00', '0.00', '96.50', 'NO', '0.00', '3382.50', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('9', '9', '0', '9', 'ENTRADAS', '76.00', '0.00', '0.00', '76.00', 'NO', '0.00', '2011.43', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('10', '10', '0', '10', 'ENTRADAS', '132.00', '0.00', '0.00', '132.00', 'NO', '0.00', '1117.60', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('11', '11', '0', '11', 'ENTRADAS', '59.55', '0.00', '0.00', '59.55', 'NO', '0.00', '1098.90', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('12', '12', '0', '12', 'ENTRADAS', '122.00', '0.00', '0.00', '122.00', 'NO', '0.00', '190.30', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('13', '13', '0', '13', 'ENTRADAS', '382.00', '0.00', '0.00', '382.00', 'NO', '0.00', '275.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('14', '14', '0', '14', 'ENTRADAS', '17.00', '0.00', '0.00', '17.00', 'NO', '0.00', '520.83', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('15', '15', '0', '15', 'ENTRADAS', '30.00', '0.00', '0.00', '30.00', 'NO', '0.00', '1503.38', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('16', '16', '0', '16', 'ENTRADAS', '87.00', '0.00', '0.00', '87.00', 'NO', '0.00', '385.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('17', '17', '0', '17', 'ENTRADAS', '38.00', '0.00', '0.00', '38.00', 'NO', '0.00', '495.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('18', '18', '0', '18', 'ENTRADAS', '120.00', '0.00', '0.00', '120.00', 'NO', '0.00', '330.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('19', '19', '0', '19', 'ENTRADAS', '81.00', '0.00', '0.00', '81.00', 'NO', '0.00', '2200.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('20', '20', '0', '20', 'ENTRADAS', '48.00', '0.00', '0.00', '48.00', 'NO', '0.00', '2200.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('21', '21', '0', '21', 'ENTRADAS', '46.00', '0.00', '0.00', '46.00', 'NO', '0.00', '4400.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('22', '22', '0', '22', 'ENTRADAS', '120.00', '0.00', '0.00', '120.00', 'NO', '0.00', '5500.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('23', '23', '0', '23', 'ENTRADAS', '39.00', '0.00', '0.00', '39.00', 'NO', '0.00', '4950.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('24', '24', '0', '24', 'ENTRADAS', '180.50', '0.00', '0.00', '180.50', 'NO', '0.00', '3300.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('25', '25', '0', '25', 'ENTRADAS', '21.50', '0.00', '0.00', '21.50', 'NO', '0.00', '4400.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('26', '26', '0', '26', 'ENTRADAS', '18.00', '0.00', '0.00', '18.00', 'NO', '0.00', '3850.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('27', '27', '0', '27', 'ENTRADAS', '21.00', '0.00', '0.00', '21.00', 'NO', '0.00', '7150.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('28', '28', '0', '28', 'ENTRADAS', '21.00', '0.00', '0.00', '21.00', 'NO', '0.00', '7150.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('29', '0085423', 'P6', '12', 'ENTRADAS', '12.00', '0.00', '0.00', '134.00', 'NO', '0.00', '173.00', 'COMPRA', '2019-10-25'), 
      ('30', '0085423', 'P6', '11', 'ENTRADAS', '15.00', '0.00', '0.00', '74.55', 'NO', '0.00', '999.00', 'COMPRA', '2019-10-25'), 
      ('31', '0085423', 'P6', '15', 'ENTRADAS', '18.50', '0.00', '0.00', '48.50', 'NO', '0.00', '1366.71', 'COMPRA', '2019-10-25'), 
      ('32', '096534', 'P1', '13', 'ENTRADAS', '24.00', '0.00', '0.00', '406.00', 'NO', '0.00', '250.00', 'COMPRA', '2019-10-25'), 
      ('33', '096534', 'P1', '2', 'ENTRADAS', '44.00', '0.00', '0.00', '112.50', 'NO', '0.00', '9500.00', 'COMPRA', '2019-10-25'), 
      ('34', '096534', 'P1', '4', 'ENTRADAS', '15.50', '0.00', '0.00', '29.00', 'NO', '0.00', '6000.00', 'COMPRA', '2019-10-25'), 
      ('35', '066798', 'P4', '2', 'ENTRADAS', '15.00', '0.00', '0.00', '127.50', 'NO', '0.00', '9500.00', 'COMPRA', '2019-10-25'), 
      ('36', '066798', 'P4', '24', 'ENTRADAS', '25.00', '0.00', '0.00', '205.50', 'NO', '0.00', '3000.00', 'COMPRA', '2019-10-25'), 
      ('37', 'P1', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '176.50', 'NO', '0.00', '1210.00', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('38', 'P1', '0', '8', 'SALIDAS', '0.00', '0.50', '0.00', '96.00', 'NO', '0.00', '3382.50', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('39', 'P1', '0', '21', 'SALIDAS', '0.00', '0.50', '0.00', '45.50', 'NO', '0.00', '4400.00', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('40', 'P1', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '175.50', 'NO', '0.00', '1210.00', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('41', 'P1', '0', '8', 'SALIDAS', '0.00', '0.50', '0.00', '95.50', 'NO', '0.00', '3382.50', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('42', 'P1', '0', '22', 'SALIDAS', '0.00', '0.50', '0.00', '119.50', 'NO', '0.00', '5500.00', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('43', 'P1', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '174.50', 'NO', '0.00', '1210.00', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('44', 'P1', '0', '10', 'SALIDAS', '0.00', '1.00', '0.00', '131.00', 'NO', '0.00', '1117.60', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('45', 'P2', '0', '1', 'SALIDAS', '0.00', '10.00', '0.00', '164.50', 'NO', '0.00', '1210.00', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('46', 'P2', '0', '10', 'SALIDAS', '0.00', '10.00', '0.00', '121.00', 'NO', '0.00', '1117.60', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('47', 'P2', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '163.50', 'NO', '0.00', '1210.00', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('48', 'P2', '0', '10', 'SALIDAS', '0.00', '1.00', '0.00', '120.00', 'NO', '0.00', '1117.60', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('49', 'P2', '0', '21', 'SALIDAS', '0.00', '0.50', '0.00', '45.00', 'NO', '0.00', '4400.00', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('50', 'P4', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '162.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2019-12-18'), 
      ('51', 'P4', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '126.50', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2019-12-18'), 
      ('52', 'P4', '0', '15', 'SALIDAS', '0.00', '0.50', '0.00', '48.00', 'NO', '0.00', '1503.38', 'PEDIDO EN MESA', '2019-12-18'), 
      ('53', 'P5', '0', '1', 'SALIDAS', '0.00', '2.00', '0.00', '160.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2019-12-18'), 
      ('54', 'P5', '0', '2', 'SALIDAS', '0.00', '2.00', '0.00', '124.50', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2019-12-18'), 
      ('55', 'P6', 'C10', '1', 'SALIDAS', '0.00', '1.00', '0.00', '159.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2019-12-19'), 
      ('56', 'P6', 'C10', '2', 'SALIDAS', '0.00', '0.50', '0.00', '124.00', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2019-12-19'), 
      ('57', 'P6', 'C10', '5', 'SALIDAS', '0.00', '0.50', '0.00', '104.00', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2019-12-19'), 
      ('58', 'P7', 'C14', '1', 'SALIDAS', '0.00', '1.00', '0.00', '158.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2019-12-19'), 
      ('59', 'P7', 'C14', '4', 'SALIDAS', '0.00', '1.00', '0.00', '28.00', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2019-12-19'), 
      ('60', 'P7', 'C14', '1', 'SALIDAS', '0.00', '1.00', '0.00', '157.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2019-12-19'), 
      ('61', 'P7', 'C14', '5', 'SALIDAS', '0.00', '1.00', '0.00', '103.00', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2019-12-19'), 
      ('62', 'P7', 'C14', '1', 'SALIDAS', '0.00', '2.00', '0.00', '155.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2019-12-19'), 
      ('63', 'P7', 'C14', '2', 'SALIDAS', '0.00', '2.00', '0.00', '122.00', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2019-12-19'), 
      ('64', 'P8', 'C10', '1', 'SALIDAS', '0.00', '2.00', '0.00', '153.50', 'NO', '0.00', '1210.00', 'PEDIDO EN VENTA', '2019-12-21'), 
      ('65', 'P8', 'C10', '2', 'SALIDAS', '0.00', '2.00', '0.00', '120.00', 'NO', '0.00', '10450.00', 'PEDIDO EN VENTA', '2019-12-21'), 
      ('66', 'P8', 'C10', '1', 'SALIDAS', '0.00', '3.00', '0.00', '150.50', 'NO', '0.00', '1210.00', 'PEDIDO EN VENTA', '2019-12-21'), 
      ('67', 'P8', 'C10', '4', 'SALIDAS', '0.00', '3.00', '0.00', '25.00', 'NO', '0.00', '6600.00', 'PEDIDO EN VENTA', '2019-12-21'), 
      ('68', 'P4', '0', '1', 'DEVOLUCION', '0.00', '0.00', '1.00', '151.50', 'NO', '0.00', '1210.00', 'DEVOLUCION PEDIDO EN MESA', '2019-12-21'), 
      ('69', 'P4', '0', '2', 'DEVOLUCION', '0.00', '0.00', '1.00', '121.00', 'NO', '0.00', '10450.00', 'DEVOLUCION PEDIDO EN MESA', '2019-12-21'), 
      ('70', 'P4', '0', '15', 'DEVOLUCION', '0.00', '0.00', '0.50', '48.50', 'NO', '0.00', '1503.38', 'DEVOLUCION PEDIDO EN MESA', '2019-12-21'), 
      ('71', 'P9', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '150.50', 'NO', '0.00', '1210.00', 'PEDIDO EN VENTA', '2019-12-23'), 
      ('72', 'P9', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '120.00', 'NO', '0.00', '10450.00', 'PEDIDO EN VENTA', '2019-12-23'), 
      ('73', 'P9', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '149.50', 'NO', '0.00', '1210.00', 'PEDIDO EN VENTA', '2019-12-23'), 
      ('74', 'P9', '0', '5', 'SALIDAS', '0.00', '1.00', '0.00', '102.00', 'NO', '0.00', '6600.00', 'PEDIDO EN VENTA', '2019-12-23'), 
      ('75', 'P11', 'C34', '15', 'SALIDAS', '0.00', '0.50', '0.00', '48.00', 'NO', '0.00', '1503.38', 'PEDIDO EN MESA', '2019-12-26'), 
      ('76', 'P11', 'C34', '3', 'SALIDAS', '0.00', '3.00', '0.00', '80.00', 'NO', '0.00', '473.22', 'PEDIDO EN MESA', '2019-12-26'), 
      ('77', 'P11', 'C34', '12', 'SALIDAS', '0.00', '1.00', '0.00', '133.00', 'NO', '0.00', '190.30', 'PEDIDO EN MESA', '2019-12-26'), 
      ('78', 'P12', '0', '1', 'SALIDAS', '0.00', '2.00', '0.00', '146.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('79', 'P12', '0', '2', 'SALIDAS', '0.00', '2.00', '0.00', '118.00', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('80', 'P12', '0', '1', 'SALIDAS', '0.00', '2.00', '0.00', '146.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('81', 'P12', '0', '25', 'SALIDAS', '0.00', '1.00', '0.00', '20.50', 'NO', '0.00', '4400.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('82', 'P12', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '145.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('83', 'P12', '0', '5', 'SALIDAS', '0.00', '1.00', '0.00', '101.00', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('84', 'P12', '0', '1', 'DEVOLUCION', '0.00', '0.00', '1.00', '146.50', 'NO', '0.00', '1210.00', 'DEVOLUCION PEDIDO EN MESA', '2020-01-14'), 
      ('85', 'P12', '0', '25', 'DEVOLUCION', '0.00', '0.00', '1.00', '21.50', 'NO', '0.00', '4400.00', 'DEVOLUCION PEDIDO EN MESA', '2020-01-14'), 
      ('86', 'P13', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '145.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('87', 'P13', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '144.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('88', 'P13', '0', '5', 'SALIDAS', '0.00', '1.00', '0.00', '100.00', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('89', 'P13', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '143.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('90', 'P13', '0', '4', 'SALIDAS', '0.00', '1.00', '0.00', '24.00', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('91', 'P14', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '142.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-01-19'), 
      ('92', 'P14', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '117.00', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2020-01-19'), 
      ('93', 'P14', '0', '13', 'SALIDAS', '0.00', '2.00', '0.00', '404.00', 'NO', '0.00', '275.00', 'PEDIDO EN MESA', '2020-01-19'), 
      ('94', 'P14', '0', '9', 'SALIDAS', '0.00', '1.00', '0.00', '75.00', 'NO', '0.00', '2011.43', 'PEDIDO EN MESA', '2020-01-19'), 
      ('95', 'P14', '0', '1', 'SALIDAS', '0.00', '2.00', '0.00', '140.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-01-19'), 
      ('96', 'P14', '0', '1', 'SALIDAS', '0.00', '2.00', '0.00', '138.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-01-19'), 
      ('97', 'P14', '0', '5', 'SALIDAS', '0.00', '2.00', '0.00', '98.00', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-01-19'), 
      ('98', 'P15', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '137.50', 'NO', '0.00', '1210.00', 'PEDIDO EN VENTA', '2020-02-05'), 
      ('99', 'P15', '0', '5', 'SALIDAS', '0.00', '1.00', '0.00', '97.00', 'NO', '0.00', '6600.00', 'PEDIDO EN VENTA', '2020-02-05'), 
      ('100', 'P16', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '136.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-14'), 
      ('101', 'P16', '0', '5', 'SALIDAS', '0.00', '1.00', '0.00', '96.00', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-02-14'), 
      ('102', 'P18', '0', '1', 'SALIDAS', '0.00', '2.00', '0.00', '134.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('103', 'P18', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '116.00', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('104', 'P18', '0', '5', 'SALIDAS', '0.00', '1.00', '0.00', '95.00', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('105', 'P18', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '133.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('106', 'P18', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '115.00', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('107', 'P18', '0', '13', 'SALIDAS', '0.00', '2.00', '0.00', '402.00', 'NO', '0.00', '275.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('108', 'P18', '0', '1', 'SALIDAS', '0.00', '2.00', '0.00', '131.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('109', 'P18', '0', '2', 'SALIDAS', '0.00', '2.00', '0.00', '113.00', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('110', 'P18', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '130.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('111', 'P18', '0', '5', 'SALIDAS', '0.00', '1.00', '0.00', '94.00', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('112', 'P18', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '129.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('113', 'P18', '0', '2', 'SALIDAS', '0.00', '0.50', '0.00', '112.50', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('114', 'P18', '0', '3', 'SALIDAS', '0.00', '1.00', '0.00', '79.00', 'NO', '0.00', '473.22', 'PEDIDO EN MESA', '2020-02-15'), 
      ('115', 'P18', '0', '4', 'SALIDAS', '0.00', '0.50', '0.00', '23.50', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('116', 'P18', '0', '5', 'SALIDAS', '0.00', '0.50', '0.00', '93.50', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('117', 'P18', '0', '11', 'SALIDAS', '0.00', '0.50', '0.00', '74.05', 'NO', '0.00', '1098.90', 'PEDIDO EN MESA', '2020-02-15'), 
      ('118', 'P18', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '128.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('119', 'P18', '0', '13', 'SALIDAS', '0.00', '2.00', '0.00', '400.00', 'NO', '0.00', '275.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('120', 'P18', '0', '25', 'SALIDAS', '0.00', '1.00', '0.00', '20.50', 'NO', '0.00', '4400.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('121', 'P18', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '127.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('122', 'P18', '0', '25', 'SALIDAS', '0.00', '1.00', '0.00', '19.50', 'NO', '0.00', '4400.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('123', 'P18', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '126.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('124', 'P18', '0', '24', 'SALIDAS', '0.00', '1.00', '0.00', '204.50', 'NO', '0.00', '3300.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('125', 'P18', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '125.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('126', 'P18', '0', '13', 'SALIDAS', '0.00', '2.00', '0.00', '398.00', 'NO', '0.00', '275.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('127', 'P18', '0', '24', 'SALIDAS', '0.00', '1.00', '0.00', '203.50', 'NO', '0.00', '3300.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('128', 'P12', '0', '1', 'DEVOLUCION', '0.00', '0.00', '2.00', '127.50', 'NO', '0.00', '1210.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('129', 'P12', '0', '2', 'DEVOLUCION', '0.00', '0.00', '2.00', '114.50', 'NO', '0.00', '10450.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('130', 'P12', '0', '1', 'DEVOLUCION', '0.00', '0.00', '1.00', '128.50', 'NO', '0.00', '1210.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('131', 'P12', '0', '5', 'DEVOLUCION', '0.00', '0.00', '1.00', '94.50', 'NO', '0.00', '6600.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('132', 'P11', '0', '15', 'DEVOLUCION', '0.00', '0.00', '0.50', '48.50', 'NO', '0.00', '1503.38', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('133', 'P11', '0', '3', 'DEVOLUCION', '0.00', '0.00', '3.00', '82.00', 'NO', '0.00', '473.22', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('134', 'P11', '0', '12', 'DEVOLUCION', '0.00', '0.00', '1.00', '134.00', 'NO', '0.00', '190.30', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('135', 'P13', '0', '1', 'DEVOLUCION', '0.00', '0.00', '1.00', '129.50', 'NO', '0.00', '1210.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('136', 'P13', '0', '1', 'DEVOLUCION', '0.00', '0.00', '1.00', '130.50', 'NO', '0.00', '1210.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('137', 'P13', '0', '5', 'DEVOLUCION', '0.00', '0.00', '1.00', '95.50', 'NO', '0.00', '6600.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('138', 'P13', '0', '1', 'DEVOLUCION', '0.00', '0.00', '1.00', '131.50', 'NO', '0.00', '1210.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('139', 'P13', '0', '4', 'DEVOLUCION', '0.00', '0.00', '1.00', '24.50', 'NO', '0.00', '6600.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('140', 'P19', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '130.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('141', 'P19', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '113.50', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('142', 'P19', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '129.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('143', 'P19', '0', '5', 'SALIDAS', '0.00', '1.00', '0.00', '94.50', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('144', 'P20', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '128.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('145', 'P20', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '112.50', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('146', 'P20', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '127.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('147', 'P20', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '126.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('148', 'P20', '0', '24', 'SALIDAS', '0.00', '1.00', '0.00', '202.50', 'NO', '0.00', '3300.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('149', 'P20', '0', '13', 'SALIDAS', '0.00', '1.00', '0.00', '397.00', 'NO', '0.00', '275.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('150', 'P20', '0', '17', 'SALIDAS', '0.00', '1.00', '0.00', '37.00', 'NO', '0.00', '495.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('151', 'P20', '0', '19', 'SALIDAS', '0.00', '1.00', '0.00', '80.00', 'NO', '0.00', '2200.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('152', 'P20', '0', '8', 'SALIDAS', '0.00', '0.50', '0.00', '95.00', 'NO', '0.00', '3382.50', 'PEDIDO EN MESA', '2020-02-20'), 
      ('153', 'P20', '0', '15', 'SALIDAS', '0.00', '1.00', '0.00', '47.50', 'NO', '0.00', '1503.38', 'PEDIDO EN MESA', '2020-02-20'), 
      ('154', 'P21', 'C35', '1', 'SALIDAS', '0.00', '1.00', '0.00', '125.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-03-02'), 
      ('155', 'P21', 'C35', '4', 'SALIDAS', '0.00', '1.00', '0.00', '23.50', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-03-02'), 
      ('156', 'P21', 'C35', '1', 'SALIDAS', '0.00', '1.00', '0.00', '124.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-03-02'), 
      ('157', 'P21', 'C35', '4', 'SALIDAS', '0.00', '1.00', '0.00', '22.50', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-03-02'), 
      ('158', 'P21', 'C35', '13', 'SALIDAS', '0.00', '2.00', '0.00', '395.00', 'NO', '0.00', '275.00', 'PEDIDO EN MESA', '2020-03-02'), 
      ('159', 'P22', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '123.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-03-28'), 
      ('160', 'P22', '0', '1', 'SALIDAS', '0.00', '2.00', '0.00', '122.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-03-28'), 
      ('161', 'P22', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '111.50', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2020-03-28'), 
      ('162', 'P22', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '111.50', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2020-03-28'), 
      ('163', 'P22', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '121.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-03-28'), 
      ('164', 'P22', '0', '5', 'SALIDAS', '0.00', '1.00', '0.00', '93.50', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-03-28'), 
      ('165', 'P23', '0', '1', 'SALIDAS', '0.00', '2.00', '0.00', '119.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-04-03'), 
      ('166', 'P23', '0', '5', 'SALIDAS', '0.00', '2.00', '0.00', '91.50', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-04-03'), 
      ('167', 'P23', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '118.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-04-03'), 
      ('168', 'P23', '0', '1', 'SALIDAS', '0.00', '2.00', '0.00', '117.50', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-04-03'), 
      ('169', 'P23', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '110.50', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2020-04-03'), 
      ('170', 'P23', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '110.50', 'NO', '0.00', '10450.00', 'PEDIDO EN MESA', '2020-04-03');
COMMIT;

# | Vaciado de tabla 'kardex_productos'
# +-------------------------------------
DROP TABLE IF EXISTS `kardex_productos`;


# | Estructura de la tabla 'kardex_productos'
# +-------------------------------------
CREATE TABLE `kardex_productos` (
  `codkardex` int(11) NOT NULL AUTO_INCREMENT,
  `codproceso` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codresponsable` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `movimiento` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `entradas` decimal(12,2) NOT NULL,
  `salidas` decimal(12,2) NOT NULL,
  `devolucion` decimal(12,2) NOT NULL,
  `stockactual` decimal(12,2) NOT NULL,
  `ivaproducto` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `precio` decimal(12,2) NOT NULL,
  `documento` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechakardex` date NOT NULL,
  PRIMARY KEY (`codkardex`)
) ENGINE=MyISAM AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'kardex_productos'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `kardex_productos` (`codkardex`, `codproceso`, `codresponsable`, `codproducto`, `movimiento`, `entradas`, `salidas`, `devolucion`, `stockactual`, `ivaproducto`, `descproducto`, `precio`, `documento`, `fechakardex`) VALUES 
      ('1', '1', '0', '1', 'ENTRADAS', '62.00', '0.00', '0.00', '62.00', 'NO', '0.00', '11000.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('2', '2', '0', '2', 'ENTRADAS', '74.00', '0.00', '0.00', '74.00', 'NO', '0.00', '8800.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('3', '3', '0', '3', 'ENTRADAS', '82.00', '0.00', '0.00', '82.00', 'NO', '0.00', '9900.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('4', '4', '0', '4', 'ENTRADAS', '90.00', '0.00', '0.00', '90.00', 'NO', '0.00', '11440.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('5', '5', '0', '5', 'ENTRADAS', '96.00', '0.00', '0.00', '96.00', 'NO', '0.00', '12540.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('6', '6', '0', '6', 'ENTRADAS', '96.00', '0.00', '0.00', '96.00', 'NO', '0.00', '9900.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('7', '7', '0', '7', 'ENTRADAS', '95.00', '0.00', '0.00', '95.00', 'NO', '0.00', '13200.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('8', '8', '0', '8', 'ENTRADAS', '57.00', '0.00', '0.00', '57.00', 'NO', '0.00', '8800.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('9', '9', '0', '9', 'ENTRADAS', '93.00', '0.00', '0.00', '93.00', 'NO', '0.00', '8800.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('10', '10', '0', '10', 'ENTRADAS', '928.00', '0.00', '0.00', '928.00', 'NO', '0.00', '6600.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('11', '11', '0', '11', 'ENTRADAS', '816.00', '0.00', '0.00', '816.00', 'NO', '0.00', '3300.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('12', '12', '0', '12', 'ENTRADAS', '92.00', '0.00', '0.00', '92.00', 'NO', '0.00', '13200.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('13', '13', '0', '13', 'ENTRADAS', '97.00', '0.00', '0.00', '97.00', 'NO', '0.00', '14300.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('14', '14', '0', '14', 'ENTRADAS', '95.00', '0.00', '0.00', '95.00', 'NO', '0.00', '17600.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('15', '15', '0', '15', 'ENTRADAS', '91.00', '0.00', '0.00', '91.00', 'NO', '0.00', '8800.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('16', '16', '0', '16', 'ENTRADAS', '96.00', '0.00', '0.00', '96.00', 'NO', '0.00', '9900.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('17', '17', '0', '17', 'ENTRADAS', '95.00', '0.00', '0.00', '95.00', 'NO', '0.00', '8800.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('18', '18', '0', '18', 'ENTRADAS', '99.00', '0.00', '0.00', '99.00', 'NO', '0.00', '6600.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('19', '19', '0', '19', 'ENTRADAS', '89.00', '0.00', '0.00', '89.00', 'NO', '0.00', '12100.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('20', '20', '0', '20', 'ENTRADAS', '95.00', '0.00', '0.00', '95.00', 'NO', '0.00', '9900.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('21', '21', '0', '21', 'ENTRADAS', '95.00', '0.00', '0.00', '95.00', 'NO', '0.00', '18700.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('22', '22', '0', '22', 'ENTRADAS', '892.00', '0.00', '0.00', '892.00', 'NO', '0.00', '4400.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('23', '23', '0', '23', 'ENTRADAS', '81.00', '0.00', '0.00', '81.00', 'NO', '0.00', '7480.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('24', '24', '0', '24', 'ENTRADAS', '85.00', '0.00', '0.00', '85.00', 'NO', '0.00', '7150.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('25', '25', '0', '25', 'ENTRADAS', '97.00', '0.00', '0.00', '97.00', 'NO', '0.00', '7810.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('26', '26', '0', '26', 'ENTRADAS', '96.00', '0.00', '0.00', '96.00', 'NO', '0.00', '7590.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('27', '27', '0', '27', 'ENTRADAS', '94.00', '0.00', '0.00', '94.00', 'NO', '0.00', '7480.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('28', '28', '0', '28', 'ENTRADAS', '97.00', '0.00', '0.00', '97.00', 'NO', '0.00', '11990.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('29', '29', '0', '29', 'ENTRADAS', '100.00', '0.00', '0.00', '100.00', 'NO', '0.00', '23210.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('30', '30', '0', '30', 'ENTRADAS', '58.00', '0.00', '0.00', '58.00', 'NO', '0.00', '6600.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('31', '31', '0', '31', 'ENTRADAS', '93.00', '0.00', '0.00', '93.00', 'NO', '0.00', '7260.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('32', '32', '0', '32', 'ENTRADAS', '91.00', '0.00', '0.00', '91.00', 'NO', '0.00', '6930.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('33', '33', '0', '33', 'ENTRADAS', '74.00', '0.00', '0.00', '74.00', 'NO', '0.00', '110.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('34', '34', '0', '34', 'ENTRADAS', '59.00', '0.00', '0.00', '59.00', 'NO', '0.00', '6930.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('35', '35', '0', '35', 'ENTRADAS', '86.00', '0.00', '0.00', '86.00', 'NO', '0.00', '7480.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('36', '36', '0', '36', 'ENTRADAS', '87.00', '0.00', '0.00', '87.00', 'NO', '0.00', '6380.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('37', '37', '0', '37', 'ENTRADAS', '99.00', '0.00', '0.00', '99.00', 'NO', '0.00', '13310.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('38', '38', '0', '38', 'ENTRADAS', '96.00', '0.00', '0.00', '96.00', 'NO', '0.00', '6930.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('39', '39', '0', '39', 'ENTRADAS', '95.00', '0.00', '0.00', '95.00', 'NO', '0.00', '9900.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('40', '40', '0', '40', 'ENTRADAS', '95.00', '0.00', '0.00', '95.00', 'NO', '0.00', '9790.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('41', '41', '0', '41', 'ENTRADAS', '97.00', '0.00', '0.00', '97.00', 'NO', '0.00', '11220.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('42', '42', '0', '42', 'ENTRADAS', '81.00', '0.00', '0.00', '81.00', 'NO', '0.00', '12760.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('43', '43', '0', '43', 'ENTRADAS', '77.00', '0.00', '0.00', '77.00', 'NO', '0.00', '22000.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('44', '44', '0', '44', 'ENTRADAS', '84.00', '0.00', '0.00', '84.00', 'NO', '0.00', '4950.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('45', '45', '0', '45', 'ENTRADAS', '92.00', '0.00', '0.00', '92.00', 'NO', '0.00', '6380.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('46', '46', '0', '46', 'ENTRADAS', '96.00', '0.00', '0.00', '96.00', 'NO', '0.00', '8580.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('47', '47', '0', '47', 'ENTRADAS', '94.00', '0.00', '0.00', '94.00', 'NO', '0.00', '8910.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('48', '48', '0', '48', 'ENTRADAS', '100.00', '0.00', '0.00', '100.00', 'NO', '0.00', '8690.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('49', '49', '0', '49', 'ENTRADAS', '96.00', '0.00', '0.00', '96.00', 'NO', '0.00', '9130.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('50', '50', '0', '50', 'ENTRADAS', '96.00', '0.00', '0.00', '96.00', 'NO', '0.00', '13090.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('51', '51', '0', '51', 'ENTRADAS', '97.00', '0.00', '0.00', '97.00', 'NO', '0.00', '16170.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('52', '52', '0', '52', 'ENTRADAS', '96.00', '0.00', '0.00', '96.00', 'NO', '0.00', '11880.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('53', '53', '0', '53', 'ENTRADAS', '98.00', '0.00', '0.00', '98.00', 'NO', '0.00', '23210.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('54', '54', '0', '54', 'ENTRADAS', '53.00', '0.00', '0.00', '53.00', 'NO', '0.00', '330.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('55', '55', '0', '55', 'ENTRADAS', '88.00', '0.00', '0.00', '88.00', 'NO', '0.00', '3300.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('56', '56', '0', '56', 'ENTRADAS', '84.00', '0.00', '0.00', '84.00', 'NO', '0.00', '6600.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('57', '57', '0', '57', 'ENTRADAS', '92.00', '0.00', '0.00', '92.00', 'NO', '0.00', '6600.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('58', '58', '0', '58', 'ENTRADAS', '87.00', '0.00', '0.00', '87.00', 'NO', '0.00', '8800.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('59', '59', '0', '59', 'ENTRADAS', '99.00', '0.00', '0.00', '99.00', 'NO', '0.00', '6600.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('60', '60', '0', '60', 'ENTRADAS', '98.00', '0.00', '0.00', '98.00', 'NO', '0.00', '11000.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('61', '61', '0', '61', 'ENTRADAS', '89.00', '0.00', '0.00', '89.00', 'NO', '0.00', '7700.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('62', '62', '0', '62', 'ENTRADAS', '39.00', '0.00', '0.00', '39.00', 'NO', '0.00', '5500.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('63', '63', '0', '63', 'ENTRADAS', '89.00', '0.00', '0.00', '89.00', 'NO', '0.00', '6600.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('64', '64', '0', '64', 'ENTRADAS', '96.00', '0.00', '0.00', '96.00', 'NO', '0.00', '6600.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('65', '65', '0', '65', 'ENTRADAS', '88.00', '0.00', '0.00', '88.00', 'NO', '0.00', '5500.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('66', '66', '0', '66', 'ENTRADAS', '69.00', '0.00', '0.00', '69.00', 'NO', '0.00', '6490.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('67', '67', '0', '67', 'ENTRADAS', '90.00', '0.00', '0.00', '90.00', 'NO', '0.00', '7590.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('68', '68', '0', '68', 'ENTRADAS', '87.00', '0.00', '0.00', '87.00', 'NO', '0.00', '5500.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('69', '69', '0', '69', 'ENTRADAS', '98.00', '0.00', '0.00', '98.00', 'NO', '0.00', '6600.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('70', '70', '0', '70', 'ENTRADAS', '88.00', '0.00', '0.00', '88.00', 'NO', '0.00', '6380.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('71', '71', '0', '71', 'ENTRADAS', '92.00', '0.00', '0.00', '92.00', 'NO', '0.00', '6600.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('72', '72', '0', '72', 'ENTRADAS', '89.00', '0.00', '0.00', '89.00', 'NO', '0.00', '6270.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('73', '73', '0', '73', 'ENTRADAS', '99.00', '0.00', '0.00', '99.00', 'NO', '0.00', '6820.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('74', '74', '0', '74', 'ENTRADAS', '98.00', '0.00', '0.00', '98.00', 'NO', '0.00', '6380.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('75', '75', '0', '75', 'ENTRADAS', '97.00', '0.00', '0.00', '97.00', 'NO', '0.00', '7590.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('76', '76', '0', '76', 'ENTRADAS', '93.00', '0.00', '0.00', '93.00', 'NO', '0.00', '9570.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('77', '77', '0', '77', 'ENTRADAS', '100.00', '0.00', '0.00', '100.00', 'NO', '0.00', '6930.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('78', '78', '0', '78', 'ENTRADAS', '100.00', '0.00', '0.00', '100.00', 'NO', '0.00', '6050.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('79', '79', '0', '79', 'ENTRADAS', '99.00', '0.00', '0.00', '99.00', 'NO', '0.00', '6380.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('80', '80', '0', '80', 'ENTRADAS', '98.00', '0.00', '0.00', '98.00', 'NO', '0.00', '6270.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('81', '81', '0', '81', 'ENTRADAS', '91.00', '0.00', '0.00', '91.00', 'NO', '0.00', '5500.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('82', '82', '0', '82', 'ENTRADAS', '98.00', '0.00', '0.00', '98.00', 'NO', '0.00', '5500.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('83', '83', '0', '83', 'ENTRADAS', '98.00', '0.00', '0.00', '98.00', 'NO', '0.00', '7590.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('84', '84', '0', '84', 'ENTRADAS', '95.00', '0.00', '0.00', '95.00', 'NO', '0.00', '11330.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('85', '85', '0', '85', 'ENTRADAS', '92.00', '0.00', '0.00', '92.00', 'NO', '0.00', '12320.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('86', '86', '0', '86', 'ENTRADAS', '100.00', '0.00', '0.00', '100.00', 'NO', '0.00', '22000.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('87', '87', '0', '87', 'ENTRADAS', '146.00', '0.00', '0.00', '146.00', 'NO', '0.00', '1430.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('88', '88', '0', '88', 'ENTRADAS', '91.00', '0.00', '0.00', '91.00', 'NO', '0.00', '2750.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('89', '89', '0', '89', 'ENTRADAS', '155.00', '0.00', '0.00', '155.00', 'NO', '0.00', '4950.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('90', '90', '0', '90', 'ENTRADAS', '9.00', '0.00', '0.00', '9.00', 'NO', '0.00', '1677.50', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('91', '91', '0', '91', 'ENTRADAS', '146.00', '0.00', '0.00', '146.00', 'NO', '0.00', '1320.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('92', '92', '0', '92', 'ENTRADAS', '113.00', '0.00', '0.00', '113.00', 'NO', '0.00', '1677.50', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('93', '93', '0', '93', 'ENTRADAS', '150.00', '0.00', '0.00', '150.00', 'NO', '0.00', '2200.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('94', '94', '0', '94', 'ENTRADAS', '115.00', '0.00', '0.00', '115.00', 'NO', '0.00', '1980.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('95', '95', '0', '95', 'ENTRADAS', '16.00', '0.00', '0.00', '16.00', 'NO', '0.00', '1677.50', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('96', '96', '0', '96', 'ENTRADAS', '25.00', '0.00', '0.00', '25.00', 'NO', '0.00', '1430.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('97', '97', '0', '97', 'ENTRADAS', '24.00', '0.00', '0.00', '24.00', 'NO', '0.00', '2255.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('98', '98', '0', '98', 'ENTRADAS', '26.00', '0.00', '0.00', '26.00', 'NO', '0.00', '990.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('99', '99', '0', '99', 'ENTRADAS', '40.00', '0.00', '0.00', '40.00', 'NO', '0.00', '1210.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('100', '100', '0', '100', 'ENTRADAS', '78.00', '0.00', '0.00', '78.00', 'NO', '0.00', '1430.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('101', '101', '0', '101', 'ENTRADAS', '94.00', '0.00', '0.00', '94.00', 'NO', '0.00', '4400.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('102', '102', '0', '102', 'ENTRADAS', '97.00', '0.00', '0.00', '97.00', 'NO', '0.00', '5500.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('103', '103', '0', '103', 'ENTRADAS', '91.00', '0.00', '0.00', '91.00', 'NO', '0.00', '495.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('104', '104', '0', '104', 'ENTRADAS', '99.00', '0.00', '0.00', '99.00', 'NO', '0.00', '1155.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('105', '105', '0', '105', 'ENTRADAS', '99.00', '0.00', '0.00', '99.00', 'NO', '0.00', '1100.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('106', '106', '0', '106', 'ENTRADAS', '94.00', '0.00', '0.00', '94.00', 'NO', '0.00', '880.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('107', '107', '0', '107', 'ENTRADAS', '100.00', '0.00', '0.00', '100.00', 'NO', '0.00', '1155.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('108', '108', '0', '108', 'ENTRADAS', '38.00', '0.00', '0.00', '38.00', 'NO', '0.00', '330.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('109', '109', '0', '109', 'ENTRADAS', '966.00', '0.00', '0.00', '966.00', 'NO', '0.00', '2200.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('110', '110', '0', '110', 'ENTRADAS', '77.00', '0.00', '0.00', '77.00', 'NO', '0.00', '3300.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('111', '111', '0', '111', 'ENTRADAS', '94.00', '0.00', '0.00', '94.00', 'NO', '0.00', '4400.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('112', '112', '0', '112', 'ENTRADAS', '99.00', '0.00', '0.00', '99.00', 'NO', '0.00', '5500.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('113', '113', '0', '113', 'ENTRADAS', '96.00', '0.00', '0.00', '96.00', 'NO', '0.00', '7700.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('114', '114', '0', '114', 'ENTRADAS', '99.00', '0.00', '0.00', '99.00', 'NO', '0.00', '3300.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('115', '115', '0', '115', 'ENTRADAS', '97.00', '0.00', '0.00', '97.00', 'NO', '0.00', '2750.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('116', '116', '0', '116', 'ENTRADAS', '90.00', '0.00', '0.00', '90.00', 'NO', '0.00', '3850.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('117', '117', '0', '117', 'ENTRADAS', '90.00', '0.00', '0.00', '90.00', 'NO', '0.00', '5500.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('118', '118', '0', '118', 'ENTRADAS', '100.00', '0.00', '0.00', '100.00', 'NO', '0.00', '3850.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('119', '119', '0', '119', 'ENTRADAS', '97.00', '0.00', '0.00', '97.00', 'NO', '0.00', '4950.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('120', '120', '0', '120', 'ENTRADAS', '98.00', '0.00', '0.00', '98.00', 'NO', '0.00', '4180.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('121', '122', '0', '122', 'ENTRADAS', '100.00', '0.00', '0.00', '100.00', 'NO', '0.00', '3850.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('122', '123', '0', '123', 'ENTRADAS', '100.00', '0.00', '0.00', '100.00', 'NO', '0.00', '3850.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('123', '124', '0', '124', 'ENTRADAS', '99.00', '0.00', '0.00', '99.00', 'NO', '0.00', '3850.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('124', '125', '0', '125', 'ENTRADAS', '99.00', '0.00', '0.00', '99.00', 'NO', '0.00', '2200.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('125', '126', '0', '126', 'ENTRADAS', '96.00', '0.00', '0.00', '96.00', 'NO', '0.00', '6600.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('126', '127', '0', '127', 'ENTRADAS', '100.00', '0.00', '0.00', '100.00', 'NO', '0.00', '9900.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('127', '128', '0', '128', 'ENTRADAS', '100.00', '0.00', '0.00', '100.00', 'NO', '0.00', '10450.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('128', '129', '0', '129', 'ENTRADAS', '99.00', '0.00', '0.00', '99.00', 'NO', '0.00', '5500.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('129', '130', '0', '130', 'ENTRADAS', '100.00', '0.00', '0.00', '100.00', 'NO', '0.00', '5500.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('130', '131', '0', '131', 'ENTRADAS', '94.00', '0.00', '0.00', '94.00', 'NO', '0.00', '11000.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('131', '132', '0', '132', 'ENTRADAS', '77.00', '0.00', '0.00', '77.00', 'NO', '0.00', '1100.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('132', '133', '0', '133', 'ENTRADAS', '96.00', '0.00', '0.00', '96.00', 'NO', '0.00', '1100.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('133', '134', '0', '134', 'ENTRADAS', '97.00', '0.00', '0.00', '97.00', 'NO', '0.00', '330.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('134', '135', '0', '135', 'ENTRADAS', '98.00', '0.00', '0.00', '98.00', 'NO', '0.00', '2090.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('135', '136', '0', '136', 'ENTRADAS', '99.00', '0.00', '0.00', '99.00', 'NO', '0.00', '4400.00', 'INVENTARIO INICIAL', '2019-10-23'), 
      ('136', '0085423', 'P6', '87', 'ENTRADAS', '35.00', '0.00', '0.00', '181.00', 'NO', '0.00', '1300.00', 'COMPRA', '2019-10-25'), 
      ('137', '0085423', 'P6', '88', 'ENTRADAS', '15.00', '0.00', '0.00', '106.00', 'NO', '0.00', '2500.00', 'COMPRA', '2019-10-25'), 
      ('138', '0085423', 'P6', '97', 'ENTRADAS', '37.00', '0.00', '0.00', '61.00', 'NO', '0.00', '2050.00', 'COMPRA', '2019-10-25'), 
      ('139', '096534', 'P1', '89', 'ENTRADAS', '25.00', '0.00', '0.00', '180.00', 'NO', '0.00', '4500.00', 'COMPRA', '2019-10-25'), 
      ('140', '066798', 'P4', '87', 'ENTRADAS', '15.00', '0.00', '0.00', '196.00', 'NO', '0.00', '1300.00', 'COMPRA', '2019-10-25'), 
      ('141', 'P1', '0', '15', 'SALIDAS', '0.00', '1.00', '0.00', '90.00', 'NO', '0.00', '8800.00', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('142', 'P1', '0', '16', 'SALIDAS', '0.00', '1.00', '0.00', '95.00', 'NO', '0.00', '9900.00', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('143', 'P1', '0', '22', 'SALIDAS', '0.00', '1.00', '0.00', '891.00', 'NO', '0.00', '4400.00', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('144', 'P2', '0', '22', 'SALIDAS', '0.00', '10.00', '0.00', '881.00', 'NO', '0.00', '4400.00', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('145', 'P2', '0', '23', 'SALIDAS', '0.00', '1.00', '0.00', '80.00', 'NO', '0.00', '7480.00', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('146', 'P3', '0', '92', 'SALIDAS', '0.00', '1.00', '0.00', '112.00', 'NO', '0.00', '1677.50', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('147', 'P3', '0', '88', 'SALIDAS', '0.00', '1.00', '0.00', '105.00', 'NO', '0.00', '2750.00', 'PEDIDO EN VENTA', '2019-11-23'), 
      ('148', 'P4', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '61.00', 'NO', '0.00', '11000.00', 'PEDIDO EN MESA', '2019-12-18'), 
      ('149', 'P4', '0', '100', 'SALIDAS', '0.00', '1.00', '0.00', '77.00', 'NO', '0.00', '1430.00', 'PEDIDO EN MESA', '2019-12-18'), 
      ('150', 'P5', '0', '1', 'SALIDAS', '0.00', '2.00', '0.00', '59.00', 'NO', '0.00', '11000.00', 'PEDIDO EN MESA', '2019-12-18'), 
      ('151', 'P6', 'C10', '6', 'SALIDAS', '0.00', '1.00', '0.00', '95.00', 'NO', '0.00', '9900.00', 'PEDIDO EN MESA', '2019-12-19'), 
      ('152', 'P7', 'C14', '3', 'SALIDAS', '0.00', '1.00', '0.00', '81.00', 'NO', '0.00', '9900.00', 'PEDIDO EN MESA', '2019-12-19'), 
      ('153', 'P7', 'C14', '2', 'SALIDAS', '0.00', '1.00', '0.00', '73.00', 'NO', '0.00', '8800.00', 'PEDIDO EN MESA', '2019-12-19'), 
      ('154', 'P7', 'C14', '1', 'SALIDAS', '0.00', '2.00', '0.00', '57.00', 'NO', '0.00', '11000.00', 'PEDIDO EN MESA', '2019-12-19'), 
      ('155', 'P8', 'C10', '1', 'SALIDAS', '0.00', '2.00', '0.00', '55.00', 'NO', '0.00', '11000.00', 'PEDIDO EN VENTA', '2019-12-21'), 
      ('156', 'P8', 'C10', '3', 'SALIDAS', '0.00', '3.00', '0.00', '78.00', 'NO', '0.00', '9900.00', 'PEDIDO EN VENTA', '2019-12-21'), 
      ('157', 'P4', '0', '1', 'DEVOLUCION', '0.00', '0.00', '1.00', '56.00', '0', '0.00', '11000.00', 'DEVOLUCION PEDIDO EN MESA', '2019-12-21'), 
      ('158', 'P4', '0', '100', 'DEVOLUCION', '0.00', '0.00', '1.00', '78.00', '0', '0.00', '1430.00', 'DEVOLUCION PEDIDO EN MESA', '2019-12-21'), 
      ('159', 'P9', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '55.00', 'NO', '0.00', '11000.00', 'PEDIDO EN VENTA', '2019-12-23'), 
      ('160', 'P9', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '72.00', 'NO', '0.00', '8800.00', 'PEDIDO EN VENTA', '2019-12-23'), 
      ('161', 'P10', '0', '87', 'SALIDAS', '0.00', '2.00', '0.00', '194.00', 'NO', '0.00', '1430.00', 'PEDIDO EN MESA', '2019-12-23'), 
      ('162', 'P10', '0', '88', 'SALIDAS', '0.00', '2.00', '0.00', '103.00', 'NO', '0.00', '2750.00', 'PEDIDO EN MESA', '2019-12-23'), 
      ('163', 'P10', '0', '89', 'SALIDAS', '0.00', '1.00', '0.00', '179.00', 'NO', '0.00', '4950.00', 'PEDIDO EN MESA', '2019-12-23'), 
      ('164', 'P11', 'C34', '90', 'SALIDAS', '0.00', '3.00', '0.00', '6.00', 'NO', '0.00', '1677.50', 'PEDIDO EN MESA', '2019-12-26'), 
      ('165', 'P11', 'C34', '100', 'SALIDAS', '0.00', '1.00', '0.00', '77.00', 'NO', '0.00', '1430.00', 'PEDIDO EN MESA', '2019-12-26'), 
      ('166', 'P11', 'C34', '103', 'SALIDAS', '0.00', '3.00', '0.00', '88.00', 'NO', '0.00', '495.00', 'PEDIDO EN MESA', '2019-12-26'), 
      ('167', 'P11', 'C34', '134', 'SALIDAS', '0.00', '1.00', '0.00', '96.00', 'NO', '0.00', '330.00', 'PEDIDO EN MESA', '2019-12-26'), 
      ('168', 'P12', '0', '88', 'SALIDAS', '0.00', '1.00', '0.00', '102.00', 'NO', '0.00', '2750.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('169', 'P12', '0', '1', 'SALIDAS', '0.00', '2.00', '0.00', '53.00', 'NO', '0.00', '11000.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('170', 'P12', '0', '63', 'SALIDAS', '0.00', '1.00', '0.00', '88.00', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('171', 'P12', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '71.00', 'NO', '0.00', '8800.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('172', 'P12', '0', '63', 'DEVOLUCION', '0.00', '0.00', '1.00', '89.00', '0', '0.00', '6600.00', 'DEVOLUCION PEDIDO EN MESA', '2020-01-14'), 
      ('173', 'P13', '0', '90', 'SALIDAS', '0.00', '1.00', '0.00', '5.00', 'NO', '0.00', '1677.50', 'PEDIDO EN MESA', '2020-01-14'), 
      ('174', 'P13', '0', '87', 'SALIDAS', '0.00', '1.00', '0.00', '193.00', 'NO', '0.00', '1430.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('175', 'P13', '0', '88', 'SALIDAS', '0.00', '1.00', '0.00', '101.00', 'NO', '0.00', '2750.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('176', 'P13', '0', '99', 'SALIDAS', '0.00', '1.00', '0.00', '39.00', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('177', 'P13', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '70.00', 'NO', '0.00', '8800.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('178', 'P13', '0', '3', 'SALIDAS', '0.00', '1.00', '0.00', '77.00', 'NO', '0.00', '9900.00', 'PEDIDO EN MESA', '2020-01-14'), 
      ('179', 'P14', '0', '5', 'SALIDAS', '0.00', '1.00', '0.00', '95.00', 'NO', '0.00', '12540.00', 'PEDIDO EN MESA', '2020-01-19'), 
      ('180', 'P14', '0', '104', 'SALIDAS', '0.00', '1.00', '0.00', '98.00', 'NO', '0.00', '1155.00', 'PEDIDO EN MESA', '2020-01-19'), 
      ('181', 'P14', '0', '99', 'SALIDAS', '0.00', '2.00', '0.00', '37.00', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-01-19'), 
      ('182', 'P14', '0', '2', 'SALIDAS', '0.00', '2.00', '0.00', '68.00', 'NO', '0.00', '8800.00', 'PEDIDO EN MESA', '2020-01-19'), 
      ('183', 'P15', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '67.00', 'NO', '0.00', '8800.00', 'PEDIDO EN VENTA', '2020-02-05'), 
      ('184', 'P16', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '66.00', 'NO', '0.00', '8800.00', 'PEDIDO EN MESA', '2020-02-14'), 
      ('185', 'P17', '0', '89', 'SALIDAS', '0.00', '1.00', '0.00', '178.00', 'NO', '0.00', '22.12', 'PEDIDO EN VENTA', '2020-02-15'), 
      ('186', 'P18', '0', '6', 'SALIDAS', '0.00', '2.00', '0.00', '93.00', 'NO', '0.00', '9900.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('187', 'P18', '0', '5', 'SALIDAS', '0.00', '1.00', '0.00', '94.00', 'NO', '0.00', '12540.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('188', 'P18', '0', '1', 'SALIDAS', '0.00', '2.00', '0.00', '51.00', 'NO', '0.00', '11000.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('189', 'P18', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '65.00', 'NO', '0.00', '8800.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('190', 'P18', '0', '14', 'SALIDAS', '0.00', '1.00', '0.00', '94.00', 'NO', '0.00', '17600.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('191', 'P18', '0', '67', 'SALIDAS', '0.00', '1.00', '0.00', '89.00', 'NO', '0.00', '7590.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('192', 'P18', '0', '63', 'SALIDAS', '0.00', '1.00', '0.00', '88.00', 'NO', '0.00', '6600.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('193', 'P18', '0', '62', 'SALIDAS', '0.00', '1.00', '0.00', '38.00', 'NO', '0.00', '5500.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('194', 'P18', '0', '66', 'SALIDAS', '0.00', '1.00', '0.00', '68.00', 'NO', '0.00', '6490.00', 'PEDIDO EN MESA', '2020-02-15'), 
      ('195', 'P12', '0', '88', 'DEVOLUCION', '0.00', '0.00', '1.00', '102.00', 'NO', '0.00', '2750.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('196', 'P12', '0', '1', 'DEVOLUCION', '0.00', '0.00', '2.00', '53.00', 'NO', '0.00', '11000.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('197', 'P12', '0', '2', 'DEVOLUCION', '0.00', '0.00', '1.00', '66.00', 'NO', '0.00', '8800.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('198', 'P11', '0', '90', 'DEVOLUCION', '0.00', '0.00', '3.00', '8.00', 'NO', '0.00', '1677.50', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('199', 'P11', '0', '100', 'DEVOLUCION', '0.00', '0.00', '1.00', '78.00', 'NO', '0.00', '1430.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('200', 'P11', '0', '103', 'DEVOLUCION', '0.00', '0.00', '3.00', '91.00', 'NO', '0.00', '495.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('201', 'P11', '0', '134', 'DEVOLUCION', '0.00', '0.00', '1.00', '97.00', 'NO', '0.00', '330.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('202', 'P13', '0', '90', 'DEVOLUCION', '0.00', '0.00', '1.00', '9.00', 'NO', '0.00', '1677.50', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('203', 'P13', '0', '87', 'DEVOLUCION', '0.00', '0.00', '1.00', '194.00', 'NO', '0.00', '1430.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('204', 'P13', '0', '88', 'DEVOLUCION', '0.00', '0.00', '1.00', '103.00', 'NO', '0.00', '2750.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('205', 'P13', '0', '99', 'DEVOLUCION', '0.00', '0.00', '1.00', '38.00', 'NO', '0.00', '1210.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('206', 'P13', '0', '2', 'DEVOLUCION', '0.00', '0.00', '1.00', '67.00', 'NO', '0.00', '8800.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('207', 'P13', '0', '3', 'DEVOLUCION', '0.00', '0.00', '1.00', '78.00', 'NO', '0.00', '9900.00', 'DEVOLUCION PEDIDO EN MESA', '2020-02-15'), 
      ('208', 'P19', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '52.00', 'NO', '0.00', '11000.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('209', 'P19', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '66.00', 'NO', '0.00', '8800.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('210', 'P20', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '51.00', 'NO', '0.00', '11000.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('211', 'P20', '0', '99', 'SALIDAS', '0.00', '1.00', '0.00', '37.00', 'NO', '0.00', '1210.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('212', 'P20', '0', '90', 'SALIDAS', '0.00', '1.00', '0.00', '8.00', 'NO', '0.00', '1677.50', 'PEDIDO EN MESA', '2020-02-20'), 
      ('213', 'P20', '0', '62', 'SALIDAS', '0.00', '1.00', '0.00', '37.00', 'NO', '0.00', '5500.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('214', 'P20', '0', '54', 'SALIDAS', '0.00', '1.00', '0.00', '52.00', 'NO', '0.00', '330.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('215', 'P20', '0', '45', 'SALIDAS', '0.00', '1.00', '0.00', '91.00', 'NO', '0.00', '6380.00', 'PEDIDO EN MESA', '2020-02-20'), 
      ('216', 'P21', 'C35', '3', 'SALIDAS', '0.00', '1.00', '0.00', '77.00', 'NO', '0.00', '9900.00', 'PEDIDO EN MESA', '2020-03-02'), 
      ('217', 'P21', 'C35', '4', 'SALIDAS', '0.00', '1.00', '0.00', '89.00', 'NO', '0.00', '11440.00', 'PEDIDO EN MESA', '2020-03-02'), 
      ('218', 'P22', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '50.00', 'NO', '0.00', '11000.00', 'PEDIDO EN MESA', '2020-03-28'), 
      ('219', 'P22', '0', '2', 'SALIDAS', '0.00', '1.00', '0.00', '65.00', 'NO', '0.00', '8800.00', 'PEDIDO EN MESA', '2020-03-28'), 
      ('220', 'P23', '0', '2', 'SALIDAS', '0.00', '2.00', '0.00', '63.00', 'NO', '0.00', '8800.00', 'PEDIDO EN MESA', '2020-04-03'), 
      ('221', 'P23', '0', '1', 'SALIDAS', '0.00', '1.00', '0.00', '49.00', 'NO', '0.00', '11000.00', 'PEDIDO EN MESA', '2020-04-03');
COMMIT;

# | Vaciado de tabla 'log'
# +-------------------------------------
DROP TABLE IF EXISTS `log`;


# | Estructura de la tabla 'log'
# +-------------------------------------
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tiempo` datetime DEFAULT NULL,
  `detalles` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `paginas` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'log'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `log` (`id`, `ip`, `tiempo`, `detalles`, `paginas`, `usuario`) VALUES 
      ('1', '190.233.51.246', '2019-12-18 08:24:23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('2', '190.235.69.121', '2019-12-18 08:24:42', 'Mozilla/5.0 (Linux; Android 9; MI 8 Build/PKQ1.180729.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.79 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/250.0.0.26.241;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('3', '132.191.2.230', '2019-12-18 08:25:50', 'Mozilla/5.0 (Linux; Android 9; SM-A105M Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.108 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/250.0.0.26.241;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('4', '190.42.109.11', '2019-12-18 09:02:11', 'Mozilla/5.0 (Linux; Android 9; Mi A3 Build/PKQ1.190416.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.93 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/251.0.0.31.111;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('5', '190.42.109.11', '2019-12-18 09:02:11', 'Mozilla/5.0 (Linux; Android 9; Mi A3 Build/PKQ1.190416.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.93 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/251.0.0.31.111;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('6', '201.240.147.126', '2019-12-19 12:12:46', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('7', '181.64.238.41', '2019-12-19 12:37:06', 'Mozilla/5.0 (Linux; Android 7.1.2; LM-X210 Build/N2G47H; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.93 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/250.0.0.26.241;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('8', '181.64.238.41', '2019-12-19 12:37:07', 'Mozilla/5.0 (Linux; Android 7.1.2; LM-X210 Build/N2G47H; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.93 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/250.0.0.26.241;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('9', '190.43.38.33', '2019-12-19 08:50:55', 'Mozilla/5.0 (Linux; Android 9; SM-G973F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.108 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/250.0.0.26.241;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('10', '132.191.0.187', '2019-12-19 09:43:39', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 [FBAN/MessengerForiOS;FBDV/iPhone9,3;FBMD/iPhone;FBSN/iOS;FBSV/13.3;FBSS/2;FBID/phone;FBLC/es_LA;FBOP/5]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('11', '179.7.194.140', '2019-12-19 12:11:51', 'Mozilla/5.0 (Linux; Android 9; POT-LX3 Build/HUAWEIPOT-L03; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.108 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/251.0.0.31.111;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('12', '190.239.95.35', '2019-12-19 01:25:08', 'Mozilla/5.0 (Linux; Android 7.0; LG-H840 Build/NRD90U; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.108 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/250.0.0.26.241;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('13', '190.239.95.35', '2019-12-19 01:26:04', 'Mozilla/5.0 (Linux; Android 7.0; LG-H840 Build/NRD90U; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.108 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/250.0.0.26.241;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('14', '181.67.2.90', '2019-12-20 09:34:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('15', '190.235.123.6', '2019-12-21 12:36:44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('16', '179.6.48.171', '2019-12-21 01:26:14', 'Mozilla/5.0 (Linux; Android 8.0.0; LDN-LX3 Build/HUAWEILDN-LX3; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.90 Mobile Safari/537.36 [FB_IAB/Orca-Android;FBAV/242.0.0.15.119;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('17', '45.173.72.6', '2019-12-21 09:22:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('18', '181.189.179.235', '2019-12-21 09:28:41', 'Mozilla/5.0 (Linux; Android 7.0; LG-M400 Build/NRD90U; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/63.0.3239.111 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/247.0.0.42.116;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('19', '177.241.52.117', '2019-12-22 01:09:22', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 8 Build/PKQ1.190616.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.93 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/251.0.0.31.111;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('20', '190.14.141.81', '2019-12-23 02:48:39', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36 OPR/65.0.3467.78', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('21', '190.14.141.81', '2019-12-23 02:51:00', 'Mozilla/5.0 (Linux; Android 5.1.1; SM-G930L) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.93 Mobile Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('22', '190.14.141.81', '2019-12-23 03:24:23', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36 OPR/65.0.3467.78', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('23', '190.14.141.81', '2019-12-23 03:24:54', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36 OPR/65.0.3467.78', '/sis/restaurant/index.php', 'MESERO123'), 
      ('24', '190.14.141.81', '2019-12-23 03:26:10', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36 OPR/65.0.3467.78', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('25', '179.6.204.130', '2019-12-23 07:22:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('26', '190.14.141.81', '2019-12-26 10:54:48', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36 OPR/65.0.3467.78', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('27', '190.14.141.81', '2019-12-26 10:56:12', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36 OPR/65.0.3467.78', '/sis/restaurant/index.php', 'ADMINISTRADOR'), 
      ('28', '190.14.141.81', '2019-12-26 10:56:31', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36 OPR/65.0.3467.78', '/sis/restaurant/index.php', 'MESERO123'), 
      ('29', '190.14.141.81', '2019-12-26 11:09:01', 'Mozilla/5.0 (Linux; Android 5.1.1; SM-G930L) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.93 Mobile Safari/537.36', '/sis/restaurant/index.php', 'MESERO123'), 
      ('30', '190.14.141.81', '2019-12-26 11:09:55', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/sis/restaurant/index.php', 'MESERO123'), 
      ('31', '190.14.141.81', '2019-12-26 11:11:51', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/sis/restaurant/index.php', 'MESERO123'), 
      ('32', '190.14.141.81', '2019-12-26 11:13:22', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/sis/restaurant/index.php', 'MESERO123'), 
      ('33', '190.14.141.81', '2019-12-26 11:15:24', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/sis/restaurant/index.php', 'MESERO123'), 
      ('34', '190.108.89.92', '2019-12-27 10:45:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '/sis/restaurant/index.php', 'MARBELLAPAREDES'), 
      ('35', '190.14.141.81', '2019-12-27 03:42:38', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('36', '190.14.141.81', '2019-12-27 03:43:04', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '/sis/restaurant/index.php', 'CAJERO123'), 
      ('37', '190.14.141.81', '2019-12-27 03:44:11', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('38', '186.185.131.52', '2020-01-14 02:13:30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('39', '200.57.158.66', '2020-01-14 02:15:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/18.17763', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('40', '187.243.57.141', '2020-01-14 03:41:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('41', '187.243.57.141', '2020-01-14 03:45:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('42', '187.243.57.141', '2020-01-14 03:48:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/sis/restaurant/index.php', 'ZXC'), 
      ('43', '187.243.57.141', '2020-01-14 03:49:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('44', '187.243.57.141', '2020-01-14 03:52:17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/sis/restaurant/index.php', 'DUA'), 
      ('45', '200.57.158.66', '2020-01-14 03:57:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/18.17763', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('46', '186.185.203.111', '2020-01-15 01:15:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('47', '186.185.249.214', '2020-01-16 02:27:16', 'Mozilla/5.0 (Linux; U; Android 4.1.2; es-es; V865M Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('48', '177.245.28.78', '2020-01-16 11:04:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/18.17763', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('49', '132.184.130.77', '2020-01-19 04:54:18', 'Mozilla/5.0 (Linux; Android 4.4.2; SM-G900FD) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.116 Mobile Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('50', '132.184.130.77', '2020-01-19 04:54:29', 'Mozilla/5.0 (Linux; Android 4.4.2; SM-G900FD) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.116 Mobile Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('51', '132.184.130.77', '2020-01-19 04:54:45', 'Mozilla/5.0 (Linux; Android 4.4.2; SM-G900FD) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.116 Mobile Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('52', '45.173.72.6', '2020-01-21 09:38:36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('53', '143.202.254.228', '2020-01-22 10:53:33', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('54', '190.130.243.133', '2020-01-28 09:18:03', 'Mozilla/5.0 (Linux; Android 9; SM-A750G Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.93 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/254.0.0.37.125;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('55', '190.104.21.240', '2020-01-28 09:23:16', 'Mozilla/5.0 (Linux; Android 8.1.0; SM-J710MN Build/M1AJQ; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.136 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/254.0.0.37.125;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('56', '186.11.79.86', '2020-01-28 10:21:31', 'Mozilla/5.0 (Linux; Android 9; SM-G950F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.136 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/255.0.0.33.121;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('57', '187.211.23.86', '2020-01-29 02:09:09', 'Mozilla/5.0 (Linux; Android 6.0.1; SM-J700M Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.89 Mobile Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('58', '187.211.23.86', '2020-01-29 02:09:11', 'Mozilla/5.0 (Linux; Android 6.0.1; SM-J700M Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.89 Mobile Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('59', '189.196.18.43', '2020-01-29 02:50:04', 'Mozilla/5.0 (Linux; Android 8.0.0; SAMSUNG SM-G930F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/10.2 Chrome/71.0.3578.99 Mobile Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('60', '190.239.70.225', '2020-01-29 08:34:47', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G570M Build/R16NW; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.79 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/250.0.0.26.241;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('61', '190.164.141.243', '2020-01-29 09:59:51', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 [FBAN/FBIOS;FBDV/iPhone9,4;FBMD/iPhone;FBSN/iOS;FBSV/13.3;FBSS/3;FBID/phone;FBLC/es_LA;FBOP/5;FBCR/movistar]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('62', '181.64.140.133', '2020-01-29 10:35:40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('63', '190.181.254.184', '2020-01-29 12:00:01', 'Mozilla/5.0 (Linux; Android 9; SNE-LX3 Build/HUAWEISNE-L23; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.136 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/254.0.0.37.125;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('64', '187.225.144.66', '2020-01-29 01:26:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('65', '190.106.196.253', '2020-01-30 12:07:00', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G930F Build/R16NW; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.136 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/255.0.0.33.121;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('66', '190.106.196.253', '2020-01-30 12:07:01', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G930F Build/R16NW; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.136 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/255.0.0.33.121;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('67', '143.255.104.21', '2020-01-30 12:39:58', 'Mozilla/5.0 (Linux; Android 9; moto g(6) play) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.136 Mobile Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('68', '200.68.129.134', '2020-01-30 01:31:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('69', '23.82.136.121', '2020-01-30 01:31:43', 'Mozilla/5.0 (Linux; Android 9; SM-A705MN Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.136 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/254.0.0.37.125;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('70', '23.82.136.121', '2020-01-30 01:32:10', 'Mozilla/5.0 (Linux; Android 9; SM-A705MN Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.136 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/254.0.0.37.125;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('71', '189.250.150.61', '2020-01-30 02:02:49', 'Mozilla/5.0 (Linux; Android 9; MAR-LX3A Build/HUAWEIMAR-L03A; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.136 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/254.0.0.37.125;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('72', '189.218.21.70', '2020-01-30 02:31:03', 'Mozilla/5.0 (Linux; Android 6.0.1; Redmi 3S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.136 Mobile Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('73', '200.68.129.113', '2020-01-30 03:35:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/sis/restaurant/index.php', 'CAJERO123'), 
      ('74', '181.188.138.36', '2020-01-30 08:39:49', 'Mozilla/5.0 (Linux; Android 6.0.1; SM-J106M Build/MMB29Q; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/55.0.2883.91 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/253.0.0.28.116;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('75', '191.88.235.39', '2020-01-30 10:50:13', 'Mozilla/5.0 (Linux; Android 8.1.0; SM-G610M Build/M1AJQ; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/75.0.3770.101 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/254.0.0.37.125;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('76', '132.191.3.136', '2020-01-31 12:32:27', 'Mozilla/5.0 (Linux; Android 9; Mi A2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.116 Mobile Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('77', '189.155.252.216', '2020-02-01 07:22:42', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('78', '189.155.252.216', '2020-02-01 07:23:17', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('79', '190.232.163.207', '2020-02-02 11:09:25', 'Mozilla/5.0 (Linux; Android 9; MRD-LX3 Build/HUAWEIMRD-LX3; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.136 Mobile Safari/537.36 [FB_IAB/Orca-Android;FBAV/249.0.0.10.122;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('80', '191.92.247.60', '2020-02-04 12:41:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('81', '200.68.128.182', '2020-02-05 04:38:48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('82', '181.138.61.112', '2020-02-14 08:38:46', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('83', '181.174.75.81', '2020-02-15 04:27:25', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('84', '186.185.153.36', '2020-02-15 05:18:55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('85', '186.185.193.11', '2020-02-15 09:09:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('86', '186.185.193.11', '2020-02-15 09:15:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('87', '181.199.52.205', '2020-02-15 11:19:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('88', '189.143.38.57', '2020-02-17 08:37:59', 'Mozilla/5.0 (Linux; Android 9; SM-A730F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/80.0.3987.99 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/257.0.0.44.118;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('89', '190.236.223.111', '2020-02-20 12:28:07', 'Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.116 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('90', '190.236.223.111', '2020-02-20 12:49:10', 'Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.116 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('91', '190.15.5.2', '2020-02-20 12:55:37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('92', '181.55.73.139', '2020-02-21 02:09:51', 'Mozilla/5.0 (Linux; Android 10; Infinix X604 Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/80.0.3987.117 Mobile Safari/537.36 [FB_IAB/Orca-Android;FBAV/251.0.0.12.117;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('93', '179.6.201.146', '2020-02-23 10:00:32', 'Mozilla/5.0 (Linux; Android 9; EML-L09 Build/HUAWEIEML-L09; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/80.0.3987.117 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/258.0.0.34.119;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('94', '179.6.201.146', '2020-02-23 10:01:24', 'Mozilla/5.0 (Linux; Android 9; EML-L09 Build/HUAWEIEML-L09; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/80.0.3987.117 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/258.0.0.34.119;]', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('95', '181.199.53.141', '2020-02-25 02:16:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('96', '181.199.53.141', '2020-02-25 03:13:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/restaurantsis/index.php', 'RUBENCHIRINOS'), 
      ('97', '190.236.204.203', '2020-02-28 11:10:28', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('98', '186.4.196.184', '2020-03-02 03:23:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('99', '179.6.201.215', '2020-03-04 01:14:59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('100', '181.188.213.116', '2020-03-06 09:53:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('101', '132.184.130.230', '2020-03-11 11:55:51', 'Mozilla/5.0 (Linux; Android 7.0; G3313) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('102', '190.236.223.111', '2020-03-26 07:17:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('103', '190.236.223.111', '2020-03-28 10:17:55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('104', '187.146.156.93', '2020-04-03 10:14:26', 'Mozilla/5.0 (Linux; Android 7.0; Redmi Note 4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.136 Mobile Safari/537.36', '/sis/restaurant/index.php', 'MESERO123'), 
      ('105', '200.118.62.152', '2020-04-13 08:26:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.92 Safari/537.36', '/sis/restaurant/index.php', 'RUBENCHIRINOS'), 
      ('106', '201.243.120.177', '2020-04-13 08:34:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', '/sis/restaurant/index.php', 'RUBENCHIRINOS');
COMMIT;

# | Vaciado de tabla 'medidas'
# +-------------------------------------
DROP TABLE IF EXISTS `medidas`;


# | Estructura de la tabla 'medidas'
# +-------------------------------------
CREATE TABLE `medidas` (
  `codmedida` int(11) NOT NULL AUTO_INCREMENT,
  `nommedida` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codmedida`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'medidas'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `medidas` (`codmedida`, `nommedida`) VALUES 
      ('1', 'KILOGRAMO'), 
      ('2', 'LITRO'), 
      ('3', 'GRAMO'), 
      ('4', 'UNIDAD');
COMMIT;

# | Vaciado de tabla 'mediospagos'
# +-------------------------------------
DROP TABLE IF EXISTS `mediospagos`;


# | Estructura de la tabla 'mediospagos'
# +-------------------------------------
CREATE TABLE `mediospagos` (
  `codmediopago` int(11) NOT NULL AUTO_INCREMENT,
  `mediopago` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codmediopago`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'mediospagos'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `mediospagos` (`codmediopago`, `mediopago`) VALUES 
      ('1', 'EFECTIVO'), 
      ('2', 'CHEQUE A FECHA'), 
      ('3', 'CHEQUE AL DIA'), 
      ('4', 'NOTA DE CREDITO'), 
      ('5', 'RED COMPRA'), 
      ('6', 'TRANSFERENCIA'), 
      ('7', 'TARJETA DE CREDITO'), 
      ('8', 'CUPON');
COMMIT;

# | Vaciado de tabla 'mesas'
# +-------------------------------------
DROP TABLE IF EXISTS `mesas`;


# | Estructura de la tabla 'mesas'
# +-------------------------------------
CREATE TABLE `mesas` (
  `codmesa` int(11) NOT NULL AUTO_INCREMENT,
  `codsala` int(11) NOT NULL,
  `nommesa` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `statusmesa` int(1) NOT NULL,
  PRIMARY KEY (`codmesa`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'mesas'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `mesas` (`codmesa`, `codsala`, `nommesa`, `fecha`, `statusmesa`) VALUES 
      ('1', '1', 'MESA 1', '2017-11-08', '1'), 
      ('2', '1', 'MESA 2', '2017-11-08', '0'), 
      ('4', '1', 'MESA 3', '2017-11-10', '0'), 
      ('5', '1', 'MESA 4', '2017-11-10', '0'), 
      ('6', '1', 'MESA 5', '2017-11-10', '0'), 
      ('7', '1', 'MESA 6', '2017-11-10', '0'), 
      ('8', '1', 'MESA 7', '2017-11-10', '0'), 
      ('9', '1', 'MESA 8', '2017-11-10', '0'), 
      ('10', '1', 'M # 1 DROG.', '2017-11-10', '0'), 
      ('11', '1', 'M # 2 DROG.', '2017-11-10', '0'), 
      ('12', '1', 'M # 1 ZAPA.', '2017-11-10', '0'), 
      ('13', '1', 'M # 2 ZAPA.', '2017-11-10', '0'), 
      ('14', '2', 'MESA 1', '2017-11-10', '0'), 
      ('15', '2', 'MESA 2', '2017-11-10', '0'), 
      ('16', '2', 'MESA 3', '2018-10-20', '1'), 
      ('17', '2', 'MESA 4', '2018-10-20', '0'), 
      ('18', '3', 'MESA 1', '2018-10-20', '0'), 
      ('19', '3', 'MESA 2', '2018-10-20', '0');
COMMIT;

# | Vaciado de tabla 'movimientoscajas'
# +-------------------------------------
DROP TABLE IF EXISTS `movimientoscajas`;


# | Estructura de la tabla 'movimientoscajas'
# +-------------------------------------
CREATE TABLE `movimientoscajas` (
  `codmovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `codcaja` int(11) NOT NULL,
  `tipomovimiento` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcionmovimiento` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montomovimiento` decimal(12,2) NOT NULL,
  `codmediopago` int(11) NOT NULL,
  `fechamovimiento` datetime NOT NULL,
  PRIMARY KEY (`codmovimiento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'movimientoscajas'
# +-------------------------------------

# | Vaciado de tabla 'productos'
# +-------------------------------------
DROP TABLE IF EXISTS `productos`;


# | Estructura de la tabla 'productos'
# +-------------------------------------
CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `preciocompra` decimal(12,2) NOT NULL,
  `precioventa` decimal(12,2) NOT NULL,
  `existencia` decimal(12,2) NOT NULL,
  `stockminimo` decimal(12,2) NOT NULL,
  `stockmaximo` decimal(12,2) NOT NULL,
  `ivaproducto` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descproducto` decimal(12,2) NOT NULL,
  `codigobarra` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `lote` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaelaboracion` date NOT NULL,
  `fechaexpiracion` date NOT NULL,
  `codproveedor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `stockteorico` int(10) NOT NULL,
  `motivoajuste` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `favorito` int(2) NOT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'productos'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `productos` (`idproducto`, `codproducto`, `producto`, `codcategoria`, `preciocompra`, `precioventa`, `existencia`, `stockminimo`, `stockmaximo`, `ivaproducto`, `descproducto`, `codigobarra`, `lote`, `fechaelaboracion`, `fechaexpiracion`, `codproveedor`, `stockteorico`, `motivoajuste`, `favorito`) VALUES 
      ('1', '1', 'LOMITO DE RES', '1', '10000.00', '11000.00', '49.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', 'P1', '0', 'NINGUNO', '0'), 
      ('2', '2', 'PECHUGA A LA PLANCHA', '1', '8000.00', '8800.00', '63.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('3', '3', 'LOMITO DE CERDO', '1', '9000.00', '9900.00', '77.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('4', '4', 'LOMITO DE CERDO ENCEBOLLADO Y GRATINADO', '1', '10400.00', '11440.00', '89.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('5', '5', 'LOMITO DE RES ENCEBOLLADO Y GRATINADO', '1', '11400.00', '12540.00', '94.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', 'P1', '0', 'NINGUNO', '0'), 
      ('6', '6', 'MIXTO', '1', '9000.00', '9900.00', '93.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('7', '7', 'LOMITO DE CERDO RANCHERO', '1', '12000.00', '13200.00', '95.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('8', '8', 'PUNTA DE ANCA', '1', '8000.00', '8800.00', '57.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('9', '9', 'CHURRASCO', '1', '8000.00', '8800.00', '93.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('10', '10', 'SUPER SUIZO', '2', '6000.00', '6600.00', '928.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('11', '11', 'MINI SUIZO', '2', '3000.00', '3300.00', '816.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('12', '12', 'BANDEJA 4 CARNES', '1', '12000.00', '13200.00', '92.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('13', '13', 'BANDEJA TRIFASICA', '1', '13000.00', '14300.00', '97.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('14', '14', 'BANDEJA 5 CARNES', '1', '16000.00', '17600.00', '94.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('15', '15', 'SUIZO ESPECIAL_POLLO', '2', '8000.00', '8800.00', '90.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('16', '16', 'SUIZO ESPECIAL_LOMITO', '2', '9000.00', '9900.00', '95.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('17', '17', 'SUIZO ESPECIAL_CERDO', '2', '8000.00', '8800.00', '95.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('18', '18', 'SUIZO, CHORIZO Y BUTIFARRA', '2', '6000.00', '6600.00', '99.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('19', '19', 'SUIZO CON TODO', '2', '11000.00', '12100.00', '89.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('20', '20', 'SUIZO RANCHERO', '2', '9000.00', '9900.00', '95.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('21', '21', 'SUIZO DONEBA', '2', '17000.00', '18700.00', '95.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('22', '22', 'SALCHIPAPA SENCILLA', '3', '4000.00', '4400.00', '881.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('23', '23', 'SALCHIPAPA CON POLLO', '3', '6800.00', '7480.00', '80.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('24', '24', 'SALCHIPAPA CHORIZO Y BUTIFARRA', '3', '6500.00', '7150.00', '85.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('25', '25', 'SALCHIPAPA CON LOMITO', '3', '7100.00', '7810.00', '97.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('26', '26', 'SALCHIPAPA CON CERDO', '3', '6900.00', '7590.00', '96.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('27', '27', 'SALCHIPAPA CON SUIZA', '3', '6800.00', '7480.00', '94.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('28', '28', 'SALCHIPAPA HAWAIANA', '3', '10900.00', '11990.00', '97.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('29', '29', 'SALCHIPAPA DONEBA', '3', '21100.00', '23210.00', '100.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('30', '30', 'PICADA DE POLLO', '4', '6000.00', '6600.00', '58.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('31', '31', 'PICADA DE LOMITO', '4', '6600.00', '7260.00', '93.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('32', '32', 'PICADA DE CERDO', '4', '6300.00', '6930.00', '91.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('33', '33', 'PICADA TRIFASICA', '4', '100.00', '110.00', '74.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('34', '34', 'PICADA MIXTA', '4', '6300.00', '6930.00', '59.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('35', '35', 'PICADA SUIZO, CHORIZO Y BUTIFARRA', '4', '6800.00', '7480.00', '86.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('36', '36', 'PICADA RANCHERA', '4', '5800.00', '6380.00', '87.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('37', '37', 'PICADA ESCOCESA', '4', '12100.00', '13310.00', '99.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('38', '38', 'PICADA POLLO 100 GRS. Y MAIZ', '4', '6300.00', '6930.00', '96.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('39', '39', 'PICADA DE POLLO 200 GRS. Y MAIZ', '4', '9000.00', '9900.00', '95.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('40', '40', 'PICADA HAWAIANA', '4', '8900.00', '9790.00', '95.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('41', '41', 'PICADA 4 CARNES', '4', '10200.00', '11220.00', '97.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('42', '42', 'PICADA CON TODO', '4', '11600.00', '12760.00', '81.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('43', '43', 'PICADA DONEBA', '4', '20000.00', '22000.00', '77.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('44', '44', 'MAIZ AMERICANO SENCILLO', '5', '4500.00', '4950.00', '84.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('45', '45', 'MAIZ CON SUIZO', '5', '5800.00', '6380.00', '91.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('46', '46', 'MAIZ CON POLLO', '5', '7800.00', '8580.00', '96.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('47', '47', 'MAIZ CON LOMITO', '5', '8100.00', '8910.00', '94.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('48', '48', 'MAIZ CON CERDO', '5', '7900.00', '8690.00', '100.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('49', '49', 'MAIZ RANCHERO', '5', '8300.00', '9130.00', '96.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('50', '50', 'MAIZ HAWAIANO', '5', '11900.00', '13090.00', '96.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('51', '51', 'MAIZ CON TODO', '5', '14700.00', '16170.00', '97.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('52', '52', 'MAIZ CON POLLO Y LOMITO', '5', '10800.00', '11880.00', '96.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('53', '53', 'MAIZ DONEBA', '5', '21100.00', '23210.00', '98.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('54', '54', 'HAMB. DE CARNE', '6', '300.00', '330.00', '52.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('55', '55', 'HAMB. DE POLLO', '6', '3000.00', '3300.00', '88.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('56', '56', 'HAMB. MIXTA', '6', '6000.00', '6600.00', '84.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('57', '57', 'HAMB. HAWAIANA', '6', '6000.00', '6600.00', '92.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('58', '58', 'HAMB. ESPECIAL', '6', '8000.00', '8800.00', '87.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('59', '59', 'HAMB. CARNE, CHORIZO Y BUTIFARRA', '6', '6000.00', '6600.00', '99.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('60', '60', 'HAMB. DONEBA', '6', '10000.00', '11000.00', '98.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('61', '61', 'HAMB. COMBO', '6', '7000.00', '7700.00', '89.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('62', '62', 'CHUZO DE POLLO', '7', '5000.00', '5500.00', '37.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('63', '63', 'CHUZO DE LOMITO', '7', '6000.00', '6600.00', '88.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('64', '64', 'CHUZO DE CERDO', '7', '6000.00', '6600.00', '96.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('65', '65', 'CHUZO DE POLLO Y LOMITO', '7', '5000.00', '5500.00', '88.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('66', '66', 'CHUZO DE POLLO GRATINADO', '7', '5900.00', '6490.00', '68.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('67', '67', 'CHUZO DE LOMITO GRATINADO', '7', '6900.00', '7590.00', '89.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('68', '68', 'PATACON CON POLLO', '9', '5000.00', '5500.00', '87.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('69', '69', 'PATACON CON LOMITO', '9', '6000.00', '6600.00', '98.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('70', '70', 'PATACON POLLO Y LOMITO', '9', '5800.00', '6380.00', '88.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('71', '71', 'PATACON POLLO Y RANCHERA', '9', '6000.00', '6600.00', '92.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('72', '72', 'PATACON POLLO Y CERDO', '9', '5700.00', '6270.00', '89.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('73', '73', 'PATACON CERDO Y RANCHERO', '9', '6200.00', '6820.00', '99.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('74', '74', 'PATACON CON CERDO', '9', '5800.00', '6380.00', '98.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('75', '75', 'PATACON SUIZO AL GRATIN', '9', '6900.00', '7590.00', '97.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('76', '76', 'PATACON TRIFASICO', '9', '8700.00', '9570.00', '93.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('77', '77', 'PATACON SUIZO, CHORIZO Y BUTIFARRA', '9', '6300.00', '6930.00', '100.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('78', '78', 'PATACON POLLO Y SUIZO', '9', '5500.00', '6050.00', '100.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('79', '79', 'PATACON LOMITO Y SUIZO', '9', '5800.00', '6380.00', '99.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('80', '80', 'PATACON LOMITO Y RANCHERA', '9', '5700.00', '6270.00', '98.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('81', '81', 'PATACON CERDO Y SUIZO', '9', '5000.00', '5500.00', '91.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('82', '82', 'PATACON CHORIZO Y BUTIFARRA', '9', '5000.00', '5500.00', '98.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('83', '83', 'PATACON HAWAIANA', '9', '6900.00', '7590.00', '98.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('84', '84', 'PATACON ESCOCES', '9', '10300.00', '11330.00', '95.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('85', '85', 'PATACON CON TODO', '9', '11200.00', '12320.00', '92.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('86', '86', 'PATACON DONEBA', '9', '20000.00', '22000.00', '100.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('87', '87', 'GASEOSA 400', '10', '1300.00', '1430.00', '194.00', '5.00', '50.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', 'P4', '0', 'NINGUNO', '0'), 
      ('88', '88', 'GASEOSA 1.5', '10', '2500.00', '2750.00', '103.00', '5.00', '50.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', 'P6', '0', 'NINGUNO', '0'), 
      ('89', '89', 'GASEOSA 2.5', '10', '10.12', '22.12', '178.00', '5.00', '5.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', 'P1', '0', 'NINGUNO', '0'), 
      ('90', '90', 'MT TEE', '10', '1525.00', '1677.50', '8.00', '5.00', '5.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('91', '91', 'AGUA BOTELLA', '10', '1200.00', '1320.00', '146.00', '5.00', '6.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('92', '92', 'HIT 500 ML', '10', '1525.00', '1677.50', '112.00', '5.00', '50.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('93', '93', 'CERVEZA LIGTH', '10', '2000.00', '2200.00', '150.00', '5.00', '1.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('94', '94', 'CERVEZA AGUILA NEGRA', '10', '1800.00', '1980.00', '115.00', '5.00', '0.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('95', '95', 'H2O', '10', '1525.00', '1677.50', '16.00', '5.00', '5.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('96', '96', 'BRETA?A', '10', '1300.00', '1430.00', '25.00', '5.00', '6.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('97', '97', 'GATORADE', '10', '2050.00', '2255.00', '61.00', '5.00', '5.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', 'P6', '0', 'NINGUNO', '0'), 
      ('98', '98', 'HIT CAJA', '10', '900.00', '990.00', '26.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('99', '99', 'PAPAS A LA FRACESA', '11', '1100.00', '1210.00', '37.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('100', '100', ' PORCION MAIZ', '11', '1300.00', '1430.00', '78.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('101', '101', 'PORCION DE POLLO', '11', '4000.00', '4400.00', '94.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('102', '102', 'PORCION DE LOMITO', '11', '5000.00', '5500.00', '97.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('103', '103', 'BUTIFARRA', '11', '450.00', '495.00', '91.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('104', '104', 'RANCHERA', '11', '1050.00', '1155.00', '98.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('105', '105', 'CHORIZO', '11', '1000.00', '1100.00', '99.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('106', '106', 'TOCINETA', '11', '800.00', '880.00', '94.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('107', '107', 'SUIZA', '11', '1050.00', '1155.00', '100.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('108', '108', 'MOZARELLA', '11', '300.00', '330.00', '38.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('109', '109', 'PERRO SENCILLO', '8', '2000.00', '2200.00', '966.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('110', '110', 'PERRO SUPER DONEBA', '8', '3000.00', '3300.00', '77.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('111', '111', 'PERRO AMERICANO', '8', '4000.00', '4400.00', '94.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('112', '112', 'PERRO SUIZO', '8', '5000.00', '5500.00', '99.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('113', '113', 'PERRO ITALO SUIZO', '8', '7000.00', '7700.00', '96.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('114', '114', 'PERRO SUICITO', '8', '3000.00', '3300.00', '99.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('115', '115', 'PERRO CON TOCINETA', '8', '2500.00', '2750.00', '97.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('116', '116', 'PERRO RANCHERO', '8', '3500.00', '3850.00', '90.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('117', '117', 'PERRO ITALO RANCHERO', '8', '5000.00', '5500.00', '90.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('118', '118', 'PERRO CHORIPERRO', '8', '3500.00', '3850.00', '100.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('119', '119', 'PERRO BUTIPERRO', '8', '4500.00', '4950.00', '97.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('120', '120', 'PERRO CON POLLO', '8', '3800.00', '4180.00', '98.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('121', '122', 'PERRO CON CERDO', '8', '3500.00', '3850.00', '100.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('122', '123', 'PERRO GEMELO', '8', '3500.00', '3850.00', '100.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('123', '124', 'PERRO HAWAIANO', '8', '3500.00', '3850.00', '99.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('124', '125', 'PERRO ITALIANO', '8', '2000.00', '2200.00', '99.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('125', '126', 'PERRO MIX', '8', '6000.00', '6600.00', '96.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('126', '127', 'PERRO TRIFASICO', '8', '9000.00', '9900.00', '100.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('127', '128', 'PERRO SALVAJE DONEBA', '8', '9500.00', '10450.00', '100.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('128', '129', 'PERRO COMBO', '8', '5000.00', '5500.00', '99.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('129', '130', 'PERRO SUIZO, CHORIZO Y BUTIFARRA', '8', '5000.00', '5500.00', '100.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('130', '131', 'PERRA', '8', '10000.00', '11000.00', '94.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('131', '132', 'TRABAJADOR', '11', '1000.00', '1100.00', '77.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('132', '133', 'DOMICILIO', '11', '1000.00', '1100.00', '96.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('133', '134', 'JAMON', '11', '300.00', '330.00', '97.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('134', '135', 'PORCION DE CERDO', '11', '1900.00', '2090.00', '98.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0'), 
      ('135', '136', 'PERRO CON LOMITO', '8', '4000.00', '4400.00', '99.00', '5.00', '10.00', 'NO', '0.00', '0', '0', '0000-00-00', '0000-00-00', '0', '0', 'NINGUNO', '0');
COMMIT;

# | Vaciado de tabla 'productosxingredientes'
# +-------------------------------------
DROP TABLE IF EXISTS `productosxingredientes`;


# | Estructura de la tabla 'productosxingredientes'
# +-------------------------------------
CREATE TABLE `productosxingredientes` (
  `codagrega` int(11) NOT NULL AUTO_INCREMENT,
  `codproducto` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codingrediente` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantracion` decimal(5,2) NOT NULL,
  PRIMARY KEY (`codagrega`)
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'productosxingredientes'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `productosxingredientes` (`codagrega`, `codproducto`, `codingrediente`, `cantracion`) VALUES 
      ('1', '4', '1', '1.00'), 
      ('2', '4', '4', '1.00'), 
      ('5', '4', '13', '2.00'), 
      ('9', '6', '1', '1.00'), 
      ('10', '6', '5', '0.50'), 
      ('11', '6', '2', '0.50'), 
      ('12', '7', '1', '1.00'), 
      ('13', '7', '4', '1.00'), 
      ('14', '7', '9', '1.00'), 
      ('15', '8', '1', '1.00'), 
      ('16', '8', '27', '1.00'), 
      ('17', '9', '1', '1.00'), 
      ('18', '9', '28', '1.00'), 
      ('19', '10', '1', '1.00'), 
      ('20', '10', '8', '1.00'), 
      ('21', '11', '1', '0.50'), 
      ('22', '11', '8', '0.50'), 
      ('25', '12', '11', '0.50'), 
      ('26', '12', '3', '1.00'), 
      ('27', '12', '5', '0.50'), 
      ('28', '12', '2', '0.50'), 
      ('29', '12', '1', '1.00'), 
      ('30', '2', '5', '1.00'), 
      ('31', '2', '1', '1.00'), 
      ('32', '13', '5', '0.50'), 
      ('33', '13', '2', '0.50'), 
      ('34', '13', '4', '0.50'), 
      ('35', '13', '1', '1.00'), 
      ('36', '14', '1', '1.00'), 
      ('37', '14', '2', '0.50'), 
      ('38', '14', '4', '0.50'), 
      ('39', '14', '5', '0.50'), 
      ('40', '14', '11', '0.50'), 
      ('41', '14', '3', '1.00'), 
      ('42', '15', '8', '0.50'), 
      ('43', '15', '21', '0.50'), 
      ('44', '15', '1', '1.00'), 
      ('45', '16', '8', '0.50'), 
      ('46', '16', '22', '0.50'), 
      ('47', '16', '1', '1.00'), 
      ('48', '17', '1', '1.00'), 
      ('49', '17', '8', '0.50'), 
      ('50', '17', '23', '0.50'), 
      ('51', '18', '1', '1.00'), 
      ('52', '18', '8', '0.50'), 
      ('53', '18', '11', '0.50'), 
      ('54', '18', '3', '1.00'), 
      ('55', '19', '1', '1.00'), 
      ('56', '19', '8', '0.50'), 
      ('57', '19', '21', '0.50'), 
      ('58', '19', '22', '0.50'), 
      ('59', '19', '11', '0.50'), 
      ('60', '19', '3', '1.00'), 
      ('61', '20', '1', '1.00'), 
      ('62', '20', '8', '0.50'), 
      ('63', '20', '9', '1.00'), 
      ('64', '20', '14', '1.00'), 
      ('65', '20', '12', '1.00'), 
      ('66', '21', '1', '1.00'), 
      ('67', '21', '8', '0.50'), 
      ('68', '21', '21', '0.50'), 
      ('69', '21', '22', '0.50'), 
      ('70', '21', '23', '0.50'), 
      ('71', '21', '3', '1.00'), 
      ('72', '21', '15', '0.50'), 
      ('73', '21', '9', '1.00'), 
      ('74', '22', '1', '1.00'), 
      ('75', '22', '10', '1.00'), 
      ('76', '23', '1', '1.00'), 
      ('77', '23', '10', '1.00'), 
      ('78', '23', '21', '0.50'), 
      ('79', '24', '1', '1.00'), 
      ('80', '24', '10', '1.00'), 
      ('81', '24', '11', '0.50'), 
      ('82', '24', '3', '1.00'), 
      ('83', '25', '1', '1.00'), 
      ('84', '25', '10', '1.00'), 
      ('85', '25', '22', '0.50'), 
      ('86', '26', '1', '1.00'), 
      ('87', '26', '23', '0.50'), 
      ('88', '26', '10', '1.00'), 
      ('89', '27', '1', '1.00'), 
      ('90', '27', '10', '1.00'), 
      ('91', '27', '8', '0.50'), 
      ('92', '28', '1', '1.00'), 
      ('93', '28', '10', '1.00'), 
      ('94', '28', '12', '1.00'), 
      ('95', '28', '14', '1.00'), 
      ('96', '28', '13', '2.00'), 
      ('97', '29', '8', '0.50'), 
      ('98', '30', '1', '1.00'), 
      ('99', '30', '21', '1.00'), 
      ('100', '31', '1', '1.00'), 
      ('101', '31', '22', '1.00'), 
      ('102', '32', '1', '1.00'), 
      ('103', '32', '23', '1.00'), 
      ('104', '33', '1', '1.00'), 
      ('105', '33', '22', '0.50'), 
      ('106', '33', '21', '0.50'), 
      ('107', '33', '23', '0.50'), 
      ('108', '34', '1', '1.00'), 
      ('109', '34', '21', '0.50'), 
      ('110', '34', '23', '0.50'), 
      ('111', '35', '1', '1.00'), 
      ('112', '35', '8', '0.50'), 
      ('113', '35', '11', '0.50'), 
      ('114', '35', '3', '1.00'), 
      ('115', '36', '1', '1.00'), 
      ('116', '36', '9', '1.00'), 
      ('117', '37', '21', '0.50'), 
      ('118', '37', '22', '0.50'), 
      ('119', '37', '8', '0.50'), 
      ('120', '37', '15', '0.50'), 
      ('121', '38', '1', '1.00'), 
      ('122', '38', '15', '0.50'), 
      ('123', '38', '21', '0.50'), 
      ('124', '39', '1', '1.00'), 
      ('125', '39', '15', '0.50'), 
      ('126', '39', '21', '1.00'), 
      ('127', '40', '1', '1.00'), 
      ('128', '40', '21', '0.50'), 
      ('129', '40', '23', '0.50'), 
      ('130', '40', '14', '1.00'), 
      ('131', '40', '12', '1.00'), 
      ('132', '40', '13', '2.00'), 
      ('133', '41', '1', '1.00'), 
      ('134', '41', '22', '0.50'), 
      ('135', '41', '21', '0.50'), 
      ('136', '41', '11', '0.50'), 
      ('137', '41', '3', '1.00'), 
      ('138', '42', '1', '1.00'), 
      ('139', '42', '22', '0.50'), 
      ('140', '42', '21', '0.50'), 
      ('141', '42', '8', '0.50'), 
      ('142', '42', '3', '1.00'), 
      ('143', '42', '11', '0.50'), 
      ('144', '43', '1', '1.00'), 
      ('145', '43', '21', '0.50'), 
      ('146', '43', '22', '0.50'), 
      ('147', '43', '23', '0.50'), 
      ('148', '43', '8', '0.50'), 
      ('149', '43', '11', '0.50'), 
      ('150', '43', '3', '1.00'), 
      ('151', '43', '9', '1.00'), 
      ('152', '43', '15', '0.50'), 
      ('153', '44', '15', '1.00'), 
      ('154', '45', '15', '1.00'), 
      ('155', '45', '8', '0.50'), 
      ('156', '46', '15', '1.00'), 
      ('157', '46', '21', '0.50'), 
      ('158', '47', '15', '1.00'), 
      ('159', '47', '22', '0.50'), 
      ('160', '48', '23', '0.50'), 
      ('161', '49', '15', '1.00'), 
      ('162', '49', '9', '1.00'), 
      ('163', '50', '15', '1.00'), 
      ('164', '50', '14', '1.00'), 
      ('165', '50', '12', '1.00'), 
      ('166', '50', '9', '1.00'), 
      ('167', '50', '13', '2.00'), 
      ('168', '51', '15', '1.00'), 
      ('169', '51', '21', '0.50'), 
      ('170', '51', '22', '0.50'), 
      ('171', '51', '3', '1.00'), 
      ('172', '51', '11', '0.50'), 
      ('173', '52', '15', '1.00'), 
      ('174', '52', '21', '0.50'), 
      ('175', '52', '22', '0.50'), 
      ('176', '53', '15', '1.00'), 
      ('177', '53', '21', '0.50'), 
      ('178', '53', '22', '0.50'), 
      ('179', '53', '23', '0.50'), 
      ('180', '53', '8', '0.50'), 
      ('181', '53', '3', '1.00'), 
      ('182', '53', '9', '1.00'), 
      ('183', '54', '19', '1.00'), 
      ('184', '54', '17', '1.00'), 
      ('185', '54', '13', '1.00'), 
      ('186', '55', '20', '1.00'), 
      ('187', '55', '17', '1.00'), 
      ('188', '55', '13', '1.00'), 
      ('189', '56', '17', '1.00'), 
      ('190', '56', '19', '1.00'), 
      ('191', '56', '20', '1.00'), 
      ('192', '56', '13', '1.00'), 
      ('193', '57', '17', '1.00'), 
      ('194', '57', '19', '1.00'), 
      ('195', '57', '14', '1.00'), 
      ('196', '57', '12', '1.00'), 
      ('197', '57', '13', '1.00'), 
      ('198', '58', '17', '1.00'), 
      ('199', '58', '19', '1.00'), 
      ('200', '58', '20', '1.00'), 
      ('201', '58', '14', '1.00'), 
      ('202', '58', '12', '1.00'), 
      ('203', '58', '13', '1.00'), 
      ('204', '59', '17', '1.00'), 
      ('205', '59', '19', '1.00'), 
      ('206', '59', '11', '0.50'), 
      ('207', '59', '3', '1.00'), 
      ('208', '60', '17', '1.00'), 
      ('209', '60', '19', '1.00'), 
      ('210', '60', '12', '1.00'), 
      ('211', '60', '3', '1.00'), 
      ('212', '60', '11', '0.50'), 
      ('213', '60', '20', '1.00'), 
      ('214', '60', '13', '1.00'), 
      ('215', '61', '17', '1.00'), 
      ('216', '61', '19', '1.00'), 
      ('217', '61', '13', '1.00'), 
      ('218', '61', '1', '1.00'), 
      ('219', '62', '24', '1.00'), 
      ('220', '62', '1', '1.00'), 
      ('221', '63', '25', '1.00'), 
      ('222', '63', '1', '1.00'), 
      ('223', '64', '26', '1.00'), 
      ('224', '64', '1', '1.00'), 
      ('225', '65', '1', '1.00'), 
      ('226', '65', '24', '0.50'), 
      ('227', '65', '25', '0.50'), 
      ('228', '66', '1', '1.00'), 
      ('229', '66', '24', '1.00'), 
      ('230', '66', '13', '2.00'), 
      ('231', '67', '1', '1.00'), 
      ('232', '67', '25', '1.00'), 
      ('233', '67', '13', '2.00'), 
      ('234', '68', '18', '1.00'), 
      ('235', '68', '21', '1.00'), 
      ('236', '69', '18', '1.00'), 
      ('237', '69', '22', '1.00'), 
      ('238', '70', '18', '1.00'), 
      ('239', '70', '21', '0.50'), 
      ('240', '70', '22', '0.50'), 
      ('241', '71', '18', '1.00'), 
      ('242', '71', '21', '0.50'), 
      ('243', '71', '9', '1.00'), 
      ('244', '72', '18', '1.00'), 
      ('245', '72', '21', '0.50'), 
      ('246', '72', '23', '0.50'), 
      ('247', '73', '18', '1.00'), 
      ('248', '73', '23', '0.50'), 
      ('249', '73', '9', '1.00'), 
      ('250', '74', '18', '1.00'), 
      ('251', '74', '23', '1.00'), 
      ('252', '75', '18', '1.00'), 
      ('253', '75', '8', '1.00'), 
      ('254', '75', '13', '2.00'), 
      ('255', '76', '18', '1.00'), 
      ('256', '76', '21', '0.50'), 
      ('257', '76', '22', '0.50'), 
      ('258', '76', '23', '0.50'), 
      ('259', '77', '18', '1.00'), 
      ('260', '77', '8', '0.50'), 
      ('261', '77', '11', '0.50'), 
      ('262', '77', '3', '1.00'), 
      ('263', '78', '18', '1.00'), 
      ('264', '78', '21', '0.50'), 
      ('265', '78', '8', '0.50'), 
      ('266', '79', '18', '1.00'), 
      ('267', '79', '22', '0.50'), 
      ('268', '79', '8', '0.50'), 
      ('269', '80', '18', '1.00'), 
      ('270', '80', '22', '0.50'), 
      ('271', '80', '9', '1.00'), 
      ('272', '81', '18', '1.00'), 
      ('273', '81', '23', '0.50'), 
      ('274', '81', '8', '0.50'), 
      ('275', '82', '18', '1.00'), 
      ('276', '82', '11', '1.00'), 
      ('277', '82', '3', '2.00'), 
      ('278', '83', '18', '1.00'), 
      ('279', '83', '13', '2.00'), 
      ('280', '83', '12', '1.00'), 
      ('281', '83', '14', '1.00'), 
      ('282', '83', '21', '0.50'), 
      ('283', '84', '18', '1.00'), 
      ('284', '84', '15', '0.50'), 
      ('285', '84', '21', '0.50'), 
      ('286', '84', '22', '0.50'), 
      ('287', '85', '18', '1.00'), 
      ('288', '85', '22', '0.50'), 
      ('289', '85', '21', '0.50'), 
      ('290', '85', '3', '1.00'), 
      ('291', '85', '11', '0.50'), 
      ('292', '85', '8', '0.50'), 
      ('293', '86', '18', '1.00'), 
      ('294', '86', '21', '0.50'), 
      ('295', '86', '22', '0.50'), 
      ('296', '86', '23', '0.50'), 
      ('297', '86', '8', '0.50'), 
      ('298', '86', '11', '0.50'), 
      ('299', '86', '3', '1.00'), 
      ('300', '86', '9', '1.00'), 
      ('301', '86', '15', '0.50'), 
      ('302', '99', '1', '1.00'), 
      ('303', '100', '15', '0.50'), 
      ('304', '101', '21', '0.50'), 
      ('305', '102', '22', '0.50'), 
      ('306', '103', '3', '1.00'), 
      ('307', '104', '9', '1.00');
COMMIT;
INSERT IGNORE INTO `productosxingredientes` (`codagrega`, `codproducto`, `codingrediente`, `cantracion`) VALUES 
      ('308', '105', '11', '1.00'), 
      ('309', '106', '14', '1.00'), 
      ('310', '107', '8', '0.50'), 
      ('311', '108', '13', '1.00'), 
      ('312', '109', '16', '1.00'), 
      ('313', '109', '6', '1.00'), 
      ('314', '109', '13', '1.00'), 
      ('315', '110', '16', '1.00'), 
      ('316', '110', '7', '1.00'), 
      ('317', '110', '13', '1.00'), 
      ('318', '110', '12', '1.00'), 
      ('319', '111', '16', '1.00'), 
      ('320', '111', '8', '0.50'), 
      ('321', '111', '13', '1.00'), 
      ('322', '112', '16', '1.00'), 
      ('323', '112', '8', '1.00'), 
      ('324', '112', '13', '1.00'), 
      ('325', '113', '16', '1.00'), 
      ('326', '113', '8', '1.00'), 
      ('327', '113', '14', '1.00'), 
      ('328', '113', '12', '1.00'), 
      ('329', '113', '13', '1.00'), 
      ('330', '114', '16', '1.00'), 
      ('331', '114', '8', '0.50'), 
      ('332', '114', '13', '1.00'), 
      ('333', '115', '16', '1.00'), 
      ('334', '115', '14', '1.00'), 
      ('335', '115', '13', '1.00'), 
      ('336', '116', '16', '1.00'), 
      ('337', '116', '9', '1.00'), 
      ('338', '116', '13', '1.00'), 
      ('339', '116', '12', '1.00'), 
      ('340', '117', '16', '1.00'), 
      ('341', '117', '9', '1.00'), 
      ('342', '117', '14', '1.00'), 
      ('343', '117', '12', '1.00'), 
      ('344', '117', '13', '1.00'), 
      ('345', '118', '16', '1.00'), 
      ('346', '118', '11', '0.50'), 
      ('347', '118', '13', '1.00'), 
      ('348', '119', '16', '1.00'), 
      ('349', '119', '3', '1.00'), 
      ('350', '119', '13', '1.00'), 
      ('351', '120', '16', '1.00'), 
      ('352', '120', '21', '0.50'), 
      ('353', '120', '13', '1.00'), 
      ('354', '121', '16', '1.00'), 
      ('355', '121', '22', '0.50'), 
      ('356', '121', '13', '1.00'), 
      ('357', '122', '16', '1.00'), 
      ('358', '122', '23', '0.50'), 
      ('359', '122', '13', '1.00'), 
      ('360', '123', '16', '1.00'), 
      ('361', '123', '6', '2.00'), 
      ('362', '123', '13', '2.00'), 
      ('363', '124', '16', '1.00'), 
      ('364', '124', '14', '1.00'), 
      ('365', '124', '12', '1.00'), 
      ('366', '124', '13', '1.00'), 
      ('367', '125', '16', '1.00'), 
      ('368', '125', '12', '1.00'), 
      ('369', '125', '13', '1.00'), 
      ('370', '126', '16', '1.00'), 
      ('371', '126', '21', '0.50'), 
      ('372', '126', '22', '0.50'), 
      ('373', '126', '13', '1.00'), 
      ('374', '127', '16', '1.00'), 
      ('375', '127', '21', '0.50'), 
      ('376', '127', '22', '0.50'), 
      ('377', '127', '23', '0.50'), 
      ('378', '127', '13', '1.00'), 
      ('379', '128', '16', '1.00'), 
      ('380', '128', '21', '0.50'), 
      ('381', '128', '22', '0.50'), 
      ('382', '128', '11', '0.50'), 
      ('383', '128', '6', '1.00'), 
      ('384', '128', '13', '2.00'), 
      ('385', '129', '16', '1.00'), 
      ('386', '129', '6', '1.00'), 
      ('387', '129', '13', '1.00'), 
      ('388', '129', '1', '1.00'), 
      ('389', '130', '16', '1.00'), 
      ('390', '130', '13', '1.00'), 
      ('391', '130', '8', '0.50'), 
      ('392', '130', '11', '0.50'), 
      ('393', '130', '3', '1.00'), 
      ('394', '131', '16', '1.00'), 
      ('395', '131', '14', '7.00'), 
      ('396', '131', '13', '1.00'), 
      ('397', '134', '12', '1.00'), 
      ('398', '135', '23', '0.50'), 
      ('399', '29', '1', '1.00'), 
      ('400', '29', '9', '1.00'), 
      ('401', '29', '21', '0.50'), 
      ('402', '29', '22', '0.50'), 
      ('403', '29', '11', '0.50'), 
      ('404', '29', '3', '1.00'), 
      ('405', '29', '23', '0.50'), 
      ('406', '29', '15', '0.50'), 
      ('407', '29', '10', '1.00'), 
      ('408', '37', '1', '1.00'), 
      ('409', '48', '15', '1.00'), 
      ('410', '53', '11', '0.50'), 
      ('411', '59', '13', '1.00'), 
      ('412', '60', '14', '1.00'), 
      ('413', '111', '6', '1.00'), 
      ('414', '115', '6', '1.00'), 
      ('415', '118', '6', '1.00'), 
      ('416', '119', '6', '1.00'), 
      ('417', '120', '6', '1.00'), 
      ('418', '122', '6', '1.00'), 
      ('419', '124', '6', '1.00'), 
      ('420', '125', '6', '1.00'), 
      ('421', '3', '4', '1.00'), 
      ('422', '3', '1', '1.00'), 
      ('423', '136', '16', '1.00'), 
      ('424', '136', '22', '0.50'), 
      ('425', '136', '6', '1.00'), 
      ('426', '136', '13', '1.00'), 
      ('431', '1', '1', '1.50'), 
      ('432', '1', '22', '1.50'), 
      ('433', '5', '1', '1.00'), 
      ('434', '5', '2', '1.00'), 
      ('435', '5', '13', '2.00');
COMMIT;

# | Vaciado de tabla 'proveedores'
# +-------------------------------------
DROP TABLE IF EXISTS `proveedores`;


# | Estructura de la tabla 'proveedores'
# +-------------------------------------
CREATE TABLE `proveedores` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `codproveedor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `documproveedor` int(11) NOT NULL,
  `cuitproveedor` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomproveedor` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tlfproveedor` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_provincia` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `direcproveedor` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emailproveedor` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `vendedor` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tlfvendedor` varchar(20) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `fechaingreso` date NOT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'proveedores'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `proveedores` (`idproveedor`, `codproveedor`, `documproveedor`, `cuitproveedor`, `nomproveedor`, `tlfproveedor`, `id_provincia`, `id_departamento`, `direcproveedor`, `emailproveedor`, `vendedor`, `tlfvendedor`, `fechaingreso`) VALUES 
      ('1', 'P1', '3', '71261097-1', 'CASA FRICAR', '(314) 5969694', '0', '0', 'MONTERIA', 'CASAFRICAR@HOTMAIL.COM', 'FERNEY', '(0425) 4377645', '2019-10-22'), 
      ('2', 'P2', '3', '43417696-3', 'DEPOSITO AL MAR', '(3665) 7354563', '0', '0', 'CLL COTIZADA NECOCLI', 'DEPOSITOALMAR@HOTMAIL.COM', 'PALOMO', '(6582) 9873456', '2019-10-22'), 
      ('3', 'P3', '3', '1045507345-8', 'DISTRIFODS LA GRANJA', '(0412) 7652345', '0', '0', 'APARTADO ANTIOQUIA', 'DISTRIFODSLAGRANJA@HOTMAIL.COM', 'JAMES', '(0254) 3623456', '2019-10-22'), 
      ('4', 'P4', '3', '890903939-5', 'POSTOBON', '(4142) 6554345', '0', '0', 'CHIGORODO', 'POSTOBON@HOTMAIL.COM', 'JUAN DAVID', '(0885) 2436637', '2019-10-22'), 
      ('5', 'P5', '3', '1027953891-4', 'PORKY CARNE LA LIGA', '(9854) 2534566', '0', '0', 'NECOCLI - ANTIOQUIA', 'PORKY@HOTMAIL.COM', 'ANDREA JARAMILLO', '(4126) 5737445', '2019-10-22'), 
      ('6', 'P6', '3', '900430430-3', 'AGUILA GRUPO EMPRESARIAL S.A.S.', '(9887) 6554263', '0', '0', 'MONTERIA - CORDOBA', 'GRUPOAGUILA@HOTMAIL.COM', 'ADRIANA', '(9665) 3426653', '2019-10-22'), 
      ('7', 'P7', '3', '1039086972', 'EXPENDIO DE CARNES', '(4246) 6524343', '0', '0', 'PLAZA DE MERCADO', 'GERMAN@GMAIL.COM', 'GERMAN', '(0414) 5426637', '2019-10-22'), 
      ('8', 'P8', '3', '901022172-1', 'SOLANO ESCUDERO SAS', '(0412) 4546277', '0', '0', 'K1 VIA APARATADO', 'SOLANO@HOTMAIL.COM', 'EDER FLOREZ', '(0414) 5542536', '2019-10-22');
COMMIT;

# | Vaciado de tabla 'provincias'
# +-------------------------------------
DROP TABLE IF EXISTS `provincias`;


# | Estructura de la tabla 'provincias'
# +-------------------------------------
CREATE TABLE `provincias` (
  `id_provincia` int(10) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'provincias'
# +-------------------------------------

# | Vaciado de tabla 'salas'
# +-------------------------------------
DROP TABLE IF EXISTS `salas`;


# | Estructura de la tabla 'salas'
# +-------------------------------------
CREATE TABLE `salas` (
  `codsala` int(11) NOT NULL AUTO_INCREMENT,
  `nomsala` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`codsala`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'salas'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `salas` (`codsala`, `nomsala`, `fecha`) VALUES 
      ('1', 'SALA PRINCIPAL', '2017-11-08'), 
      ('2', 'SALA SECUNDARIA', '2017-11-08'), 
      ('3', 'SALA BALCON', '2018-10-19');
COMMIT;

# | Vaciado de tabla 'tiposcambio'
# +-------------------------------------
DROP TABLE IF EXISTS `tiposcambio`;


# | Estructura de la tabla 'tiposcambio'
# +-------------------------------------
CREATE TABLE `tiposcambio` (
  `codcambio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcioncambio` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montocambio` decimal(12,3) NOT NULL,
  `codmoneda` int(11) NOT NULL,
  `fechacambio` date NOT NULL,
  PRIMARY KEY (`codcambio`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'tiposcambio'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `tiposcambio` (`codcambio`, `descripcioncambio`, `montocambio`, `codmoneda`, `fechacambio`) VALUES 
      ('1', 'DOLAR PAGINA', '20600.000', '1', '2019-09-05');
COMMIT;

# | Vaciado de tabla 'tiposmoneda'
# +-------------------------------------
DROP TABLE IF EXISTS `tiposmoneda`;


# | Estructura de la tabla 'tiposmoneda'
# +-------------------------------------
CREATE TABLE `tiposmoneda` (
  `codmoneda` int(11) NOT NULL AUTO_INCREMENT,
  `moneda` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `siglas` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `simbolo` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codmoneda`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'tiposmoneda'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `tiposmoneda` (`codmoneda`, `moneda`, `siglas`, `simbolo`) VALUES 
      ('1', 'US DOLLAR', 'USD', '$'), 
      ('2', 'EURO', 'EUR', '&euro;'), 
      ('3', 'PESO CHILENO', 'CLP', '$'), 
      ('4', 'DOLAR CANADIENSE', 'CAD', '$'), 
      ('5', 'QUETZAL', 'GTQ', 'Q'), 
      ('6', 'DOLAR BELIZE', 'BZD', 'B'), 
      ('7', 'SOLES', 'SOL', 'S/.'), 
      ('8', 'BOLIVAR SOBERANO', 'BS', 'BS. ');
COMMIT;

# | Vaciado de tabla 'usuarios'
# +-------------------------------------
DROP TABLE IF EXISTS `usuarios`;


# | Estructura de la tabla 'usuarios'
# +-------------------------------------
CREATE TABLE `usuarios` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombres` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sexo` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nivel` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `status` int(2) NOT NULL,
  `comision` float(12,2) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'usuarios'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `usuarios` (`codigo`, `dni`, `nombres`, `sexo`, `direccion`, `telefono`, `email`, `usuario`, `password`, `nivel`, `status`, `comision`) VALUES 
      ('1', '18633174', 'RUBEN DARIO CHIRINOS RODRIGUEZ', 'MASCULINO', 'SANTA CRUZ DE MORA', '04147225970', 'ELSAIYA@GMAIL.COM', 'RUBENCHIRINOS', '3ee657cddb83008a70c1701814c36989456c64e6', 'ADMINISTRADOR(A)', '1', '0.00'), 
      ('2', '16317737', 'MARBELLA PAREDES MARQUEZ', 'FEMENINO', 'SANTA CRUZ DE MORA', '(0412) 6439052', 'PAREDESMARQEUZMARBELLA@GMAIL.COM', 'MARBELLAPAREDES', '3721ad498dd15cea0235827e328a0f5814ece591', 'SECRETARIA', '1', '0.00'), 
      ('3', '26546523', 'LEIDA YARITZA RODRIGUEZ', 'FEMENINO', 'SANTA CRUZ DE MORA', '(0414) 3432345', 'LEIDAY@GMAIL.COM', 'CAJERO123', '1c7398c72f6798112399c7aa22d7a10db47e35d2', 'CAJERO(A)', '1', '0.00'), 
      ('4', '189872345', 'CARLOS JESUS GUTIERREZ', 'MASCULINO', 'TOVAR ESTADO MERIDA', '(0412) 5436789', 'CJG@GMAIL.COM', 'MESERO123', 'b231e88cce5cdc379eff3f7092d212f6dec94ae7', 'MESERO(A)', '1', '0.00'), 
      ('5', '2398734', 'PEDRO JESUS CHIRINOS', 'MASCULINO', 'SANTA CRUZ DE MORA', '(0275) 6543456', 'JESUSCH@GMAIL.COM', 'COCINERO123', '99e3bd389cd675aa1087b02fd1cd73682611beab', 'COCINERO(A)', '1', '0.00'), 
      ('6', '237651982', 'RAFAEL CLEMENTINO CONTRERAS', 'MASCULINO', 'SANTA CRUZ DE MORA', '(0414) 5654234', 'CLEMEN@GMAIL.COM', 'REPARTIDOR123', 'f96efb0966c36507596382c274973c96baba281a', 'REPARTIDOR', '1', '0.00'), 
      ('7', '12123454545', 'ADMINISTRADOR', 'MASCULINO', 'GUATEBUENA', '(0000) 0000000', 'INFO@GMAIL.COM', 'ADMINISTRADOR', '1bf14c0c2c2ba92f7dcd98e6194b1eb28ca83f73', 'ADMINISTRADOR(A)', '1', '0.00'), 
      ('8', '89756464874', 'ALDO', 'MASCULINO', 'HJIDGSTYUDEBDOUGH{D 33', '(5546) 4588431', 'HDFT@HOTMAIL.COM', 'ZXC', 'a346bc80408d9b2a5063fd1bddb20e2d5586ec30', 'MESERO(A)', '1', '0.00'), 
      ('9', '8787797977464', 'DUA', 'FEMENINO', '&Ntilde;KDGSD54564RTG57RTG', '(6574) 6121453', 'DUA@HOTMAIL.COM', 'DUA', 'b871bb9aa4a1bdb7c0c9ef1e3b419e2dc05dc3d8', 'MESERO(A)', '1', '0.00');
COMMIT;

# | Vaciado de tabla 'ventas'
# +-------------------------------------
DROP TABLE IF EXISTS `ventas`;


# | Estructura de la tabla 'ventas'
# +-------------------------------------
CREATE TABLE `ventas` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `codpedido` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codmesa` int(11) NOT NULL,
  `tipodocumento` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcaja` int(11) NOT NULL,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codserie` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codautorizacion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `subtotalivasi` decimal(12,2) NOT NULL,
  `subtotalivano` decimal(12,2) NOT NULL,
  `iva` decimal(12,2) NOT NULL,
  `totaliva` decimal(12,2) NOT NULL,
  `descuento` decimal(12,2) NOT NULL,
  `totaldescuento` decimal(12,2) NOT NULL,
  `totalpago` decimal(12,2) NOT NULL,
  `totalpago2` decimal(12,2) NOT NULL,
  `tipopago` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `formapago` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montopagado` decimal(12,2) NOT NULL,
  `montopropina` decimal(12,2) NOT NULL,
  `montodevuelto` decimal(12,2) NOT NULL,
  `fechavencecredito` date NOT NULL,
  `fechapagado` date NOT NULL,
  `statusventa` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `statuspago` int(2) NOT NULL,
  `fechaventa` datetime NOT NULL,
  `delivery` int(2) NOT NULL,
  `repartidor` int(11) NOT NULL,
  `entregado` int(2) NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo` int(11) NOT NULL,
  `bandera` int(30) NOT NULL,
  PRIMARY KEY (`idventa`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
                
# | Carga de datos de la tabla 'ventas'
# +-------------------------------------

COMMIT;
INSERT IGNORE INTO `ventas` (`idventa`, `codpedido`, `codmesa`, `tipodocumento`, `codcaja`, `codventa`, `codserie`, `codautorizacion`, `codcliente`, `subtotalivasi`, `subtotalivano`, `iva`, `totaliva`, `descuento`, `totaldescuento`, `totalpago`, `totalpago2`, `tipopago`, `formapago`, `montopagado`, `montopropina`, `montodevuelto`, `fechavencecredito`, `fechapagado`, `statusventa`, `statuspago`, `fechaventa`, `delivery`, `repartidor`, `entregado`, `observaciones`, `codigo`, `bandera`) VALUES 
      ('1', 'P1', '0', 'TICKET', '1', '0001-000000001', '0001', '9135585355049165632668655697667552921336256466160', '0', '0.00', '23100.00', '18.00', '0.00', '0.00', '0.00', '23100.00', '21000.00', 'CONTADO', '1', '23100.00', '0.00', '0.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2019-11-23 11:17:50', '1', '0', '0', '0', '1', '1'), 
      ('2', 'P2', '0', 'TICKET', '1', '0001-000000002', '0001', '3199915009727714689616394124910577427885833642963', '0', '0.00', '51480.00', '18.00', '0.00', '0.00', '0.00', '51480.00', '46800.00', 'CONTADO', '1', '51480.00', '0.00', '0.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2019-11-23 11:33:52', '1', '0', '0', '0', '1', '2'), 
      ('3', 'P3', '0', 'TICKET', '1', '0001-000000003', '0001', '6502051212034752454641217348066843371017352680155', '0', '0.00', '4427.50', '18.00', '0.00', '0.00', '0.00', '4427.50', '4025.00', 'CONTADO', '1', '4427.50', '0.00', '0.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2019-11-23 11:38:08', '1', '0', '0', '0', '1', '3'), 
      ('9', 'P9', '0', 'TICKET', '1', '0001-000000008', '0001', '7981253531908248757108260589106805030393594318293', '0', '0.00', '19800.00', '18.00', '0.00', '0.00', '0.00', '19800.00', '18000.00', 'CONTADO', '1', '19800.00', '0.00', '0.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2019-12-23 02:49:36', '1', '0', '0', '0', '1', '8'), 
      ('5', 'P5', '9', 'FACTURA', '1', '0001-000000004', '0001', '4628239748295733393492780002504977890874604178508', '0', '0.00', '22000.00', '18.00', '0.00', '0.00', '0.00', '22000.00', '20000.00', 'CONTADO', '1', '22000.00', '0.00', '0.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2019-12-18 08:27:33', '0', '0', '0', '0', '1', '4'), 
      ('6', 'P6', '9', 'FACTURA', '1', '0001-000000005', '0001', '4192177699790601961421265512369789096766735705892', 'C10', '0.00', '9900.00', '18.00', '0.00', '0.00', '0.00', '9900.00', '9000.00', 'CONTADO', '1', '50930.00', '10.00', '41020.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2019-12-19 08:52:04', '0', '0', '0', '0', '1', '5'), 
      ('7', 'P7', '9', 'FACTURA', '1', '0001-000000006', '0001', '4830303076491050841444613392013406537844494690785', 'C14', '0.00', '40700.00', '18.00', '0.00', '0.00', '0.00', '40700.00', '37000.00', 'CONTADO', '1', '40700.00', '0.00', '0.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2019-12-19 01:26:54', '0', '0', '0', '0', '1', '6'), 
      ('8', 'P8', '0', 'TICKET', '1', '0001-000000007', '0001', '3548049670017876189837349676130584498365377155774', 'C10', '0.00', '51700.00', '18.00', '0.00', '0.00', '0.00', '51700.00', '47000.00', 'CONTADO', '1', '51700.00', '0.00', '0.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2019-12-21 12:48:55', '1', '6', '1', '0', '1', '7'), 
      ('10', 'P10', '1', 'TICKET', '1', '0001-000000011', '0001', '3279696505555218856005616271273690550210865396172', '0', '0.00', '13310.00', '18.00', '0.00', '0.00', '0.00', '13310.00', '12100.00', 'CONTADO', '1', '13310.00', '0.00', '0.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2019-12-23 02:52:03', '0', '0', '0', '0', '1', '11'), 
      ('20', 'P20', '1', 'TICKET', '1', '0001-000000016', '0001', '1805584845642835293579002092660117924587939831568', '0', '0.00', '26097.50', '18.00', '0.00', '0.00', '0.00', '26097.50', '23725.00', 'CONTADO', '1', '40000.00', '0.00', '13902.50', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2020-02-20 12:57:04', '0', '0', '0', '0', '1', '16'), 
      ('19', 'P19', '9', 'TICKET', '1', '0001-000000017', '0001', '0941922101503652516196729178397238701717038446232', '0', '0.00', '19800.00', '18.00', '0.00', '0.00', '0.00', '19800.00', '18000.00', 'CONTADO', '1', '19800.00', '0.00', '0.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2020-02-20 12:49:31', '0', '0', '0', '0', '1', '17'), 
      ('14', 'P14', '5', 'TICKET', '1', '0001-000000010', '0001', '8787345318703472499683591015616484219740621068208', '0', '0.00', '33715.00', '18.00', '0.00', '0.00', '0.00', '33715.00', '30650.00', 'CONTADO', '1', '40000.00', '0.00', '6285.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2020-01-19 04:57:17', '0', '0', '0', '0', '1', '10'), 
      ('15', 'P15', '0', 'TICKET', '1', '0001-000000012', '0001', '8566027814537041203658160450428284887579023737958', '0', '0.00', '8800.00', '18.00', '0.00', '0.00', '0.00', '8800.00', '8000.00', 'CONTADO', '1', '8800.00', '0.00', '0.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2020-02-05 04:39:31', '1', '0', '0', '0', '1', '12'), 
      ('16', 'P16', '5', 'TICKET', '1', '0001-000000013', '0001', '8725934574160903208788625386478695247000434588123', '0', '0.00', '8800.00', '18.00', '0.00', '0.00', '0.00', '8800.00', '8000.00', 'CONTADO', '1', '10000.00', '0.00', '1200.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2020-02-14 08:39:55', '0', '0', '0', '0', '1', '13'), 
      ('17', 'P17', '0', 'TICKET', '1', '0001-000000014', '0001', '2671851187496130446524085618794151798570208928364', '0', '0.00', '22.12', '18.00', '0.00', '0.00', '0.00', '22.12', '10.12', 'CONTADO', '1', '22.12', '0.00', '0.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2020-02-15 04:38:49', '1', '0', '0', '0', '1', '14'), 
      ('18', 'P18', '2', 'TICKET', '1', '0001-000000015', '0001', '0615070379434214351972123828540255439294625473568', '0', '0.00', '106920.00', '18.00', '0.00', '0.00', '0.00', '106920.00', '97200.00', 'CONTADO', '1', '106920.00', '0.00', '0.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2020-02-15 05:10:26', '0', '0', '0', '0', '1', '15'), 
      ('21', 'P21', '1', 'FACTURA', '1', '0001-000000018', '0001', '1595164308764223887778582837075784462485164273308', 'C35', '0.00', '21340.00', '18.00', '0.00', '0.00', '0.00', '21340.00', '19400.00', 'CONTADO', '1', '21340.00', '0.00', '0.00', '0000-00-00', '0000-00-00', 'PAGADA', '0', '2020-03-02 03:31:58', '0', '0', '0', '0', '1', '18'), 
      ('22', 'P22', '1', '0', '0', '0', '0', '0', '0', '0.00', '19800.00', '18.00', '0.00', '0.00', '0.00', '19800.00', '18000.00', '0', '0', '0.00', '0.00', '0.00', '0000-00-00', '0000-00-00', '0', '1', '2020-03-28 10:18:55', '0', '0', '0', '0', '1', '0'), 
      ('23', 'P23', '16', '0', '0', '0', '0', '0', '0', '0.00', '28600.00', '18.00', '0.00', '0.00', '0.00', '28600.00', '26000.00', '0', '0', '0.00', '0.00', '0.00', '0000-00-00', '0000-00-00', '0', '1', '2020-04-03 10:15:57', '0', '0', '0', '0', '4', '0');
COMMIT;


