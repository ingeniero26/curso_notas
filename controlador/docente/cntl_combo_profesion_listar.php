<?php 
require '../../modelo/modelo_docente.php';

$MD = new Modelo_Docente();
$consulta =$MD->listar_combo_profesion();
echo json_encode($consulta);




 ?>