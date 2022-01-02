
<?php 
 include '../../modelo/modelo_asignaturas.php';

 $MR = new Modelo_Asignaturas();
$asignatura = htmlspecialchars($_POST['asignatura'],ENT_QUOTES,'UTF-8');
$cantidad_horas = htmlspecialchars($_POST['cantidad_horas'],ENT_QUOTES,'UTF-8');

$consulta =$MR->Registrar_Asignatura($asignatura,$cantidad_horas);
echo $consulta;





 ?>