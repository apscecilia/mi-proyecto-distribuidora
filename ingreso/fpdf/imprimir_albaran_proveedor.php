<?php


define('FPDF_FONTPATH','font/');
require('mysql_table.php');
include("comunes.php");
include ("../conectar.php");
include ("../funciones/fechas.php"); 

$pdf=new PDF();
$pdf->Open();
$pdf->AddPage();

$pdf->Ln(10);


include ("../conectar.php");
  
$codalbaran=$_GET["codalbaran"];
$codproveedor=$_GET["codproveedor"];
  
$consulta = "Select * from albaranesp,proveedores where albaranesp.codalbaran='$codalbaran' and albaranesp.codproveedor='$codproveedor' and albaranesp.codproveedor=proveedores.codproveedor";
$resultado = mysql_query($consulta, $conexion);
$lafila=mysql_fetch_array($resultado);
	$pdf->Cell(95);
    $pdf->Cell(80,4,"",'',0,'C');
    $pdf->Ln(4);
	
    $pdf->SetFillColor(255,255,255);
    $pdf->SetTextColor(0);
    $pdf->SetDrawColor(0,0,0);
    $pdf->SetLineWidth(.2);
    $pdf->SetFont('Arial','B',10);	
	
    $pdf->Cell(40,65,'RECIBO DE MERCANC?A');
	$pdf->SetX(10);	

    $pdf->Cell(95);
    $pdf->Cell(80,4,"",'LRT',0,'L',1);
    $pdf->Ln(4);
	
    $pdf->Cell(95);
    $pdf->Cell(80,4,$lafila["nombre"],'LR',0,'L',1);
    $pdf->Ln(4);

    $pdf->Cell(95);
    $pdf->Cell(80,4,$lafila["direccion"],'LR',0,'L',1);
    $pdf->Ln(4);
	
	//Calculamos la provincia
	$codigoprovincia=$lafila["codprovincia"];
	$consulta="select * from provincias where codprovincia='$codigoprovincia'";
	$query=mysql_query($consulta);
	$row=mysql_fetch_array($query);

	$pdf->Cell(95);
    $pdf->Cell(80,4,$lafila["codpostal"] . "  " . $lafila["localidad"] . ", " . $row["nombreprovincia"],'LR',0,'L',1);
    $pdf->Ln(4);		
	
    $pdf->Cell(95);
    // Solo incluyo el telefono principal, no el celular.
    // $pdf->Cell(80,4,"Tel: " . $lafila["telefono"] . "  " . "Movil: " . $lafila["movil"],'LR',0,'L',1);
    $pdf->Cell(80,4,"Tel.: " . $lafila["telefono"] ,'LR',0,'L',1);
    $pdf->Ln(4);
	
    $pdf->Cell(95);
    $pdf->Cell(80,4,"",'LRB',0,'L',1);
    $pdf->Ln(10);					

    $pdf->SetFillColor(255,191,116);
    $pdf->SetTextColor(0);
    $pdf->SetDrawColor(0,0,0);
    $pdf->SetLineWidth(.2);
    $pdf->SetFont('Arial','B',8);
	
    $pdf->Cell(80);
    $pdf->Cell(30,4,"RFC",1,0,'C',1);
	$pdf->Cell(30,4,"Cod. Proveedor",1,0,'C',1);
	$pdf->Cell(30,4,"Fecha",1,0,'C',1);	
	$pdf->Cell(20,4,"Ref.Proveedor",1,0,'C',1);
	$pdf->Ln(4);
	
	$pdf->Cell(80);
	$pdf->SetFillColor(255,255,255);
    $pdf->SetTextColor(0);
    $pdf->SetDrawColor(0,0,0);
    $pdf->SetLineWidth(.2);
    $pdf->SetFont('Arial','',8);
	
	$fecha = implota($lafila["fecha"]);
	
    $pdf->Cell(30,4,$lafila["nif"],1,0,'C',1);
	$pdf->Cell(30,4,$lafila["codproveedor"],1,0,'C',1);
	$pdf->Cell(30,4,$fecha,1,0,'C',1);	
	$pdf->Cell(20,4,$codalbaran,1,0,'C',1);		
	
	
	//ahora mostramos las lneas del albarn
	$pdf->Ln(10);		
	$pdf->Cell(1);
	
	$pdf->SetFillColor(255,191,116);
    $pdf->SetTextColor(0);
    $pdf->SetDrawColor(0,0,0);
    $pdf->SetLineWidth(.2);
    $pdf->SetFont('Arial','B',8);
	
    $pdf->Cell(40,4,"Referencia",1,0,'C',1);
	$pdf->Cell(80,4,"Descripci?n",1,0,'C',1);
	$pdf->Cell(20,4,"Cantidad",1,0,'C',1);	
	$pdf->Cell(15,4,"Precio",1,0,'C',1);
	$pdf->Cell(15,4,"% Desc.",1,0,'C',1);	
	$pdf->Cell(20,4,"Importe",1,0,'C',1);
	$pdf->Ln(4);
			
			
	$pdf->SetFillColor(224,235,255);
    $pdf->SetTextColor(0);
    $pdf->SetDrawColor(0,0,0);
    $pdf->SetLineWidth(.2);
    $pdf->SetFont('Arial','',8);

	
	$consulta2 = "Select * from albalineap where codalbaran='$codalbaran' and codproveedor='$codproveedor' order by numlinea";
    $resultado2 = mysql_query($consulta2, $conexion);
    
	$contador=1;
	while ($row=mysql_fetch_array($resultado2))
	{
	  $pdf->Cell(1);
	  $contador++;
	  $codarticulo=mysql_result($resultado2,$lineas,"codigo");
	  $codfamilia=mysql_result($resultado2,$lineas,"codfamilia");
	  $sel_articulos="SELECT * FROM articulos WHERE codarticulo='$codarticulo' AND codfamilia='$codfamilia'";
	  $rs_articulos=mysql_query($sel_articulos);
	  $pdf->Cell(40,4,mysql_result($rs_articulos,0,"referencia"),'LR',0,'L');
	  
	  $acotado = substr(mysql_result($rs_articulos,0,"descripcion"), 0, 45);
	  $pdf->Cell(80,4,$acotado,'LR',0,'L');
	  
	  $pdf->Cell(20,4,mysql_result($resultado2,$lineas,"cantidad"),'LR',0,'C');	
	  
	  $precio2= number_format(mysql_result($resultado2,$lineas,"precio"),2,".",",");	  
	  $pdf->Cell(15,4,$precio2,'LR',0,'R');
	  
	  if (mysql_result($resultado2,$lineas,"dcto")==0) 
	  {
	  $pdf->Cell(15,4,"",'LR',0,'C');
	  } 
	  else 
	   { 
		$pdf->Cell(15,4,mysql_result($resultado2,$lineas,"dcto") . " %",'LR',0,'C');
	   }
	  
	  $importe2= number_format(mysql_result($resultado2,$lineas,"importe"),2,".",",");	  
	  
	  $pdf->Cell(20,4,$importe2,'LR',0,'R');
	  $pdf->Ln(4);	


	  //vamos acumulando el importe
	  $importe=$importe + mysql_result($resultado2,$lineas,"importe");
	  $contador=$contador + 1;
	  $lineas=$lineas + 1;
	  
	};
	
	while ($contador<35)
	{
	  $pdf->Cell(1);
      $pdf->Cell(40,4,"",'LR',0,'C');
      $pdf->Cell(80,4,"",'LR',0,'C');
	  $pdf->Cell(20,4,"",'LR',0,'C');	
	  $pdf->Cell(15,4,"",'LR',0,'C');
	  $pdf->Cell(15,4,"",'LR',0,'C');
	  $pdf->Cell(20,4,"",'LR',0,'C');
	  $pdf->Ln(4);	
	  $contador=$contador +1;
	}

	  $pdf->Cell(1);
      $pdf->Cell(40,4,"",'LRB',0,'C');
      $pdf->Cell(80,4,"",'LRB',0,'C');
	  $pdf->Cell(20,4,"",'LRB',0,'C');	
	  $pdf->Cell(15,4,"",'LRB',0,'C');
	  $pdf->Cell(15,4,"",'LRB',0,'C');
	  $pdf->Cell(20,4,"",'LRB',0,'C');
	  $pdf->Ln(4);	


	//ahora mostramos el final de la factura
	$pdf->Ln(10);		
	$pdf->Cell(66);
	
	$pdf->SetFillColor(255,191,116);
    $pdf->SetTextColor(0);
    $pdf->SetDrawColor(0,0,0);
    $pdf->SetLineWidth(.2);
    $pdf->SetFont('Arial','B',8);
	
    $pdf->Cell(30,4,"Subtotal",1,0,'C',1);
	$pdf->Cell(30,4,"Cuota IVA",1,0,'C',1);
	$pdf->Cell(30,4,"IVA",1,0,'C',1);	
	$pdf->Cell(35,4,"TOTAL",1,0,'C',1);
	$pdf->Ln(4);
	
    $pdf->SetFillColor(255,255,255);
    $pdf->SetTextColor(0);
    $pdf->SetDrawColor(0,0,0);
    $pdf->SetLineWidth(.2);
    $pdf->SetFont('Arial','',8);
	
	$pdf->Cell(66);
    $importe4=number_format($importe,2,".",",");	
    $pdf->Cell(30,4,$importe4,1,0,'R',1);
	$pdf->Cell(30,4,$lafila["iva"] . "%",1,0,'C',1);
	
	$ivai=$lafila["iva"];
	$impo=$importe*($ivai/100);
	$impo=sprintf("%01.2f", $impo); 
	$total=$importe+$impo; 
	$total=sprintf("%01.2f", $total);

	$impo=number_format($impo,2,".",",");	
	$pdf->Cell(30,4,"$impo",1,0,'R',1);	
    $total=sprintf("%01.2f", $total);
	$total2= number_format($total,2,".",",");	
	$pdf->Cell(35,4, $simbolomoneda . "$total2",1,0,'R',1);
	$pdf->Ln(4);


      @mysql_free_result($resultado); 
      @mysql_free_result($query);
	  @mysql_free_result($resultado2); 
	  @mysql_free_result($query3);

$pdf->Output();
?>