<?php
header('Cache-Control: no-cache');
header('Pragma: no-cache'); 
?>
<html>
<head>
<link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
</head>
<script language="javascript">
						//codfamilia,
function pon_prefijo(codarticulo,pref,nombre,precio) {
	//parent.opener.document.formulario_lineas.codfamilia.value=codfamilia;
	parent.opener.document.formulario_lineas.codarticulo.value=codarticulo;
	parent.opener.document.formulario_lineas.referencia.value=pref;
	parent.opener.document.formulario_lineas.descripcion.value=nombre;
	parent.opener.document.formulario_lineas.precio.value=precio;
	
	parent.opener.actualizar_importe();
	parent.window.close();
}

</script>
<? include ("../conectar.php"); 
//$familia=$_POST["cmbfamilia"];
$codarticulo=$_POST["codarticulo"];
$referencia=$_POST["referencia"];
$descripcion=$_POST["descripcion"];
$where="1=1";

//if ($codarticulo<>0) { $where.=" AND articulos.codarticulo='$codarticulo'"; }
if ($codarticulo<>"") { $where.=" AND codarticulo like '%$codarticulo%'"; }
if ($referencia<>"") { $where.=" AND referencia like '%$referencia%'"; }
if ($descripcion<>"") { $where.=" AND descripcion like '%$descripcion%'"; } ?>
<body>
<?
	
	$consulta="SELECT articulos.* FROM articulos WHERE ".$where." AND  articulos.borrado=0 ORDER BY articulos.descripcion ASC";
	$rs_tabla = mysql_query($consulta);
	$nrs=mysql_num_rows($rs_tabla);
?>
<div id="tituloForm2" class="header">
<form id="form1" name="form1">
<? if ($nrs>0) { ?>
		<table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0>
		  <tr>
			<td width="20%"><div align="center"><b>Codigo</b></div></td>
			<td width="20%"><div align="center"><b>Referencia</b></div></td>
			<td width="40%"><div align="center"><b>Descripci&oacute;n</b></div></td>
			<td width="10%"><div align="center"><b>Precio</b></div></td>
			<td width="10%"><div align="center"></td>
		  </tr>
		<?php
			for ($i = 0; $i < mysql_num_rows($rs_tabla); $i++) {
				//$codfamilia=mysql_result($rs_tabla,$i,"codfamilia");
			//	$nombrefamilia=mysql_result($rs_tabla,$i,"nombrefamilia");
				$referencia=mysql_result($rs_tabla,$i,"referencia");
				$codarticulo=mysql_result($rs_tabla,$i,"codarticulo");				
				$descripcion=mysql_result($rs_tabla,$i,"descripcion");
				$precio=mysql_result($rs_tabla,$i,"precio_almacen");
				 if ($i % 2) { $fondolinea="itemParTabla"; } else { $fondolinea="itemImparTabla"; }?>
						<tr class="<?php echo $fondolinea?>">
					<!--<td>
        <div align="center"><?php echo $nombrefamilia;?></div></td>-->
        <td>
        <div align="left"><?php echo $codarticulo;?></div></td>
					<td>
        <div align="left"><?php echo $referencia;?></div></td>
					<td><div align="center"><?php echo $descripcion;?></div></td>
					<td><div align="center"><?php echo $precio;?></div></td>
					<td align="center"><div align="center"><a href="javascript:pon_prefijo(<?php echo $codarticulo?>,'<?php echo $referencia?>','<?php echo str_replace('"','',$descripcion)?>','<?php echo $precio?>',<? echo $codarticulo?>)"><img src="../img/convertir.png" border="0" title="Seleccionar"></a></div></td>					
				</tr>
			<?php }
		?>
  </table>
	<?php 
		}  ?>
<iframe id="frame_datos" name="frame_datos" width="0%" height="0" frameborder="0">
	<ilayer width="0" height="0" id="frame_datos" name="frame_datos"></ilayer>
</iframe>
<input type="hidden" id="accion" name="accion">
</form>
</div>
</body>
</html>
