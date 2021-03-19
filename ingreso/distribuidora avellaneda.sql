SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for albalinea
-- ----------------------------
DROP TABLE IF EXISTS `albalinea`;
CREATE TABLE `albalinea` (
  `codalbaran` int(11) NOT NULL default '0',
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) default NULL,
  `codigo` varchar(15) character set utf8 default NULL,
  `cantidad` decimal(19,4) NOT NULL default '0.0000',
  `precio` decimal(19,4) NOT NULL default '0.0000',
  `importe` decimal(19,4) NOT NULL default '0.0000',
  `dcto` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`codalbaran`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for albalineap
-- ----------------------------
DROP TABLE IF EXISTS `albalineap`;
CREATE TABLE `albalineap` (
  `codalbaran` varchar(20) NOT NULL default '0',
  `codproveedor` int(5) NOT NULL default '0',
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) default NULL,
  `codigo` varchar(15) default NULL,
  `cantidad` decimal(10,0) NOT NULL default '0',
  `precio` decimal(19,4) NOT NULL default '0.0000',
  `importe` decimal(19,4) NOT NULL default '0.0000',
  `dcto` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`codalbaran`,`codproveedor`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for albalineaptmp
-- ----------------------------
DROP TABLE IF EXISTS `albalineaptmp`;
CREATE TABLE `albalineaptmp` (
  `codalbaran` int(11) NOT NULL default '0',
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) default NULL,
  `codigo` varchar(15) default NULL,
  `cantidad` decimal(19,4) NOT NULL default '0.0000',
  `precio` decimal(19,4) NOT NULL default '0.0000',
  `importe` decimal(19,4) NOT NULL default '0.0000',
  `dcto` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`codalbaran`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for albalineatmp
-- ----------------------------
DROP TABLE IF EXISTS `albalineatmp`;
CREATE TABLE `albalineatmp` (
  `codalbaran` int(11) NOT NULL default '0',
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) default NULL,
  `codigo` varchar(15) character set utf8 default NULL,
  `cantidad` decimal(19,4) NOT NULL default '0.0000',
  `precio` decimal(19,4) NOT NULL default '0.0000',
  `importe` decimal(19,4) NOT NULL default '0.0000',
  `dcto` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`codalbaran`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for albaranes
