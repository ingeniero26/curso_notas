<?php 
 include '../../modelo/modelo_profesion.php';

 $MR = new Modelo_Profesion();
 $consulta =$MR->listar_profesion();
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