<?php

class Calificacion{
    private $conexion;
    public $idMatricula;
    public $idPrograma;
    public $idSemestre;
    public $idSede;
    public $idAsignatura;
    public $idJornada;
    private $sql;
    function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}	

	function listar_estudiantes() {        
        $sql = "SELECT	mt.id,e.nombres,e.apellidos FROM matriculas mt 
        INNER JOIN estudiantes e ON e.`documento` = mt.`documento` 
        WHERE mt.`idsede` = '".$this->idSede."' 
        AND mt.`idprograma` = '".$this->idPrograma."' 
        AND mt.`idsemestre` = '".$this->idSemestre."' 
        AND mt.idjornada = '".$this->idJornada."' 
        ORDER BY e.apellidos ASC";
        $arreglo = array();
        if($consulta = $this->conexion->conexion->query($sql)){
            while($consulta_vu = mysqli_fetch_assoc($consulta)) {
                    $arreglo[] = $consulta_vu;
                
            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }
    
	function cargar_estudiante() {        
        $sql = "SELECT	mt.id,e.nombres,e.apellidos, pr.`nombre_programa`, se.`numero`, e.foto FROM matriculas mt 
        INNER JOIN estudiantes e ON e.`documento` = mt.`documento`
        INNER JOIN programa pr ON pr.`programa_id` = mt.`idprograma`
        INNER JOIN semestre se ON se.`id` = mt.`idsemestre`
        WHERE mt.`id` = '".$this->idMatricula."'";
        $arreglo = array();
        if($consulta = $this->conexion->conexion->query($sql)){
            while($consulta_vu = mysqli_fetch_assoc($consulta)) {
                    $arreglo[] = $consulta_vu;                
            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }
    
    public function cargar(){
        $sql = "SELECT * FROM calificaciones WHERE idMatricula = '".$this->idMatricula."' AND idasignatura = '".$this->idAsignatura."'";
        $arreglo = array();
        if($consulta = $this->conexion->conexion->query($sql)){
            while($consulta_vu = mysqli_fetch_assoc($consulta)) {
                    $arreglo[] = $consulta_vu;                
            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function definitiva(){
        $sql = "SELECT idMatricula,idasignatura,ROUND(AVG(nota), 1) AS definitiva FROM calificaciones WHERE idMatricula = '".$this->idMatricula."' AND idasignatura = '".$this->idAsignatura."'";
        $arreglo = array();
        if($consulta = $this->conexion->conexion->query($sql)){
            while($consulta_vu = mysqli_fetch_assoc($consulta)) {
                    $arreglo[] = $consulta_vu;                
            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function agregar(){
        $sql = "INSERT INTO calificaciones(idMatricula,idasignatura,nota) VALUES('".$this->idMatricula."', '".$this->idAsignatura."',".$this->nota.")";
        if($consulta = $this->conexion->conexion->query($sql)){            
            $this->conexion->cerrar();
        }
    }

    public function eliminar(){
        $sql = "DELETE FROM calificaciones WHERE id= '".$this->id."'";        
        if($consulta = $this->conexion->conexion->query($sql)){            
            $this->conexion->cerrar();
        }
    }

    public function modificar(){
        $sql = "UPDATE calificaciones SET nota= ".$this->nota." WHERE id= '".$this->id."'";        
        if($consulta = $this->conexion->conexion->query($sql)){            
            $this->conexion->cerrar();
        }
    }

}
