<?php 

class Modelo_Programas{
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}



	

	 function listar_programas($idsede) {
	 		$sql = "call SP_LISTAR_PROGRAMAS('$idsede')";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
			}
 		}


 		function listar_combo_sedes(){
 			$sql = "SELECT    `sede_id`    , `sede_nombre`
			FROM
   			 `sedes`
   			 WHERE `sedes`.`estatus` ='ACTIVO'";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
				}
				return $arreglo;
				$this->conexion->cerrar();
			}
 		}

 	function Registrar_Programas($nombre,$idsede) {
 		$sql = "call  SP_REGISTRAR_PROGRAMA('$nombre','$idsede')";
				if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
 	}

 	function Modificar_Estatus_Programa($programa_id,$estatus) {
 		$sql = "UPDATE programa set 
          estatus = '$estatus' where programa_id = '$programa_id'";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
 	}
}


 ?>