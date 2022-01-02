<?php 

class Modelo_Estudiantes {
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}



	

	 function listar_estudiantes() {
	 		$sql = "SELECT 	es.nombres, 	es.apellidos, 
	es.tipo_documento, 	es.documento, 
	es.fecha_nacimiento, 	es.sexo, 
	es.estado_civil, 	es.direccion, 
	es.departamento, 	es.ciudad, 
	es.telefono, 	es.tipo_vivienda, 
	es.estrato, 	es.tipo_poblacion, 
	es.eps, 	es.sisben, 	es.formacion, 
	es.ocupacion, 	mt.fecha_ingreso, 	mt.nombre_ref, 
	mt.apellidos_ref, 	mt.parentesco, 
	mt.direccion_ref, 	mt.telefono_ref, 
	mt.correo_ref, 	es.fregistro, 
	es.estatus, 	es.idusuario, 
	us.usuario_nombre, 	us.usuario_email
FROM
	matriculas AS mt
	INNER JOIN
	estudiantes AS es
	ON 
		(
			mt.documento = es.documento
		)
	INNER JOIN
	usuario AS us
	ON 
		es.idusuario = us.usuario_id";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
			}
 		}

 		function Modificar_Estatus_Estudiante($documento,$estatus) {
 			$sql = "UPDATE estudiantes set 
          estatus = '$estatus' where documento = '$documento'";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
 		}

 		function listar_combo_semestre() {
 				$sql = "SELECT id, `numero` FROM `semestre`
				WHERE `estatus` = 'ACTIVO'";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
				}
				return $arreglo;
				$this->conexion->cerrar();
			}
 		}

 			function listar_combo_programa($idsede) {
 				$sql = "call SP_LISTAR_COMBO_PROGRAMAS('$idsede')";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
				}
				return $arreglo;
				$this->conexion->cerrar();
			}
 		}
 	function Registrar_Estudiante($nombre,$apellidos,$tipo_doc,$numero,$fnac,$sexo,
    $estado_civil,$direccion,$depto,$ciudad,$telefono,$tipo_vivienda,
    $estrato,$grupo_poblacion,$eps,$nivel_sisben ,$formacion ,$ocupacion ,
    $usu,$contra,$rol,$correo, $idsede,$idprograma,$idsemestre,$idjornada,
     $fecha_matricula,
     $nombre_ref, $apellidos_ref ,$parentesco_ref,$direccion_ref ,$telefono_ref,$email_ref){
		$sql = "call  SP_REGISTRAR_ESTUDIANTE('$nombre','$apellidos','$tipo_doc',
		'$numero','$fnac','$sexo','$estado_civil','$direccion','$depto',
		'$ciudad','$telefono','$tipo_vivienda','$estrato','$grupo_poblacion',
		'$eps','$nivel_sisben','$formacion','$ocupacion',
			'$usu','$contra','$rol','$correo', '$idsede','$idprograma','$idsemestre',
			'$idjornada','$fecha_matricula','$nombre_ref','$apellidos_ref',
			'$parentesco_ref','$direccion_ref','$telefono_ref','$email_ref')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function EditarEstudiante($idestudiante,$nombre,$apellidos,$tipo_doc,$fnac,$sexo,$estado_civil,$direccion,
	$depto,$ciudad,$telefono,$tipo_vivienda,$estrato,$grupo_poblacion,$eps,$nivel_sisben,
	 $formacion,$ocupacion) {
		$sql = "call  SP_EDITAR_ESTUDIANTE('$idestudiante','$nombre','$apellidos',
		'$tipo_doc','$fnac','$sexo' ,'$estado_civil','$direccion','$depto','$ciudad',
  	 		 '$telefono','$tipo_vivienda', '$estrato','$grupo_poblacion','$eps','$nivel_sisben',
  	 		 '$formacion','$ocupacion')";
   		if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}
}


 ?>