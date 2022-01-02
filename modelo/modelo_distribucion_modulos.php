<?php 
 
 class Modelo_Distri_Modulos {
 	private $conexion;
	public $idprograma;
	public $idsemestre;

	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}

	function listar_distribucion_modulos($idprograma,$idsemestre) {
		$sql = "call SP_LISTAR_DISTRI_MODULOS('$idprograma','$idsemestre')";
		$arreglo = array();
		if($consulta = $this->conexion->conexion->query($sql)){
			while($consulta_vu = mysqli_fetch_assoc($consulta)) {
					$arreglo["data"][] =$consulta_vu;					
			}
			return $arreglo;
			$this->conexion->cerrar();
		}
	}

	function listar_distribucion_modulos_2($idprograma,$idsemestre) {
		$sql = "call SP_LISTAR_DISTRI_MODULOS('$idprograma','$idsemestre')";
		$arreglo = array();
		if($consulta = $this->conexion->conexion->query($sql)){
			while($consulta_vu = mysqli_fetch_assoc($consulta)) {
					$arreglo[] =$consulta_vu;					
			}
			return $arreglo;
			$this->conexion->cerrar();
		}
	}

	function listar_combo_asignatura() {
		$sql = "SELECT id, `nombre_modulo` FROM `asignaturas`
			WHERE `asignaturas`.`estatus` = 'ACTIVO'";
		$arreglo = array();
		if($consulta = $this->conexion->conexion->query($sql)){
			while($consulta_vu = mysqli_fetch_array($consulta)) {
					$arreglo[] =$consulta_vu;
			}
			return $arreglo;
			$this->conexion->cerrar();
		}
	}

 		function Registrar_Distribucion_Modulos($idprograma,$idasignatura,$idsemestre) {
 			$sql = "INSERT INTO distribucion_modulo(idprograma,idasignatura,idsemestre) VALUES('$idprograma','$idasignatura','$idsemestre')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
 		}
 }


 ?>