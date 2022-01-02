<?php 
include '../../modelo/modelo_asignaturas.php';

 $MR = new Modelo_Asignaturas();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MR->Modificar_Estatus_Asignatura($id,$estatus);
echo $consulta;





 ?>