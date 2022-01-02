<?php 
 include '../../modelo/modelo_estudiantes.php';

 $MR = new Modelo_Estudiantes();
$consulta =$MR->listar_combo_semestre();
echo json_encode($consulta);




 ?>