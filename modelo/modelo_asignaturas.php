<?php 

class Modelo_Asignaturas {
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}



	

	 function listar_modulos() {
	 		$sql = "SELECT    `id`    , `nombre_modulo`   , `cant_horas` , `fregistro`
    , `estatus` FROM     `asignaturas`;";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
			}
 		}

 		function Modificar_Estatus_Asignatura($id,$estatus) {
		$sql = "UPDATE asignaturas set      estatus = '$estatus' where id = '$id'";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}

	function Registrar_Asignatura($asignatura,$cantidad_horas) {
		$sql = "call  SP_REGISTRAR_Asignatura('$asignatura','$cantidad_horas')";
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