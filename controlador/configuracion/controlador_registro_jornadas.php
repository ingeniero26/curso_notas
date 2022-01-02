<?php 
  include '../../modelo/modelo_jornadas.php';

 $MR = new Modelo_Jornadas();
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');


$consulta =$MR->Registrar_Jornada($nombre);
echo $consulta;





 ?>