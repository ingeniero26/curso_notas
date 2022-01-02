<?php 
 include '../../modelo/modelo_programas.php';

 $MR = new Modelo_Programas();
$programa_id = htmlspecialchars($_POST['programa_id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MR->Modificar_Estatus_Programa($programa_id,$estatus);
echo $consulta;





 ?>