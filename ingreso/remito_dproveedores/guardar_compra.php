<?
include ("../conectar.php"); 
include ("../funciones/fechas.php"); 

$accion=$_POST["accion"];
if (!isset($accion)) { $accion=$_GET["accion"]; }

$codalbarantmp=$_POST["codalbarantmp"];
$codalbaran=$_POST["calbaran"];
$codproveedor=$_POST["codproveedor"];
$fecha=explota($_POST["fecha"]);
$iva=$_POST["iva"];
$minimo=0;

if ($accion=="alta") {
	$query_comprobar="SELECT * FROM remitosp WHERE codalbaran='$codalbaran' AND codproveedor='$codproveedor'";
	$rs_comprobar=mysql_query($query_comprobar);
	if (mysql_num_rows($rs_comprobar) > 0 ) {
			?><script>
				alert ("No se puede dar de alta este numero de Orden con este proveedor, ya existe uno en el sistema.");
				location.href="index.php";
			</script><?
	} else {
			$query_operacion="INSERT INTO remitosp (codalbaran, codproveedor, codfactura, fecha, iva, estado) VALUES ('$codalbaran', '$codproveedor',  '0', '$fecha', '$iva', '1')";					
			$rs_operacion=mysql_query($query_operacion);
			if ($rs_operacion) { $mensaje="La orden de compra ha sido dado de alta correctamente"; }
			$query_tmp="SELECT * FROM remilineaptmp WHERE codalbaran='$codalbarantmp' ORDER BY numlinea ASC";
			$rs_tmp=mysql_query($query_tmp);
			$contador=0;
			$baseimponible=0;
			while ($contador < mysql_num_rows($rs_tmp)) {
				//$codfamilia=mysql_result($rs_tmp,$contador,"codfamilia");
				$numlinea=mysql_result($rs_tmp,$contador,"numlinea");
				$codigo=mysql_result($rs_tmp,$contador,"codigo");
				$cantidad=mysql_result($rs_tmp,$contador,"cantidad");
				$precio=mysql_result($rs_tmp,$contador,"precio");
				$importe=mysql_result($rs_tmp,$contador,"importe");
				$baseimponible=$baseimponible+$importe;
				$dcto=mysql_result($rs_tmp,$contador,"dcto");
				$sel_insertar="INSERT INTO remilineap (codalbaran,codproveedor,numlinea,codigo,cantidad,precio,importe,dcto) VALUES 
				('$codalbaran','$codproveedor','$numlinea','$codigo','$cantidad','$precio','$importe','$dcto')";//codfamilia,  '$codfamilia',
				$rs_insertar=mysql_query($sel_insertar);		
				$sel_articulos="UPDATE articulos SET stock=(stock+'$cantidad') WHERE codarticulo='$codigo' ";//AND codfamilia='$codfamilia'
				$rs_articulos=mysql_query($sel_articulos);
				/*$sel_comprobar="SELECT codarticulo FROM artpro WHERE codarticulo='".$codigo."' AND codfamilia='$codfamilia' AND codproveedor='".$codproveedor."'";
				$rs_comprobar=mysql_query($sel_comprobar);
				$precio=sprintf("%01.2f",$precio);
				if (mysql_num_rows($rs_comprobar) > 0) {
					$sentencia="UPDATE artpro SET precio='".$precio."' WHERE codarticulo='".$codigo."' AND codfamilia='$codfamilia' AND codproveedor='".$codproveedor."'";         } else {
					$sentencia="INSERT into artpro (codarticulo,codfamilia,codproveedor,precio) VALUES ('$codigo','$codfamilia','$codproveedor','$precio')";		
				}
				$ejecutar=mysql_query($sentencia);*/
				$sentencia2="UPDATE articulos SET ultimo_precio_costo='".$precio."' AND codproveedor='$codproveedor' WHERE codarticulo='$codigo' ";//AND codfamilia='$codfamilia'
				$ejecutar=mysql_query($sentencia2);
				$contador++;
			}
			$baseimpuestos=$baseimponible*($iva/100);
			$preciototal=$baseimponible+$baseimpuestos;
			//$preciototal=number_format($preciototal,2);	
			$sel_act="UPDATE remitosp SET totalalbaran='$preciototal' WHERE codalbaran='$codalbaran'";
			$rs_act=mysql_query($sel_act);
			$baseimpuestos=0;
			$preciototal=0;
			$baseimponible=0;
			$cabecera1="Inicio >> Compras &gt;&gt; Nueva Orden de Compra ";
			$cabecera2="INSERTAR ORDEN ";
		}
} 
//modificar orden de compra
if ($accion=="modificar") {
	$codalbaran=$_POST["codalbaran"];
	$act_orden="UPDATE remitosp SET fecha='$fecha', iva='$iva' WHERE codalbaran='$codalbaran' AND codproveedor='$codproveedor'";
	$rs_orden=mysql_query($act_orden);
	$sel_lineas = "SELECT codigo,cantidad FROM remilineap WHERE codalbaran='$codalbaran' AND codproveedor='$codproveedor' order by numlinea";//codfamilia,
	$rs_lineas = mysql_query($sel_lineas);
	$contador=0;
	while ($contador < mysql_num_rows($rs_lineas)) {
		$codigo=mysql_result($rs_lineas,$contador,"codigo");
		//$codfamilia=mysql_result($rs_lineas,$contador,"codfamilia");
		$cantidad=mysql_result($rs_lineas,$contador,"cantidad");
		$sel_actualizar="UPDATE articulos SET stock=(stock+'$cantidad') WHERE codarticulo='$codigo' ";//AND codfamilia='$codfamilia'
		$rs_actualizar = mysql_query($sel_actualizar);
		$contador++;
	}
	$sel_borrar = "DELETE FROM remilineap WHERE codalbaran='$codalbaran' AND codproveedor='$codproveedor'";
	$rs_borrar = mysql_query($sel_borrar);
	$sel_lineastmp = "SELECT * FROM remilineaptmp WHERE codalbaran='$codalbarantmp' ORDER BY numlinea";
	$rs_lineastmp = mysql_query($sel_lineastmp);
	$contador=0;
	$baseimponible=0;
	while ($contador < mysql_num_rows($rs_lineastmp)) {
		$numlinea=mysql_result($rs_lineastmp,$contador,"numlinea");
		$codigo=mysql_result($rs_lineastmp,$contador,"codigo");
		//$codfamilia=mysql_result($rs_lineastmp,$contador,"codfamilia");
		$cantidad=mysql_result($rs_lineastmp,$contador,"cantidad");
		$precio=mysql_result($rs_lineastmp,$contador,"precio");
		$importe=mysql_result($rs_lineastmp,$contador,"importe");
		$baseimponible=$baseimponible+$importe;
		$dcto=mysql_result($rs_lineastmp,$contador,"dcto");
	
		$sel_insert = "INSERT INTO remilineap (codalbaran,codproveedor,numlinea,codigo,cantidad,precio,importe,dcto) 
		VALUES ('$codalbaran','$codproveedor','','$codigo','$cantidad','$precio','$importe','$dcto')";//codfamilia, '$codfamilia',
		$rs_insert = mysql_query($sel_insert);
		
		$sel_actualiza="UPDATE articulos SET stock=(stock-'$cantidad') WHERE codarticulo='$codigo' ";//AND codfamilia='$codfamilia'
		$rs_actualiza = mysql_query($sel_actualiza);
		$sel_bajominimo = "SELECT stock,stock_minimo,descripcion FROM articulos WHERE codarticulo='$codigo'";// AND codfamilia='$codfamilia'
		$rs_bajominimo= mysql_query($sel_bajominimo);
		$stock=mysql_result($rs_bajominimo,0,"stock");
		$stock_minimo=mysql_result($rs_bajominimo,0,"stock_minimo");
		$descripcion=mysql_result($rs_bajominimo,0,"descripcion");
		
		if (($stock < $stock_minimo) or ($stock <= 0))
		   { 
			  $mensaje_minimo=$mensaje_minimo . " " . $descripcion."<br>";
			  $minimo=1;
		   };
		$contador++;
	}
	$baseimpuestos=$baseimponible*($iva/100);
	$preciototal=$baseimponible+$baseimpuestos;
	//$preciototal=number_format($preciototal,2);	
	$sel_act="UPDATE remitosp SET totalalbaran='$preciototal' WHERE codalbaran='$codalbaran'";
	$rs_act=mysql_query($sel_act);
	$baseimpuestos=0;
	$preciototal=0;
	$baseimponible=0;
	if ($rs_act) { $mensaje="Los datos de la orden de compra han sido modificados correctamente"; }
	$cabecera1="Inicio >> Compras &gt;&gt; Modificar Orden";
	$cabecera2="MODIFICAR ORDEN ";
}
//dar baja a una orden de compra
if ($accion=="baja") {
	$codalbaran=$_GET["codalbaran"];
	$codproveedor=$_GET["codproveedor"];
	$query="UPDATE remitosp SET borrado=1 WHERE codalbaran='$codalbaran'";
	$rs_query=mysql_query($query);
	$query="SELECT * FROM remilineap WHERE codalbaran='$codalbaran' AND codproveedor='$codproveedor' ORDER BY numlinea ASC";
	$rs_tmp=mysql_query($query);
	$contador=0;
	$baseimponible=0;
	while ($contador < mysql_num_rows($rs_tmp)) {
		//$codfamilia=mysql_result($rs_tmp,$contador,"codfamilia");
		$codigo=mysql_result($rs_tmp,$contador,"codigo");
		$cantidad=mysql_result($rs_tmp,$contador,"cantidad");
		$sel_articulos="UPDATE articulos SET stock=(stock+'$cantidad') WHERE codarticulo='$codigo'";// AND codfamilia='$codfamilia'
		$rs_articulos=mysql_query($sel_articulos);
		$contador++;
	}
	if ($rs_query) { $mensaje="La orden de compra ha sido eliminado correctamente"; }
	$cabecera1="Inicio >> Compras &gt;&gt; Eliminar Orden";
	$cabecera2="ELIMINAR ORDEN";
	$query_mostrar="SELECT * FROM remitosp WHERE codalbaran='$codalbaran' AND codproveedor='$codproveedor'";
	$rs_mostrar=mysql_query($query_mostrar);
	$codproveedor=mysql_result($rs_mostrar,0,"codproveedor");
	$fecha=mysql_result($rs_mostrar,0,"fecha");
	$iva=mysql_result($rs_mostrar,0,"iva");
}

