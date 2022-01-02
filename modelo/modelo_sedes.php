<?php 

class Modelo_Sedes {
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}



	

	 function listar_sedes() {
	 		$sql = "SELECT * FROM sedes";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
			}
 		}

 	function Registrar_Sedes($nombre,$ciudad) {
 		$sql = "call  SP_REGISTRAR_SEDES('$nombre','$ciudad')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
 	}

 	function Modificar_Sede($id,$sede_actual,$sede_nuevo,$ciudad) {
 		$sql = "call  SP_MODIFICAR_SEDES('$id','$sede_actual','$sede_nuevo','$ciudad')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
 	}

 	function Modificar_Estatus_Sede($sede_id,$estatus) {
 		$sql = "UPDATE sedes set 
          estatus = '$estatus' where sede_id = '$sede_id'";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
 	}
}



 ?>