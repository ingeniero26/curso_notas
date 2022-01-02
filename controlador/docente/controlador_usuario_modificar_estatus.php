<?php 
  include '../../modelo/modelo_docente.php';

 $MP = new Modelo_Docente();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MP->Modificar_Estatus_Docente($id,$estatus);
echo $consulta;





 ?>