if ($accion=="convertir") {
	$codalbaran=$_POST["codalbaran"];
	$fecha=$_POST["fecha"];
	$codfactura=$_POST["Acodfactura"];
	$fecha=explota($fecha);
	$query_comprobar="SELECT * FROM facturasp WHERE codfactura='$codfactura' AND codproveedor='$codproveedor'";
	$rs_comprobar=mysql_query($query_comprobar);
	if (mysql_num_rows($rs_comprobar) > 0 ) {
			?><script>
				alert ("No se puede dar de alta este numero de factura con este proveedor, ya existe uno en el sistema.");
				location.href="index.php";
			</script><?
	} else {
		$sel_orden="SELECT * FROM remitosp WHERE codalbaran='$codalbaran' AND codproveedor='$codproveedor'";//albaran
		$rs_orden=mysql_query($sel_orden);//albaran
		$iva=mysql_result($rs_orden,0,"iva");//albaran
		$codproveedor=mysql_result($rs_orden,0,"codproveedor");//
		$totalfactura=mysql_result($rs_orden,0,"totalalbaran");//albaran
		$sel_factura="INSERT INTO facturasp (codfactura,fecha,iva,codproveedor,estado,totalfactura,borrado) VALUES 
			('$codfactura','$fecha','$iva','$codproveedor','1','$totalfactura','0')";
		$rs_factura=mysql_query($sel_factura);
		//albaran           albaranesp
		$act_orden="UPDATE remitosp SET codfactura='$codfactura',estado='2' WHERE codalbaran='$codalbaran' AND codproveedor='$codproveedor'";
		$rs_act=mysql_query($act_orden);
		$sel_lineas="SELECT * FROM remilineap WHERE codalbaran='$codalbaran' AND codproveedor='$codproveedor' ORDER BY numlinea ASC";
		$rs_lineas=mysql_query($sel_lineas);
		$contador=0;
		while ($contador < mysql_num_rows($rs_lineas)) {
			//$codfamilia=mysql_result($rs_lineas,$contador,"codfamilia");
			$codigo=mysql_result($rs_lineas,$contador,"codigo");
			$cantidad=mysql_result($rs_lineas,$contador,"cantidad");
			$precio=mysql_result($rs_lineas,$contador,"precio");
			$importe=mysql_result($rs_lineas,$contador,"importe");
			$dcto=mysql_result($rs_lineas,$contador,"dcto");
			$sel_insert="INSERT INTO factulineap (codfactura,codproveedor,numlinea,codigo,cantidad,precio,importe,dcto) VALUES 
				('$codfactura','$codproveedor','','$codigo','$cantidad','$precio','$importe','$dcto')";//codfamilia,  '$codfamilia',
			$rs_insert=mysql_query($sel_insert);
			$contador++;
		}
		$mensaje="La orden de compra ha sido convertido correctamente";
		$cabecera1="Inicio >> Compras &gt;&gt; Convertir Orden";
		$cabecera2="CONVERTIR ORDEN";
	}
}

