<?php
session_start();
if (!isset($_SESSION['user']))
{
 die ("Access Denied");
}
?> 
<h2>MI CUENTA</h2>
<?php if (isset($_SESSION['user'])) { ?>
        <p>USUARIO<?php echo $_SESSION['user']; ?> | <a href="cambiar.php">CONFIGURACI&Oacute;N</a> | <a href="salir.php">SALIR</a> </p>
<?php } ?>  
