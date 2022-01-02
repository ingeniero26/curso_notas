<?php 
 include '../../modelo/modelo_docente.php';

 $MR = new Modelo_Docente();

 $consulta =$MR->listar_docente();
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