<?php 
  include '../../modelo/modelo_jornadas.php';

 $MR = new Modelo_Jornadas();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MR->Modificar_Estatus_Jornada($id,$estatus);
echo $consulta;





 ?>