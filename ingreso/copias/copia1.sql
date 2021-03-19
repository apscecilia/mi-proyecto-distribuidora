-- MySQL dump 10.11
--
-- Host: localhost    Database: distribuidora
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `albalinea`
--

DROP TABLE IF EXISTS `albalinea`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `albalinea`
--

LOCK TABLES `albalinea` WRITE;
/*!40000 ALTER TABLE `albalinea` DISABLE KEYS */;
/*!40000 ALTER TABLE `albalinea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albalineap`
--

DROP TABLE IF EXISTS `albalineap`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `albalineap`
--

LOCK TABLES `albalineap` WRITE;
/*!40000 ALTER TABLE `albalineap` DISABLE KEYS */;
/*!40000 ALTER TABLE `albalineap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albalineaptmp`
--

DROP TABLE IF EXISTS `albalineaptmp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `albalineaptmp`
--

LOCK TABLES `albalineaptmp` WRITE;
/*!40000 ALTER TABLE `albalineaptmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `albalineaptmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albalineatmp`
--

DROP TABLE IF EXISTS `albalineatmp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `albalineatmp`
--

LOCK TABLES `albalineatmp` WRITE;
/*!40000 ALTER TABLE `albalineatmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `albalineatmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albaranes`
--

DROP TABLE IF EXISTS `albaranes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `albaranes`
--

LOCK TABLES `albaranes` WRITE;
/*!40000 ALTER TABLE `albaranes` DISABLE KEYS */;
/*!40000 ALTER TABLE `albaranes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albaranesp`
--

DROP TABLE IF EXISTS `albaranesp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `albaranesp`
--

LOCK TABLES `albaranesp` WRITE;
/*!40000 ALTER TABLE `albaranesp` DISABLE KEYS */;
/*!40000 ALTER TABLE `albaranesp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albaranesptmp`
--

DROP TABLE IF EXISTS `albaranesptmp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `albaranesptmp` (
  `codalbaran` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`codalbaran`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='Temporal de albaranes de proveedores para controlar acceso s';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `albaranesptmp`
--

LOCK TABLES `albaranesptmp` WRITE;
/*!40000 ALTER TABLE `albaranesptmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `albaranesptmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albaranestmp`
--

DROP TABLE IF EXISTS `albaranestmp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `albaranestmp` (
  `codalbaran` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`codalbaran`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1 COMMENT='Temporal de albaranes para controlar acceso simultaneo';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `albaranestmp`
--

LOCK TABLES `albaranestmp` WRITE;
/*!40000 ALTER TABLE `albaranestmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `albaranestmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artpro`
--

DROP TABLE IF EXISTS `artpro`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `artpro` (
  `codarticulo` varchar(15) NOT NULL,
  `codfamilia` int(3) NOT NULL,
  `codproveedor` int(5) NOT NULL,
  `precio` decimal(19,4) NOT NULL,
  PRIMARY KEY  (`codarticulo`,`codfamilia`,`codproveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `artpro`
--

LOCK TABLES `artpro` WRITE;
/*!40000 ALTER TABLE `artpro` DISABLE KEYS */;
/*!40000 ALTER TABLE `artpro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Cliente Mostrador','NA','NA',0,'',0,0,'','','','','','','0');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobros`
--

DROP TABLE IF EXISTS `cobros`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cobros`
--

LOCK TABLES `cobros` WRITE;
/*!40000 ALTER TABLE `cobros` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embalajes`
--

DROP TABLE IF EXISTS `embalajes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `embalajes` (
  `codembalaje` int(3) NOT NULL auto_increment,
  `nombre` varchar(30) default NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codembalaje`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Embalajes';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `embalajes`
--

LOCK TABLES `embalajes` WRITE;
/*!40000 ALTER TABLE `embalajes` DISABLE KEYS */;
INSERT INTO `embalajes` VALUES (1,'Caja','0');
/*!40000 ALTER TABLE `embalajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidades`
--

DROP TABLE IF EXISTS `entidades`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `entidades` (
  `codentidad` int(2) NOT NULL auto_increment,
  `nombreentidad` varchar(50) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codentidad`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Entidades Bancarias';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `entidades`
--

LOCK TABLES `entidades` WRITE;
/*!40000 ALTER TABLE `entidades` DISABLE KEYS */;
INSERT INTO `entidades` VALUES (3,'Banamex','0'),(4,'Banco Azteca','0'),(5,'Santander','0'),(6,'BBVA Bancomer','0'),(7,'HSBC','0'),(8,'ScotiaBank','0'),(9,'Banorte','0');
/*!40000 ALTER TABLE `entidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factulinea`
--

DROP TABLE IF EXISTS `factulinea`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `factulinea`
--

LOCK TABLES `factulinea` WRITE;
/*!40000 ALTER TABLE `factulinea` DISABLE KEYS */;
/*!40000 ALTER TABLE `factulinea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factulineap`
--

DROP TABLE IF EXISTS `factulineap`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `factulineap`
--

LOCK TABLES `factulineap` WRITE;
/*!40000 ALTER TABLE `factulineap` DISABLE KEYS */;
/*!40000 ALTER TABLE `factulineap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factulineaptmp`
--

DROP TABLE IF EXISTS `factulineaptmp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `factulineaptmp`
--

LOCK TABLES `factulineaptmp` WRITE;
/*!40000 ALTER TABLE `factulineaptmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `factulineaptmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factulineatmp`
--

DROP TABLE IF EXISTS `factulineatmp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `factulineatmp`
--

LOCK TABLES `factulineatmp` WRITE;
/*!40000 ALTER TABLE `factulineatmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `factulineatmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturasp`
--

DROP TABLE IF EXISTS `facturasp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `facturasp`
--

LOCK TABLES `facturasp` WRITE;
/*!40000 ALTER TABLE `facturasp` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturasp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturasptmp`
--

DROP TABLE IF EXISTS `facturasptmp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `facturasptmp` (
  `codfactura` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL,
  PRIMARY KEY  (`codfactura`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='temporal de facturas de proveedores';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `facturasptmp`
--

LOCK TABLES `facturasptmp` WRITE;
/*!40000 ALTER TABLE `facturasptmp` DISABLE KEYS */;
INSERT INTO `facturasptmp` VALUES (35,'2013-07-01');
/*!40000 ALTER TABLE `facturasptmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturastmp`
--

DROP TABLE IF EXISTS `facturastmp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `facturastmp` (
  `codfactura` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL,
  PRIMARY KEY  (`codfactura`)
) ENGINE=MyISAM AUTO_INCREMENT=307 DEFAULT CHARSET=utf8 COMMENT='temporal de facturas a clientes';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `facturastmp`
--

LOCK TABLES `facturastmp` WRITE;
/*!40000 ALTER TABLE `facturastmp` DISABLE KEYS */;
INSERT INTO `facturastmp` VALUES (305,'2013-07-01'),(306,'2013-07-01');
/*!40000 ALTER TABLE `facturastmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familias`
--

DROP TABLE IF EXISTS `familias`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `familias` (
  `codfamilia` int(5) NOT NULL auto_increment,
  `nombre` varchar(20) default NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codfamilia`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='familia de articulos';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `familias`
--

LOCK TABLES `familias` WRITE;
/*!40000 ALTER TABLE `familias` DISABLE KEYS */;
/*!40000 ALTER TABLE `familias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapago`
--

DROP TABLE IF EXISTS `formapago`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `formapago` (
  `codformapago` int(2) NOT NULL auto_increment,
  `nombrefp` varchar(40) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codformapago`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Forma de pago';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `formapago`
--

LOCK TABLES `formapago` WRITE;
/*!40000 ALTER TABLE `formapago` DISABLE KEYS */;
INSERT INTO `formapago` VALUES (1,'Contado Efectivo','0'),(2,'Contado Cheque','0'),(3,'Cheque 30 y 60 ','0'),(4,'Tarjeta de Credito','0');
/*!40000 ALTER TABLE `formapago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impuestos`
--

DROP TABLE IF EXISTS `impuestos`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `impuestos` (
  `codimpuesto` int(3) NOT NULL auto_increment,
  `nombre` varchar(20) default NULL,
  `valor` decimal(19,4) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codimpuesto`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='tipos de impuestos';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `impuestos`
--

LOCK TABLES `impuestos` WRITE;
/*!40000 ALTER TABLE `impuestos` DISABLE KEYS */;
INSERT INTO `impuestos` VALUES (1,'IVA','16.0000','0');
/*!40000 ALTER TABLE `impuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librodiario`
--

DROP TABLE IF EXISTS `librodiario`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `librodiario`
--

LOCK TABLES `librodiario` WRITE;
/*!40000 ALTER TABLE `librodiario` DISABLE KEYS */;
/*!40000 ALTER TABLE `librodiario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `parametros`
--

LOCK TABLES `parametros` WRITE;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
INSERT INTO `parametros` VALUES (1,'','','','','1','0','SI','Factura v3.jpg','SI','logo.jpg',24,'16','Pesos','$','$','Codeka MX','Sistemas para la PYME','(555) 123-1234','Calle Pinguinos No. 123','Mexico, D.F.',NULL,'AAAA-123456-AAA',NULL,NULL,NULL);
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petroleo`
--

DROP TABLE IF EXISTS `petroleo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `petroleo` (
  `mes` int(11) default NULL,
  `precio` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `petroleo`
--

LOCK TABLES `petroleo` WRITE;
/*!40000 ALTER TABLE `petroleo` DISABLE KEYS */;
/*!40000 ALTER TABLE `petroleo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `provincias` (
  `codprovincia` int(2) NOT NULL auto_increment,
  `nombreprovincia` varchar(40) NOT NULL,
  PRIMARY KEY  (`codprovincia`)
) ENGINE=MyISAM AUTO_INCREMENT=16406 DEFAULT CHARSET=utf8 COMMENT='Provincias';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Aguascalientes'),(2,'Baja California Norte'),(3,'Baja California Sur'),(4,'Chihuahua'),(5,'Colima'),(6,'Campeche'),(7,'Coahuila'),(8,'Chiapas'),(9,'Distrito Federal'),(10,'Durango'),(11,'Guerrero'),(12,'Guanajuato'),(13,'Hidalgo'),(14,'Jalisco'),(15,'Michoacán'),(16,'Morelos'),(17,'Estado de México'),(18,'Nayarit'),(19,'Nuevo León'),(20,'Oaxaca'),(21,'Puebla'),(22,'Quintana Roo'),(23,'Querétaro'),(24,'Sinaloa'),(25,'San Luis Potosí'),(26,'Sonora'),(27,'Tabasco'),(28,'Tlaxcala'),(29,'Tamaulipas'),(30,'Veracruz'),(31,'Yucatán'),(32,'Zacatecas');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ubicaciones` (
  `codubicacion` int(3) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codubicacion`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Ubicaciones';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` VALUES (1,'Bodega Central','0');
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf`
--

DROP TABLE IF EXISTS `uf`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `uf` (
  `Fecha` varchar(20) default NULL,
  `Valor` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `uf`
--

LOCK TABLES `uf` WRITE;
/*!40000 ALTER TABLE `uf` DISABLE KEYS */;
/*!40000 ALTER TABLE `uf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
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
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-03  0:34:57
