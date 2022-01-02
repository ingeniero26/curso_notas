<?php 
include '../../modelo/modelo_sedes.php';

 $MS = new Modelo_Sedes();
$sede_id = htmlspecialchars($_POST['sede_id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MS->Modificar_Estatus_Sede($sede_id,$estatus);
echo $consulta;





 ?>