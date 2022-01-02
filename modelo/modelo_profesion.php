<?php 

class Modelo_Profesion {
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}



	

	 function listar_profesion() {
	 		$sql = "SELECT    `profesion_id`    , `nombre_profesion`    , `fregistro`    , `estatus`
			FROM
    `profesion`;";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
			}
 		}

 	function	Registrar_Profesion($nombre) {
		$sql = "call  SP_REGISTRAR_PROFESION('$nombre')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Profesion($id,$profesion_actual,$profesion_nuevo,$estatus) {
		$sql = "call  SP_MODIFICAR_PROFESION('$id','$profesion_actual','$profesion_nuevo','$estatus')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}



/*UPDATE `proveedor` SET `idProveedor` = '$idProveedor' , `nombre` = '$nombre' , `Dir` = '$dir' , `TEL` = '$tel' , `CIUDAD` = '$ciudad' , `correo` = '$correo' WHERE `idProveedor` = '$antIdProveedor';");*/




	function Modificar_Estatus_Profesion($profesion_id,$estatus){
		$sql = "UPDATE profesion set 
          estatus = '$estatus' where profesion_id = '$profesion_id'";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}
}



 ?>