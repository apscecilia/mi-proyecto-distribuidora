<?php
include ("../conectar.php");

$codproveedor=$_POST["codproveedor"];
$nombre=$_POST["nombre"];
$cuit=$_POST["cuit"];
$codprovincia=$_POST["cboProvincias"];
$localidad=$_POST["localidad"];
$telefono=$_POST["telefono"];
$cadena_busqueda=$_POST["cadena_busqueda"];

$where="1=1";
if ($codproveedor <> "") { $where.=" AND codproveedor='$codproveedor'"; }
if ($nombre <> "") { $where.=" AND nombre like '%".$nombre."%'"; }
if ($cuit <> "") { $where.=" AND cuit like '%".$cuit."%'"; }
if ($codprovincia > "0") { $where.=" AND codprovincia='$codprovincia'"; }
if ($localidad <> "") { $where.=" AND localidad like '%".$localidad."%'"; }
if ($telefono <> "") { $where.=" AND telefono like '%".$telefono."%'"; }

$where.=" ORDER BY nombre ASC";
$query_busqueda="SELECT count(*) as filas FROM proveedores WHERE borrado=0 AND ".$where;
$rs_busqueda=mysql_query($query_busqueda);
$filas=mysql_result($rs_busqueda,0,"filas");

?>
<html>
	<head>
		<title>Proveedores</title>
		<link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		
		function ver_proveedor(codproveedor) {
			parent.location.href="ver_proveedor.php?codproveedor=" + codproveedor + "&cadena_busqueda=<? echo $cadena_busqueda?>";
		}
		
		function modificar_proveedor(codproveedor) {
			parent.location.href="modificar_proveedor.php?codproveedor=" + codproveedor + "&cadena_busqueda=<? echo $cadena_busqueda?>";
		}
		
		function eliminar_proveedor(codproveedor) {
			parent.location.href="eliminar_proveedor.php?codproveedor=" + codproveedor + "&cadena_busqueda=<? echo $cadena_busqueda?>";
		}

		function inicio() {
			var numfilas=document.getElementById("numfilas").value;
			var indi=parent.document.getElementById("iniciopagina").value;
			var contador=1;
			var indice=0;
			if (indi>numfilas) { 
				indi=1; 
			}
			parent.document.form_busqueda.filas.value=numfilas;
			parent.document.form_busqueda.paginas.innerHTML="";		
			while (contador<=numfilas) {
				texto=contador + "-" + parseInt(contador+9);
				if (indi==contador) {
					parent.document.form_busqueda.paginas.options[indice]=new Option (texto,contador);
					parent.document.form_busqueda.paginas.options[indice].selected=true;
				} else {
					parent.document.form_busqueda.paginas.options[indice]=new Option (texto,contador);
				}
				indice++;
				contador=contador+10;
			}
		}
		</script>
	</head>

	<body onload=inicio()>	
		<div id="pagina">
			<div id="zonaContenidoPP">
			<div align="center">
			<table class="fuente8" width="100%" cellspacing=0 cellpadding=3 border=0 ID="Table1" align="center">
			<input type="hidden" name="numfilas" id="numfilas" value="<? echo $filas?>">
				<? $iniciopagina=$_POST["iniciopagina"];
				if (empty($iniciopagina)) { $iniciopagina=$_GET["iniciopagina"]; } else { $iniciopagina=$iniciopagina-1;}
				if (empty($iniciopagina)) { $iniciopagina=0; }
				if ($iniciopagina>$filas) { $iniciopagina=0; }
					if ($filas > 0) { ?>
						<? $sel_resultado="SELECT * FROM proveedores WHERE borrado=0 AND ".$where;
						   $sel_resultado=$sel_resultado."  limit ".$iniciopagina.",10";
						   $res_resultado=mysql_query($sel_resultado);
						   $contador=0;
						   while ($contador < mysql_num_rows($res_resultado)) {
								 if ($contador % 2) { $fondolinea="itemParTabla"; } else { $fondolinea="itemImparTabla"; }?>
						<tr class="<?php echo $fondolinea?>">
							<td class="aCentro" width="8%"><? echo $contador+1;?></td>
							<td width="6%"><div align="center"><? echo mysql_result($res_resultado,$contador,"codproveedor")?></div></td>
							<td width="38%"><div align="left"><? echo mysql_result($res_resultado,$contador,"nombre")?></div></td>
							<td class="aDerecha" width="13%"><div align="center"><? echo mysql_result($res_resultado,$contador,"cuit")?></div></td>
							<td class="aDerecha" width="19%"><div align="center"><? echo mysql_result($res_resultado,$contador,"telefono")?></div></td>
							<td width="5%"><div align="center"><a href="#"><img src="../img/modificar.png" width="16" height="16" border="0" onClick="modificar_proveedor(<?php echo mysql_result($res_resultado,$contador,"codproveedor")?>)" title="Modificar"></a></div></td>
														<td width="5%"><div align="center"><a href="#"><img src="../img/ver.png" width="16" height="16" border="0" onClick="ver_proveedor(<?php echo mysql_result($res_resultado,$contador,"codproveedor")?>)" title="Visualizar"></a></div></td>
							<td width="6%"><div align="center"><a href="#"><img src="../img/eliminar.png" width="16" height="16" border="0" onClick="eliminar_proveedor(<?php echo mysql_result($res_resultado,$contador,"codproveedor")?>)" title="Eliminar"></a></div></td>
						</tr>
						<? $contador++;
							}
						?>			
					</table>
					<? } else { ?>
					<table class="fuente8" width="87%" cellspacing=0 cellpadding=3 border=0>
						<tr>
							<td width="100%" class="mensaje"><?php echo "No hay ning&uacute;n proveedor que cumpla con los criterios de b&uacute;squeda";?></td>
					    </tr>
					</table>					
					<? } ?>					
				</div>
			</div>
		  </div>			
		</div>
	</body>
</html>
