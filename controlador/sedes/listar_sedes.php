<?php 
 include '../../modelo/modelo_sedes.php';

 $MS = new Modelo_Sedes();
 $consulta =$MS->listar_sedes();
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