?>

<html>
	<head>
		<title>Principal</title>
		<link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		var cursor;
		if (document.all) {
		// Está utilizando EXPLORER
		cursor='hand';
		} else {
		// Está utilizando MOZILLA/NETSCAPE
		cursor='pointer';
		}
		
		function aceptar() {
			location.href="index.php";
		}
		
		function imprimir(codalbaran,codproveedor) {
			window.open("../fpdf/imprimir_remito_proveedor.php?codalbaran="+codalbaran+"&codproveedor="+codproveedor);
		}
		
		function imprimirf(codfactura,codproveedor) {
			window.open("../fpdf/imprimir_factura_proveedor.php?codfactura="+codfactura+"&codproveedor="+codproveedor);
		}
		
		</script>
	</head>
	<body>
		<div id="pagina">
			<div id="zonaContenido">
				<div align="center">
				<div id="tituloForm" class="header"><?php echo $cabecera2?></div>
				<div id="frmBusqueda">
					<table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0>
						<tr>
							<td width="15%"></td>
							<td width="85%" colspan="2" class="mensaje"><?php echo $mensaje;?></td>
					    </tr>
						<? 
						 $sel_proveedores="SELECT * FROM proveedores WHERE codproveedor='$codproveedor'"; 
						  $rs_proveedores=mysql_query($sel_proveedores); ?>
						<tr>
							<td width="15%">Proveedor</td>
							<td width="85%" colspan="2"><?php echo mysql_result($rs_proveedores,0,"nombre");?></td>
					    </tr>
						<tr>
							<td width="15%">CUIT</td>
						    <td width="85%" colspan="2"><?php echo mysql_result($rs_proveedores,0,"cuit");?></td>
					    </tr>
						<tr>
						  <td>Direcci&oacute;n</td>
						  <td colspan="2"><?php echo mysql_result($rs_proveedores,0,"direccion"); ?></td>
					  </tr>
						 <? if ($accion=="convertir") { ?>
						<tr>
						  <td>C&oacute;digo de factura</td>
						  <td colspan="2"><?php echo $codfactura?></td>
					  </tr>
					  <? } else { ?>
					  	<tr>
						  <td>C&oacute;digo O.de Compra</td>
						  <td colspan="2"><?php echo $codalbaran?></td>
					  </tr>
					  <? } ?>
					  <tr>
						  <td>Fecha</td>
						  <td colspan="2"><?php echo implota($fecha)?></td>
					  </tr>
					  <tr>
						  <td>IVA</td>
						  <td colspan="2"><?php echo $iva?> %</td>
					  </tr>
					  <tr>
						  <td></td>
						  <td colspan="2"></td>
					  </tr>
				  </table>
					 <table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0 ID="Table1">
						<tr class="cabeceraTabla">
							<td width="5%">ITEM</td>
							<td width="25%">REFERENCIA</td>
							<td width="30%">DESCRIPCION</td>
							<td width="10%">CANTIDAD</td>
							<td width="10%">PRECIO</td>
							<td width="10%">DCTO %</td>
							<td width="10%">IMPORTE</td>
						</tr>
					</table>
					<table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0 ID="Table1">
					  <? $sel_lineas="SELECT remilineap.*, articulos.descripcion, articulos.referencia FROM remilineap,articulos WHERE remilineap.codalbaran='$codalbaran' AND remilineap.codproveedor='$codproveedor' AND remilineap.codigo=articulos.codarticulo  ORDER BY remilineap.numlinea ASC";
					  /* <? $sel_lineas="SELECT albalineap.*, articulos.descripcion, articulos.referencia, familias.nombre as nombrefamilia FROM albalineap,articulos,familias WHERE albalineap.codalbaran='$codalbaran' AND albalineap.codproveedor='$codproveedor' AND albalineap.codigo=articulos.codarticulo AND albalineap.codfamilia=articulos.codfamilia AND articulos.codfamilia=familias.codfamilia ORDER BY albalineap.numlinea ASC";*/
