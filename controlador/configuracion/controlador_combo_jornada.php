<?php 
 include '../../modelo/modelo_jornadas.php';

 $MR = new Modelo_Jornadas();
$consulta =$MR->listar_combo_jornada();
echo json_encode($consulta);




 ?>