<?php 
 include '../../modelo/modelo_profesion.php';

 $MP = new Modelo_Profesion();
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');

$consulta =$MP->Registrar_Profesion($nombre);
echo $consulta;





 ?>