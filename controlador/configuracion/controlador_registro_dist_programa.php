<?php 
 include '../../modelo/modelo_distribucion_programas.php';

 $MR = new Modelo_Distri_Programas();
$idprograma = htmlspecialchars($_POST['idprograma'],ENT_QUOTES,'UTF-8');
$iddocente = htmlspecialchars($_POST['iddocente'],ENT_QUOTES,'UTF-8');

$consulta =$MR->Registrar_Distribucion_Programas($idprograma,$iddocente);
echo $consulta;





 ?>