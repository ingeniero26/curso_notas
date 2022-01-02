<?php 
 include '../../modelo/modelo_asignaturas.php';

 $MR = new Modelo_Asignaturas();
 $consulta =$MR->listar_modulos();
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