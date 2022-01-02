<?php 
  include '../../modelo/modelo_estudiantes.php';

 $MR = new Modelo_Estudiantes();
$documento = htmlspecialchars($_POST['documento'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MR->Modificar_Estatus_Estudiante($documento,$estatus);
echo $consulta;





 ?>