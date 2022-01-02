<?php 
include '../../modelo/modelo_sedes.php';

 $MS = new Modelo_Sedes();
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
$ciudad = htmlspecialchars($_POST['ciudad'],ENT_QUOTES,'UTF-8');

$consulta =$MS->Registrar_Sedes($nombre,$ciudad);
echo $consulta;





 ?>