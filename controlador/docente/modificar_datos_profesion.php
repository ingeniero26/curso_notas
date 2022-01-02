<?php 
 include '../../modelo/modelo_profesion.php';

 $MP = new Modelo_Profesion();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$profesion_actual = htmlspecialchars($_POST['profesion_actual'],ENT_QUOTES,'UTF-8');
$profesion_nuevo = htmlspecialchars($_POST['profesion_nuevo'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');
$consulta =$MP->Modificar_Profesion($id,$profesion_actual,$profesion_nuevo,$estatus);
echo $consulta;





 ?>