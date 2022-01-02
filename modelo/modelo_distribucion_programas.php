<?php 
class Modelo_Distri_Programas {
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}



	

	 function listar_distribucion_programas() {
	 		$sql = "SELECT     CONCAT_WS(' ', `dc`.`nombres` , `dc`.`apellidos` ) AS docente
      , `dp`.`idDocente` AS documento    ,`dp`.`idPrograma`
    , `pr`.`nombre_programa`    , `pr`.`idsede`
    , `sd`.`sede_nombre`
    , `distribucion_modulo`.`idasignatura`
    , `asignaturas`.`nombre_modulo`
    , `distribucion_modulo`.`idsemestre`
    , `semestre`.`numero`,dp.`estatus`,dp.`fregistro`
FROM
    `distribucion_programas` AS `dp`
    INNER JOIN `programa` AS `pr` 
        ON (`dp`.`idPrograma` = `pr`.`programa_id`)
    INNER JOIN `docentes` AS `dc`
        ON (`dp`.`idDocente` = `dc`.`id`)
    INNER JOIN `sedes` AS `sd`
        ON (`pr`.`idsede` = `sd`.`sede_id`)
    INNER JOIN `distribucion_modulo` 
        ON (`distribucion_modulo`.`idprograma` = `pr`.`programa_id`)
    INNER JOIN `asignaturas` 
        ON (`distribucion_modulo`.`idasignatura` = `asignaturas`.`id`)
    INNER JOIN `semestre` 
        ON (`distribucion_modulo`.`idsemestre` = `semestre`.`id`)
       
         ORDER BY pr.`nombre_programa` , dc.`nombres` , dc.`apellidos` ASC;";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
			}
 		}

    function listar_combo_docente() {
        $sql = "SELECT id, CONCAT_WS (' ' , nombres, apellidos) AS docente FROM docentes
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

    function Registrar_Distribucion_Programas($idprograma,$iddocente) {
        $sql = "INSERT INTO distribucion_programas(idPrograma,idDocente)
         VALUES('$idprograma','$iddocente')";
            if ($consulta = $this->conexion->conexion->query($sql)) {
                //$id_retornado = mysqli_insert_ind($this->conexion->conexion);
                return 1;
                
            }else{
                return 0;
            }
    }
}


 ?>