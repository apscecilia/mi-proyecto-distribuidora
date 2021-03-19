<?php
header('Cache-Control: no-cache');
header('Pragma: no-cache'); 
?>
<html>
<head>
<link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
</head>
<script language="javascript">
//INDEX-NUEVA FACTURA-COMROBAR PROVV
function pon_prefijo(nombre,cuit) {
	parent.document.formulario.nombre.value=nombre;
	parent.document.formulario.cuit.value=cuit;
}

function limpiar() {
	parent.document.formulario.nombre.value="";
	parent.document.formulario.cuit.value="";
	parent.document.formulario.codproveedor.value="";
}

</script>
<? include ("../conectar.php"); ?>
<body>
<?
	$codproveedor=$_GET["codproveedor"];
	$consulta="SELECT * FROM proveedores WHERE codproveedor='$codproveedor' AND borrado=0";
	$rs_tabla = mysql_query($consulta);
	if (mysql_num_rows($rs_tabla)>0) {
		?>
		<script languaje="javascript">
		pon_prefijo("<? echo mysql_result($rs_tabla,0,nombre) ?>","<? echo mysql_result($rs_tabla,0,cuit) ?>");
		</script>
		<? 
	} else { ?>
	<script>
	alert ("No existe ningun proveedor con ese codigo");
	limpiar();
	</script>
	<? }
?>
</div>
</body>
</html>
