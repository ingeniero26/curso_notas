<?php 
 include '../../modelo/modelo_estudiantes.php';

 $MR = new Modelo_Estudiantes();
 $consulta =$MR->listar_estudiantes();
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