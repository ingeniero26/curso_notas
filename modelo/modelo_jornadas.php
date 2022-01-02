<?php 


class Modelo_Jornadas {
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}



	

	 function listar_jornadas() {
	 		$sql = "SELECT id, `nombre_jornada`, fregistro,`estatus`
			FROM 
			`jornada`";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
			}
 		}

 		function Modificar_Estatus_Jornada($id,$estatus) {
		$sql = "UPDATE jornada set      estatus = '$estatus' where id = '$id'";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}

	function listar_combo_jornada() {
		$sql = "SELECT  id, `nombre_jornada` FROM jornada
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

	function Registrar_Jornada($nombre) {
		$sql = "call  SP_REGISTRAR_JORNADA('$nombre')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
}
}





 ?>