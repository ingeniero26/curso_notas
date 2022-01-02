<?php 
 include '../../modelo/modelo_estudiantes.php';

 $MR = new Modelo_Estudiantes();
  $idsede  = $_POST['idsede'];
$consulta =$MR->listar_combo_programa($idsede);
echo json_encode($consulta);




 ?>