<?php 

class Modelo_Rol {
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}



	

	 function listar_rol() {
	 		$sql = "SELECT    `id`    , `nombre_rol`    , `fregistro`    , `estatus`
			FROM     `rol`;";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
			}
 		}

 		function Registrar_Rol($rol) {
		$sql = "call  SP_REGISTRAR_ROL('$rol')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Rol($id,$rol_actual,$rol_nuevo,$estatus) {
		$sql = "call  SP_MODIFICAR_ROL('$id','$rol_actual','$rol_nuevo','$estatus')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}



/*UPDATE `proveedor` SET `idProveedor` = '$idProveedor' , `nombre` = '$nombre' , `Dir` = '$dir' , `TEL` = '$tel' , `CIUDAD` = '$ciudad' , `correo` = '$correo' WHERE `idProveedor` = '$antIdProveedor';");*/




	function Modificar_Estatus_Rol($id,$estatus) {
		$sql = "UPDATE rol set 
          estatus = '$estatus' where id = '$id'";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}
}


 ?>