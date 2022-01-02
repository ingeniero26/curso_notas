<?php 
 include '../../modelo/modelo_distribucion_modulos.php';

 $MR = new Modelo_Distri_Modulos();
$idprograma = htmlspecialchars($_POST['idprograma'],ENT_QUOTES,'UTF-8');
$idasignatura = htmlspecialchars($_POST['idasignatura'],ENT_QUOTES,'UTF-8');
$idsemestre = htmlspecialchars($_POST['idsemestre'],ENT_QUOTES,'UTF-8');

$consulta =$MR->Registrar_Distribucion_Modulos($idprograma,$idasignatura,$idsemestre);
echo $consulta;





 ?>