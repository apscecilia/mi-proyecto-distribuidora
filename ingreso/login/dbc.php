<?php
// Variables para la conexión

global $Usuario;  /*root*/
global $Password;
global $Servidor; /*localhost*/
global $BaseDeDatos;

$Usuario="usuario";         /* nombre de usuario de la base de datos */
$Password="usuario";      /* Contraseña de la base de datos */
$Servidor="localhost";   /* Servidor , generalmente localhost*/
$BaseDeDatos="users"; /* Nombre de la base de datos */
$dbname = $BaseDeDatos;
$link = mysql_connect($Servidor,$Usuario,$Password) or die("Couldn't make connection.");
$db = mysql_select_db($dbname, $link) or die("Couldn't select database");
?>