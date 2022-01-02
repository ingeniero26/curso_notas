<?php 
 include '../../modelo/modelo_distribucion_programas.php';

 $MR = new Modelo_Distri_Programas();
$consulta =$MR->listar_combo_docente();
echo json_encode($consulta);




 ?>