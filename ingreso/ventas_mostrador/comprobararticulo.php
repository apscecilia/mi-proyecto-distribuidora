<?php
header('Cache-Control: no-cache');
header('Pragma: no-cache'); 
?>
<html>
<head>
<link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
</head>
<script language="javascript">

function pon_prefijo(descripcion,precio_pvp) {
	opener.document.formulario_lineas.descripcion.value=descripcion;
	opener.document.formulario_lineas.precio.value=precio_pvp;
	opener.document.formulario_lineas.importe.value=precio_pvp;
}

function limpiar() {
	opener.document.formulario_lineas.descripcion.value="";
	opener.document.formulario_lineas.precio.value="";
	opener.document.formulario_lineas.codart.value="";//codbarras
	opener.document.formulario_lineas.codart.focus();//codbarras
}

</script>
<? include ("../conectar.php"); ?>
<body>
<?
	$codart=$_GET["codart"];//codbarras
	$consulta="SELECT * FROM articulos WHERE codarticulo='$codart' AND borrado=0";
	$rs_tabla = mysql_query($consulta);
	if (mysql_num_rows($rs_tabla)>0) {
		?>
		<script languaje="javascript">
		pon_prefijo('<? echo mysql_result($rs_tabla,0,descripcion) ?>','<? echo mysql_result($rs_tabla,0,precio_almacen) ?>');//_tienda
		</script>
		<? 
	} else { ?>
	<script>
	alert ("No existe ningun articulo con ese codigo articulo");
	limpiar();
	</script>
	<? }
?>
</div>
</body>
</html>