$rs_lineas=mysql_query($sel_lineas);
						for ($i = 0; $i < mysql_num_rows($rs_lineas); $i++) {
							$numlinea=mysql_result($rs_lineas,$i,"numlinea");
							//$codfamilia=mysql_result($rs_lineas,$i,"codfamilia");
							//$nombrefamilia=mysql_result($rs_lineas,$i,"nombrefamilia");
							$referencia=mysql_result($rs_lineas,$i,"referencia");
							$codarticulo=mysql_result($rs_lineas,$i,"codigo");
							$descripcion=mysql_result($rs_lineas,$i,"descripcion");
							$cantidad=mysql_result($rs_lineas,$i,"cantidad");
							$precio=mysql_result($rs_lineas,$i,"precio");
							$importe=mysql_result($rs_lineas,$i,"importe");
							$baseimponible=$baseimponible+$importe;
							$descuento=mysql_result($rs_lineas,$i,"dcto");
							if ($i % 2) { $fondolinea="itemParTabla"; } else { $fondolinea="itemImparTabla"; } ?>
									<tr class="<? echo $fondolinea?>">
										<td width="5%" class="aCentro"><? echo $i+1?></td>
										<td width="25%"><? echo $referencia?></td>
										<td width="30%"><? echo $descripcion?></td>
										<td width="10%" class="aCentro"><? echo $cantidad?></td>
										<td width="10%" class="aCentro"><? echo $precio?></td>
										<td width="10%" class="aCentro"><? echo $descuento?></td>
										<td width="10%" class="aCentro"><? echo $importe?></td>
									</tr>
					<? } ?>
					</table>
			  </div>
				  <?
				  $baseimpuestos=$baseimponible*($iva/100);
			      $preciototal=$baseimponible+$baseimpuestos;
			      $preciototal=number_format($preciototal,2,".",",");
			  	  ?>
					<div id="frmBusqueda">
					<table width="25%" border=0 align="right" cellpadding=3 cellspacing=0 class="fuente8">
						<tr>
							<td width="15%">Base imponible</td>
							<td width="15%" align="right"><? echo $simbolomoneda ?><?php echo number_format($baseimponible,2,".",",");?></td>
						</tr>
						<tr>
							<td width="15%">IVA</td>
							<td width="15%" align="right"><? echo $simbolomoneda ?><?php echo number_format($baseimpuestos,2,".",",");?></td>
						</tr>
						<tr>
							<td width="15%">Total</td>
							<td width="15%" align="right"><? echo $simbolomoneda ?><?php echo $preciototal?></td>
						</tr>
					</table>
			  </div>
			  <? if ($accion=="baja") { 
					  $query="DELETE FROM remitosp WHERE codalbaran='$codalbaran' AND codproveedor='$codproveedor'";
						$rs_query=mysql_query($query);
						$borrar_lineas="DELETE FROM remilineap WHERE codalbaran='$codalbaran' AND codproveedor='$codproveedor'";
						$rs_borrar_lineas=mysql_query($borrar_lineas);
				} ?>
				<div id="botonBusqueda">
					<div align="center">
					  <img src="../img/botonaceptar.jpg" width="85" height="22" onClick="aceptar()" border="1" onMouseOver="style.cursor=cursor">
					  <? if ($accion<>"baja") { ?>
						   <? if ($accion=="convertir") { ?>
						   <img src="../img/botonimprimir.jpg" width="79" height="22" border="1" onClick="imprimirf('<? echo $codfactura?>',<? echo $codproveedor ?>)" onMouseOver="style.cursor=cursor">
						   <? } else { ?>
						   <img src="../img/botonimprimir.jpg" width="79" height="22" border="1" onClick="imprimir('<? echo $codalbaran?>',<? echo $codproveedor ?>)" onMouseOver="style.cursor=cursor">
						   <? } ?>
				 <? } ?>
				        </div>
					</div>
			  </div>
		  </div>
		</div>
	</body>
</html>
