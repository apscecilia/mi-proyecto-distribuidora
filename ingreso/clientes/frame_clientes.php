<?php
header('Cache-Control: no-cache');
header('Pragma: no-cache'); 
?>
<html>
<head>
<link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
</head>
<script language="javascript">

function pon_prefijo(pref,nombre,cuil) {
	parent.opener.document.form_busqueda.codcliente.value=pref;
	parent.opener.document.form_busqueda.nombre.value=nombre;
	parent.opener.document.form_busqueda.cuil.value=cuil;
	parent.window.close();//sak ,nif
}

</script>
<? include ("../conectar.php"); ?>
<body>
<?
	
	$consulta="SELECT * FROM clientes WHERE borrado=0 ORDER BY codcliente ASC";
	$rs_tabla = mysql_query($consulta);
	$nrs=mysql_num_rows($rs_tabla);
?>
<div id="tituloForm2" class="header">
<div align="center">
<form id="form1" name="form1">
<? if ($nrs>0) { ?>
		<table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0>
		  <tr>
			<td width="10%"><div align="center"><b>Codigo</b></div></td>
			<td width="60%"><div align="center"><b>Cliente</b></div></td>
			<td width="20%"><div align="center"><b>CUIL</b></div></td>
			<td width="10%"><div align="center"></td>
		  </tr>
		<?php
			for ($i = 0; $i < mysql_num_rows($rs_tabla); $i++) {
				$codcliente=mysql_result($rs_tabla,$i,"codcliente");
				$nombre=mysql_result($rs_tabla,$i,"nombre");
				$cuil=mysql_result($rs_tabla,$i,"cuil");
				 if ($i % 2) { $fondolinea="itemParTabla"; } else { $fondolinea="itemImparTabla"; }?>
						<tr class="<?php echo $fondolinea?>">
					<td>
        <div align="center"><?php echo $codcliente;?></div></td>
					<td>
        <div align="left"><?php echo utf8_encode($nombre);?></div></td>
					<td><div align="center"><?php echo $cuil;?></div></td>
					<td align="center"><div align="center"><a href="javascript:pon_prefijo(<?php echo $codcliente?>,'<?php echo $nombre?>','<?php echo $cuil?>')"><img src="../img/convertir.png" border="0" title="Seleccionar"></a></div></td>					
				</tr>
			<?php }//,'<?php echo $nif?>'
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
</div>
</body>
</html>
