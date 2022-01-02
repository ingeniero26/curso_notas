<?php 
 include '../../modelo/modelo_programas.php';

 $MR = new Modelo_Programas();
  $idsede = htmlspecialchars($_POST['idsede'],ENT_QUOTES,'UTF-8');
 $consulta =$MR->listar_programas($idsede);
if($consulta) {
	echo json_encode($consulta);
} else {
	echo '{
		"sEcho":1,
		"iTotalRecords":"0",
		"iTotalDisplayRecords":"0",
		"aaData":[]
	}';
}


 ?>