<?php 
include '../../modelo/modelo_sedes.php';

 $MS = new Modelo_Sedes();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$sede_actual = htmlspecialchars($_POST['sede_actual'],ENT_QUOTES,'UTF-8');
$sede_nuevo = htmlspecialchars($_POST['sede_nuevo'],ENT_QUOTES,'UTF-8');
$ciudad = htmlspecialchars($_POST['ciudad'],ENT_QUOTES,'UTF-8');
$consulta =$MS->Modificar_Sede($id,$sede_actual,$sede_nuevo,$ciudad);
echo $consulta;





 ?>