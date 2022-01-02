<?php 


class Modelo_Docente {
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}



	

	 function listar_docente() {
	 		$sql = "SELECT 	dc.id, 	dc.tipo_documento, 
	dc.nombres, 	dc.apellidos, 
	dc.direccion, 	dc.barrio, 
	dc.telefono, 	dc.sexo, 
	dc.fecha_nacimiento, 	dc.idprofesion, 
	pr.nombre_profesion, 	dc.fregistro, 
	dc.estatus, 	dc.idusuario, 
	us.usuario_nombre, 	us.rol_id, 	r.nombre_rol
FROM
	docentes AS dc 
	INNER JOIN 
	profesion AS pr	ON 		( 			dc.idprofesion = pr.profesion_id		)
	INNER JOIN	usuario AS us	ON 		dc.idusuario = us.usuario_id
	INNER JOIN 	rol AS r	ON 		us.rol_id = r.id;";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
			}
 		}


 	function	listar_combo_profesion () {
 		$sql = "SELECT  profesion_id, `nombre_profesion` FROM profesion
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
 		function listar_combo_rol() {
		$sql = "call SP_LISTAR_COMBO_ROL()";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

 		function Registrar_Docente($documento,$tipo_doc,$nombres,
            $apellidos,$direccion, $barrio,$telefono,$sexo, $fnac,$idprofesion,
           $usu,$contra,$idrol,$email){
		$sql = "call  SP_REGISTRAR_DOCENTE('$documento','$tipo_doc','$nombres',
		'$apellidos','$direccion','$barrio','$telefono','$sexo','$fnac',
		'$idprofesion',		'$usu','$contra','$idrol','$email')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}


    function Modificar_Estatus_Docente($id,$estatus) {
    	$sql = "UPDATE docentes set 
          estatus = '$estatus' where id = '$id'";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
    }

 function EditarDocente($iddocente,$tipo_doc,$nombres,$apellidos,$direccion,$barrio,$telefono, $sexo,$fnac,$idprofesion) {
 	$sql = "call  SP_EDITAR_DOCENTE('$iddocente','$tipo_doc','$nombres','$apellidos',
		'$direccion','$barrio', '$telefono'  ,'$sexo','$fnac','$idprofesion')";
   		if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
 }

}





 ?>