-- ----------------------------
DROP TABLE IF EXISTS `albaranes`;
CREATE TABLE `albaranes` (
  `codalbaran` int(11) NOT NULL auto_increment,
  `codfactura` int(11) NOT NULL default '0',
  `fecha` date NOT NULL default '0000-00-00',
  `iva` tinyint(4) NOT NULL default '0',
  `codcliente` int(5) default '0',
  `estado` varchar(1) character set utf8 default '1',
  `totalalbaran` decimal(19,4) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codalbaran`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for albaranesp
-- ----------------------------
DROP TABLE IF EXISTS `albaranesp`;
CREATE TABLE `albaranesp` (
  `codalbaran` varchar(20) NOT NULL default '0',
  `codproveedor` int(5) NOT NULL default '0',
  `codfactura` varchar(20) default NULL,
  `fecha` date NOT NULL default '0000-00-00',
  `iva` tinyint(4) NOT NULL default '0',
  `estado` varchar(1) default '1',
  `totalalbaran` decimal(19,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`codalbaran`,`codproveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for albaranesptmp
-- ----------------------------
DROP TABLE IF EXISTS `albaranesptmp`;
CREATE TABLE `albaranesptmp` (
  `codalbaran` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`codalbaran`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='Temporal de albaranes de proveedores para controlar acceso s';

-- ----------------------------
-- Table structure for albaranestmp
-- ----------------------------
DROP TABLE IF EXISTS `albaranestmp`;
CREATE TABLE `albaranestmp` (
  `codalbaran` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`codalbaran`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1 COMMENT='Temporal de albaranes para controlar acceso simultaneo';

-- ----------------------------
-- Table structure for articulos
-- ----------------------------
DROP TABLE IF EXISTS `articulos`;
CREATE TABLE `articulos` (
  `codarticulo` int(10) NOT NULL auto_increment,
  `codfamilia` int(5) NOT NULL,
  `referencia` varchar(20) NOT NULL,
  `descripcion` text NOT NULL,
  `impuesto` float NOT NULL,
  `codproveedor1` int(5) NOT NULL default '1',
  `codproveedor2` int(5) NOT NULL,
  `descripcion_corta` varchar(30) NOT NULL,
  `codubicacion` int(3) NOT NULL,
  `stock` int(10) NOT NULL,
  `stock_minimo` int(8) NOT NULL,
  `aviso_minimo` varchar(1) NOT NULL default '0',
  `datos_producto` varchar(200) NOT NULL,
  `fecha_alta` date NOT NULL default '0000-00-00',
  `codembalaje` int(3) NOT NULL,
  `unidades_caja` int(8) NOT NULL,
  `precio_ticket` varchar(1) NOT NULL default '0',
  `modificar_ticket` varchar(1) NOT NULL default '0',
  `observaciones` text NOT NULL,
  `precio_compra` decimal(19,4) default NULL,
  `precio_almacen` decimal(19,4) default NULL,
  `precio_tienda` decimal(19,4) default NULL,
  `precio_pvp` decimal(19,4) default NULL,
  `precio_iva` decimal(19,4) default NULL,
  `codigobarras` varchar(15) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codarticulo`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Articulos';

-- ----------------------------
-- Table structure for artpro
-- ----------------------------
DROP TABLE IF EXISTS `artpro`;
CREATE TABLE `artpro` (
  `codarticulo` varchar(15) NOT NULL,
  `codfamilia` int(3) NOT NULL,
  `codproveedor` int(5) NOT NULL,
  `precio` decimal(19,4) NOT NULL,
  PRIMARY KEY  (`codarticulo`,`codfamilia`,`codproveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `codcliente` int(5) NOT NULL auto_increment,
  `nombre` varchar(45) NOT NULL,
  `nif` varchar(13) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `codprovincia` int(2) NOT NULL default '0',
  `localidad` varchar(35) NOT NULL,
  `codformapago` int(2) NOT NULL default '0',
  `codentidad` int(2) NOT NULL default '0',
  `cuentabancaria` varchar(20) NOT NULL,
  `codpostal` varchar(5) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `movil` varchar(14) NOT NULL,
  `email` varchar(35) NOT NULL,
  `web` varchar(45) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codcliente`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Clientes';

-- ----------------------------
-- Table structure for cobros
-- ----------------------------
DROP TABLE IF EXISTS `cobros`;
CREATE TABLE `cobros` (
  `id` int(11) NOT NULL auto_increment,
  `codfactura` int(11) NOT NULL,
  `codcliente` int(5) NOT NULL,
  `importe` decimal(19,4) NOT NULL,
  `codformapago` int(2) NOT NULL,
  `numdocumento` varchar(30) NOT NULL,
  `fechacobro` date NOT NULL default '0000-00-00',
  `observaciones` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='Cobros de facturas a clientes';

-- ----------------------------
-- Table structure for embalajes
-- ----------------------------
DROP TABLE IF EXISTS `embalajes`;
CREATE TABLE `embalajes` (
  `codembalaje` int(3) NOT NULL auto_increment,
  `nombre` varchar(30) default NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codembalaje`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Embalajes';

-- ----------------------------
-- Table structure for entidades
-- ----------------------------
DROP TABLE IF EXISTS `entidades`;
CREATE TABLE `entidades` (
  `codentidad` int(2) NOT NULL auto_increment,
  `nombreentidad` varchar(50) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codentidad`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Entidades Bancarias';

-- ----------------------------
-- Table structure for factulinea
-- ----------------------------
DROP TABLE IF EXISTS `factulinea`;
CREATE TABLE `factulinea` (
  `codfactura` int(11) NOT NULL,
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `cantidad` decimal(19,4) NOT NULL,
  `precio` decimal(19,4) NOT NULL,
  `importe` decimal(19,4) NOT NULL,
  `dcto` tinyint(4) NOT NULL,
  PRIMARY KEY  (`codfactura`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='lineas de facturas a clientes';

-- ----------------------------
-- Table structure for factulineap
-- ----------------------------
DROP TABLE IF EXISTS `factulineap`;
CREATE TABLE `factulineap` (
  `codfactura` varchar(20) NOT NULL default '',
  `codproveedor` int(5) NOT NULL,
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `cantidad` decimal(19,4) NOT NULL,
  `precio` decimal(19,4) NOT NULL,
  `importe` decimal(19,4) NOT NULL,
  `dcto` tinyint(4) NOT NULL,
  PRIMARY KEY  (`codfactura`,`codproveedor`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='lineas de facturas de proveedores';

-- ----------------------------
-- Table structure for factulineaptmp
-- ----------------------------
DROP TABLE IF EXISTS `factulineaptmp`;
CREATE TABLE `factulineaptmp` (
  `codfactura` int(11) NOT NULL,
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `cantidad` decimal(19,4) NOT NULL,
  `precio` decimal(19,4) NOT NULL,
  `importe` decimal(19,4) NOT NULL,
  `dcto` tinyint(4) NOT NULL,
  PRIMARY KEY  (`codfactura`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='lineas de facturas de proveedores temporal';

-- ----------------------------
-- Table structure for factulineatmp
-- ----------------------------
DROP TABLE IF EXISTS `factulineatmp`;
CREATE TABLE `factulineatmp` (
  `codfactura` int(11) NOT NULL,
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `cantidad` decimal(19,4) NOT NULL,
  `precio` decimal(19,4) NOT NULL,
  `importe` decimal(19,4) NOT NULL,
  `dcto` tinyint(4) NOT NULL,
  PRIMARY KEY  (`codfactura`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Temporal de linea de facturas a clientes';

-- ----------------------------
-- Table structure for facturas
-- ----------------------------
DROP TABLE IF EXISTS `facturas`;
CREATE TABLE `facturas` (
  `codfactura` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL,
  `iva` tinyint(4) NOT NULL,
  `codcliente` int(5) NOT NULL,
  `estado` varchar(1) NOT NULL default '0',
  `totalfactura` decimal(19,4) NOT NULL,
  `fechavencimiento` date NOT NULL default '0000-00-00',
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codfactura`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='facturas de ventas a clientes';

-- ----------------------------
-- Table structure for facturasp
-- ----------------------------
DROP TABLE IF EXISTS `facturasp`;
CREATE TABLE `facturasp` (
  `codfactura` varchar(20) NOT NULL default '',
  `codproveedor` int(5) NOT NULL,
  `fecha` date NOT NULL,
  `iva` tinyint(4) NOT NULL,
  `estado` varchar(1) NOT NULL default '0',
  `totalfactura` decimal(19,4) NOT NULL,
  `fechapago` date NOT NULL default '0000-00-00',
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codfactura`,`codproveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='facturas de compras a proveedores';

-- ----------------------------
-- Table structure for facturasptmp
-- ----------------------------
DROP TABLE IF EXISTS `facturasptmp`;
CREATE TABLE `facturasptmp` (
  `codfactura` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL,
  PRIMARY KEY  (`codfactura`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='temporal de facturas de proveedores';

-- ----------------------------
-- Table structure for facturastmp
-- ----------------------------
DROP TABLE IF EXISTS `facturastmp`;
CREATE TABLE `facturastmp` (
  `codfactura` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL,
  PRIMARY KEY  (`codfactura`)
) ENGINE=MyISAM AUTO_INCREMENT=305 DEFAULT CHARSET=utf8 COMMENT='temporal de facturas a clientes';

-- ----------------------------
-- Table structure for familias
-- ----------------------------
DROP TABLE IF EXISTS `familias`;
CREATE TABLE `familias` (
  `codfamilia` int(5) NOT NULL auto_increment,
  `nombre` varchar(20) default NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codfamilia`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='familia de articulos';

-- ----------------------------
-- Table structure for formapago
-- ----------------------------
DROP TABLE IF EXISTS `formapago`;
CREATE TABLE `formapago` (
  `codformapago` int(2) NOT NULL auto_increment,
  `nombrefp` varchar(40) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codformapago`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Forma de pago';

-- ----------------------------
-- Table structure for impuestos
-- ----------------------------
DROP TABLE IF EXISTS `impuestos`;
CREATE TABLE `impuestos` (
  `codimpuesto` int(3) NOT NULL auto_increment,
  `nombre` varchar(20) default NULL,
  `valor` decimal(19,4) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codimpuesto`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='tipos de impuestos';

-- ----------------------------
-- Table structure for librodiario
-- ----------------------------
DROP TABLE IF EXISTS `librodiario`;
CREATE TABLE `librodiario` (
  `id` int(8) NOT NULL auto_increment,
  `fecha` date NOT NULL default '0000-00-00',
  `tipodocumento` varchar(1) NOT NULL,
  `coddocumento` varchar(20) NOT NULL,
  `codcomercial` int(5) NOT NULL,
  `codformapago` int(2) NOT NULL,
  `numpago` varchar(30) NOT NULL,
  `total` decimal(19,4) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='Movimientos diarios';

-- ----------------------------
-- Table structure for pagos
-- ----------------------------
DROP TABLE IF EXISTS `pagos`;
CREATE TABLE `pagos` (
  `id` int(11) NOT NULL auto_increment,
  `codfactura` varchar(20) NOT NULL,
  `codproveedor` int(5) NOT NULL,
  `importe` decimal(19,4) NOT NULL,
  `codformapago` int(2) NOT NULL,
  `numdocumento` varchar(30) NOT NULL,
  `fechapago` date default '0000-00-00',
  `observaciones` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Pagos de facturas a proveedores';

-- ----------------------------
-- Table structure for parametros
-- ----------------------------
DROP TABLE IF EXISTS `parametros`;
CREATE TABLE `parametros` (
  `indice` int(1) default NULL,
  `usuario` varchar(10) default NULL,
  `clave` varchar(10) default NULL,
  `servidor` varchar(20) default NULL,
  `basedatos` varchar(20) default NULL,
  `numeracionfactura` decimal(10,0) default NULL,
  `setnumfac` decimal(1,0) default NULL,
  `fondofac` text,
  `imagenfac` varchar(30) default NULL,
  `fondoguia` text,
  `imagenguia` varchar(30) default NULL,
  `filasdetallefactura` int(2) default NULL,
  `ivaimp` decimal(2,0) default NULL,
  `nombremoneda` varchar(20) default NULL,
  `simbolomoneda` varchar(20) default NULL,
  `codigomoneda` varchar(10) default NULL,
  `nomempresa` tinytext,
  `giro` varchar(50) default NULL,
  `fonos` varchar(30) default NULL,
  `direccion` varchar(30) default NULL,
  `comuna` varchar(30) default NULL,
  `ciudadactual` varchar(30) default NULL,
  `numerofiscal` varchar(20) default NULL,
  `resolucionsii` varchar(50) default NULL,
  `rutempresa` varchar(20) default NULL,
  `giro2` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for petroleo
-- ----------------------------
DROP TABLE IF EXISTS `petroleo`;
CREATE TABLE `petroleo` (
  `mes` int(11) default NULL,
  `precio` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `codproveedor` int(5) NOT NULL auto_increment,
  `nombre` varchar(45) NOT NULL,
  `nif` varchar(12) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `codprovincia` int(2) NOT NULL,
  `localidad` varchar(35) NOT NULL,
  `codentidad` int(2) NOT NULL,
  `cuentabancaria` varchar(20) NOT NULL,
  `codpostal` varchar(5) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `movil` varchar(14) NOT NULL,
  `email` varchar(35) NOT NULL,
  `web` varchar(45) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codproveedor`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Proveedores';

-- ----------------------------
-- Table structure for provincias
-- ----------------------------
DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias` (
  `codprovincia` int(2) NOT NULL auto_increment,
  `nombreprovincia` varchar(40) NOT NULL,
  PRIMARY KEY  (`codprovincia`)
) ENGINE=MyISAM AUTO_INCREMENT=16406 DEFAULT CHARSET=utf8 COMMENT='Provincias';

-- ----------------------------
-- Table structure for tabbackup
-- ----------------------------
DROP TABLE IF EXISTS `tabbackup`;
CREATE TABLE `tabbackup` (
  `id` int(6) NOT NULL auto_increment,
  `denominacion` varchar(50) character set utf8 collate utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `archivo` varchar(40) character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ubicaciones
-- ----------------------------
DROP TABLE IF EXISTS `ubicaciones`;
CREATE TABLE `ubicaciones` (
  `codubicacion` int(3) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codubicacion`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Ubicaciones';

-- ----------------------------
-- Table structure for uf
-- ----------------------------
DROP TABLE IF EXISTS `uf`;
CREATE TABLE `uf` (
  `Fecha` varchar(20) default NULL,
  `Valor` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(20) NOT NULL auto_increment,
  `full_name` varchar(200) character set latin1 collate latin1_general_ci NOT NULL default '',
  `user_name` varchar(200) character set latin1 collate latin1_general_ci NOT NULL default '',
  `user_pwd` varchar(200) character set latin1 collate latin1_general_ci NOT NULL default '',
  `user_email` varchar(200) character set latin1 collate latin1_general_ci NOT NULL default '',
  `activation_code` int(10) NOT NULL default '0',
  `joined` date NOT NULL default '0000-00-00',
  `country` varchar(100) character set latin1 collate latin1_general_ci NOT NULL default '',
  `user_activated` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vendedores
-- ----------------------------
DROP TABLE IF EXISTS `vendedores`;
CREATE TABLE `vendedores` (
  `codvendedor` int(5) NOT NULL auto_increment,
  `nombre` varchar(45) NOT NULL,
  `nif` varchar(12) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `codprovincia` int(2) NOT NULL default '0',
  `localidad` varchar(35) NOT NULL,
  `codpostal` varchar(5) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `movil` varchar(14) NOT NULL,
  `email` varchar(35) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codvendedor`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Clientes';

-- ----------------------------
-- Records 
-- ----------------------------

INSERT INTO `clientes` VALUES ('1', 'Cliente Mostrador', 'NA', 'NA', '0', '', '0', '0', '', '', '', '', '', '', '0');

INSERT INTO `embalajes` VALUES ('1', 'Caja', '0');

INSERT INTO `entidades` VALUES ('3', 'Banamex', '0');
INSERT INTO `entidades` VALUES ('4', 'Banco Azteca', '0');
INSERT INTO `entidades` VALUES ('5', 'Santander', '0');
INSERT INTO `entidades` VALUES ('6', 'BBVA Bancomer', '0');
INSERT INTO `entidades` VALUES ('7', 'HSBC', '0');
INSERT INTO `entidades` VALUES ('8', 'ScotiaBank', '0');
INSERT INTO `entidades` VALUES ('9', 'Banorte', '0');

INSERT INTO `formapago` VALUES ('1', 'Contado Efectivo', '0');
INSERT INTO `formapago` VALUES ('2', 'Contado Cheque', '0');
INSERT INTO `formapago` VALUES ('3', 'Cheque 30 y 60 ', '0');
INSERT INTO `formapago` VALUES ('4', 'Tarjeta de Credito', '0');

INSERT INTO `impuestos` VALUES ('1', 'IVA', '16.0000', '0');

INSERT INTO `parametros` VALUES ('1', '', '', '', '', '1', '0', 'SI', 'Factura v3.jpg', 'SI', 'logo.jpg', '24', '16', 'Pesos', '$', '$', 'Codeka MX', 'Sistemas para la PYME', '(555) 123-1234', 'Calle Pinguinos No. 123', 'Mexico, D.F.', null, 'AAAA-123456-AAA', null, null, null);

INSERT INTO `provincias` VALUES ('1', 'Aguascalientes');
INSERT INTO `provincias` VALUES ('2', 'Baja California Norte');
INSERT INTO `provincias` VALUES ('3', 'Baja California Sur');
INSERT INTO `provincias` VALUES ('4', 'Chihuahua');
INSERT INTO `provincias` VALUES ('5', 'Colima');
INSERT INTO `provincias` VALUES ('6', 'Campeche');
INSERT INTO `provincias` VALUES ('7', 'Coahuila');
INSERT INTO `provincias` VALUES ('8', 'Chiapas');
INSERT INTO `provincias` VALUES ('9', 'Distrito Federal');
INSERT INTO `provincias` VALUES ('10', 'Durango');
INSERT INTO `provincias` VALUES ('11', 'Guerrero');
INSERT INTO `provincias` VALUES ('12', 'Guanajuato');
INSERT INTO `provincias` VALUES ('13', 'Hidalgo');
INSERT INTO `provincias` VALUES ('14', 'Jalisco');
INSERT INTO `provincias` VALUES ('15', 'Michoacán');
INSERT INTO `provincias` VALUES ('16', 'Morelos');
INSERT INTO `provincias` VALUES ('17', 'Estado de México');
INSERT INTO `provincias` VALUES ('18', 'Nayarit');
INSERT INTO `provincias` VALUES ('19', 'Nuevo León');
INSERT INTO `provincias` VALUES ('20', 'Oaxaca');
INSERT INTO `provincias` VALUES ('21', 'Puebla');
INSERT INTO `provincias` VALUES ('22', 'Quintana Roo');
INSERT INTO `provincias` VALUES ('23', 'Querétaro');
INSERT INTO `provincias` VALUES ('24', 'Sinaloa');
INSERT INTO `provincias` VALUES ('25', 'San Luis Potosí');
INSERT INTO `provincias` VALUES ('26', 'Sonora');
INSERT INTO `provincias` VALUES ('27', 'Tabasco');
INSERT INTO `provincias` VALUES ('28', 'Tlaxcala');
INSERT INTO `provincias` VALUES ('29', 'Tamaulipas');
INSERT INTO `provincias` VALUES ('30', 'Veracruz');
INSERT INTO `provincias` VALUES ('31', 'Yucatán');
INSERT INTO `provincias` VALUES ('32', 'Zacatecas');

INSERT INTO `ubicaciones` VALUES ('1', 'Bodega Central', '0');