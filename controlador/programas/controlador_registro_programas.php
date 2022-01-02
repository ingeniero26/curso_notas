<?php 
 include '../../modelo/modelo_programas.php';

 $MR = new Modelo_Programas();
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
$idsede = htmlspecialchars($_POST['idsede'],ENT_QUOTES,'UTF-8');

$consulta =$MR->Registrar_Programas($nombre,$idsede);
echo $consulta;





 ?>