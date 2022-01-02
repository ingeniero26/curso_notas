<?php 
 include '../../modelo/modelo_matriculas.php';

 $MR = new Modelo_Matriculas();
  $idprograma = htmlspecialchars($_POST['idprograma'],ENT_QUOTES,'UTF-8');
   $idsemestre = htmlspecialchars($_POST['idsemestre'],ENT_QUOTES,'UTF-8');
    $idjornada = htmlspecialchars($_POST['idjornada'],ENT_QUOTES,'UTF-8');
 $consulta =$MR->listar_matriculas($idprograma,$idsemestre,$idjornada);
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