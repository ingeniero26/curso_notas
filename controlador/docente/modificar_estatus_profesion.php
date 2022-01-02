<?php 
 include '../../modelo/modelo_profesion.php';

 $MP = new Modelo_Profesion();
$profesion_id = htmlspecialchars($_POST['profesion_id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MP->Modificar_Estatus_Profesion($profesion_id,$estatus);
echo $consulta;





 ?>