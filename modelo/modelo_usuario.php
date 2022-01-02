<?php 

class ModeloUsuario  {
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}



	function VerificarUsuario($usuario,$password) {
		$sql = "call SP_VERIFICAR_USUARIO('$usuario')";
		$arreglo = array();
		if($consulta = $this->conexion->conexion->query($sql)){
			while($consulta_vu = mysqli_fetch_array($consulta)) {
				if(password_verify($password, $consulta_vu['usuario_password'])){
					$arreglo[] =$consulta_vu;
				}
			}
			return $arreglo;
			$this->conexion->cerrar();
		}
	}

	 function ListarUsuario() {
	 		$sql = "call SP_LISTAR_USUARIO()";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
			}
 		}

	 function listar_combo_rol() {
			$sql = "SELECT  id, `nombre_rol` FROM rol
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

	function Registrar_Usuario($usuario,$contra,$idrol,$correo,$sexo,$ruta) {
			$sql = "call  SP_REGISTRAR_USUARIO('$usuario','$contra','$idrol','$correo',
			'$sexo','$ruta')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
			}
		}

		//modifica el status del usuario ACTIVO<-INACTIVO
	function Modificar_Estatus_Usuario($usuario_id,$estatus) {
		$sql = "UPDATE usuario set 
          usuario_estatus = '$estatus' where usuario_id = '$usuario_id'";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
		}

	function Modificar_Datos_Usuario($idusuario,$sexo,$rol){
			$sql = "call SP_MODIFICAR_DATOS_USUARIO('$idusuario','$sexo','$rol')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
		}


	function TraerDatosUsuario($usuario) {
		$sql = "call SP_VERIFICAR_USUARIO('$usuario')";
		$arreglo = array();
		if($consulta = $this->conexion->conexion->query($sql)){
			while($consulta_vu = mysqli_fetch_array($consulta)) {
				$arreglo[]=$consulta_vu;
			}
			return $arreglo;
			$this->conexion->cerrar();
		}
	}


	function Modificar_Contrasena_Usuario($idusuario,$contranu) {
		$sql = "call SP_MODIFICAR_CONTRASENA_USUARIO('$idusuario','$contranu')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
		}
	}


	function Restablecer_contra($email,$contra){
		$sql = "call  SP_RESTABLECER_CONTRA_USUARIO('$email','$contra')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 
				$this->conexion->cerrar();
			}
		}


   function Modificar_Intento_Usuario($usuario) {
   	$sql = "call  SP_INTENTO_USUARIO('$usuario')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 
				$this->conexion->cerrar();
			}
   }


 function  Modificar_Foto($idusuario,$ruta) {
 	$sql = "call  SP_MODIFICAR_FOTO_USUARIO('$idusuario','$ruta')";
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