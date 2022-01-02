<?php 
 include '../../modelo/modelo_distribucion_programas.php';

 $MR = new Modelo_Distri_Programas();
 // $idprograma = htmlspecialchars($_POST['idprograma'],ENT_QUOTES,'UTF-8');
  // $idsemestre = htmlspecialchars($_POST['idsemestre'],ENT_QUOTES,'UTF-8');
   
 $consulta =$MR->listar_distribucion_programas();
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