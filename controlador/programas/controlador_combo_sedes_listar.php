<?php 
 include '../../modelo/modelo_programas.php';

 $MR = new Modelo_Programas();
$consulta =$MR->listar_combo_sedes();
echo json_encode($consulta);




 ?>