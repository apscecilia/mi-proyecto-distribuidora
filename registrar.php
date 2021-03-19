<?php 
session_start();

//include ('../config.php'); 
include ('../conectar.php');
//include ('dbc.php'); 

if ($_POST['Submit'] == 'Registrar')
{
   if (strlen($_POST['email']) < 5)
   {
    die ("Correo electr&Oacute;nico incorrecta. Por favor, introduzca la direcci&Oacute;n de correo electr&Oacute;nico válida..");
    }
   if (strcmp($_POST['pass1'],$_POST['pass2']) || empty($_POST['pass1']) )
	{ 
	//die ("Password does not match");
	die("ERROR:  contrasenia no coinciden o esta vacia..");//son incorectas o vacias
	}
	
	$rs_duplicates = mysql_query("select id from users where user_email='$_POST[email]'");
	$duplicates = mysql_num_rows($rs_duplicates);
	
	if ($duplicates > 0)
	{	
	//die ("ERROR: User account already exists.");
	header("Location: registrar.php?msg=ERROR:  La cuenta de usuario ya existe ..");
	exit();
	}
		
	$md5pass = md5($_POST['pass2']);
	$activ_code = rand(1000,9999);
	$server = $_SERVER['HTTP_HOST'];
	$host = ereg_replace('www.','',$server);
	mysql_query("INSERT INTO users
	              (`user_email`,`user_pwd`,`country`,`joined`,`activation_code`,`full_name`,`user_activated`)
				  VALUES
				  ('$_POST[email]','$md5pass','$_POST[country]',now(),'$activ_code','$_POST[full_name]','1')") or die(mysql_error());
	
	$message = 
"Thank you for registering an account with $server. Here are the login details...\n
Gracias por registrarse en $server. Este es el detalle de sus datos ...\n\n

Email: $_POST[email] \n
Clave: $_POST[pass2] \n

______________________________________________________________
Thank you. This is an automated response. PLEASE DO NOT REPLY.
Gracias, esta es una respuesta automática, favor no responda.
";

	mail($_POST['email'], "Registro de usuario", $message, "From: Sistema de Facturación <administrador@$host>\r\n" );
	unset($_SESSION['ckey']);
	echo("Gracias por registrase!, un email fue enviado a su correo con los datos de activación...");	
	exit;
}	

?> 
<link href="styles.css" rel="stylesheet" type="text/css">
<?php if (isset($_GET['msg'])) { echo "<div class=\"msg\"> $_GET[msg] </div>"; } ?>
<p>&nbsp;</p>
<table width="65%" border="2" align="Center" cellpadding="0" cellspacing="0">
  <tr> 
    <td bgcolor="d5e8f9" align="Center" class="mnuheader"><strong><font size="5">Registro de Usuarios</font></strong></td>
  </tr>
  <tr> 
    <td bgcolor="e5ecf9" class="forumposts"><form name="form1" method="post" action="registrar.php" style="padding:5px;">
        <p><br>
        Ingrese Nombre: 
          <input name="full_name" type="text" id="full_name">
          Ej. David Arce </p>
        <p>Ingrese E-mail: 
          <input name="email" type="text" id="email">
          Ej. david@gmail.com</p>
         <!--<p>Ingrese nombre de usuario: 
          <input name="user_name" type="text" id="user_name">
         Ej. david2013 </p>-->
        <p>Ingrese Clave: 
          <input name="pass1" type="password" id="pass1">
          Mínimo 5 caracteres</p>
        <p>Reingrese la Clave: 
          <input name="pass2" type="password" id="pass2">
        </p>
      
        <p>Ingrese Código de Seguridad: 
          <input name="user_code" type="text" size="10" id="user_code">
          <img src="pngimg.php" align="middle">&nbsp;<!-- //genera codigo seguridad-->
		</p>
        <p align="center"> 
          <input type="submit" name="Submit" value="Registrar">
        </p>
      </form></td>
  </tr>
</table>
<div align="left"></div>
</body>
</html>