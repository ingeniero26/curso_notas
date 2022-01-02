<?php

	class conexion{

		private $servidor;
		private $usuario;
		private $contrasena;
		private $basedatos;
		public $conexion;

		public function __construct(){

		    $this->servidor = "localhost";
			$this->usuario = "root";
			$this->contrasena = "";
			$this->basedatos = "sis_notas2";
        }


		function conectar(){
			$this->conexion = new mysqli($this->servidor,$this->usuario,$this->contrasena,$this->basedatos);
			$this->conexion->set_charset("utf8");

        }

		function cerrar(){
			$this->conexion->close();	
		}

	}

	abstract class ConectarPDO{
        private $host = "localhost";
        private $bdt = "sis_notas2";
        private $usuario= "root";
        private $password = "";

        private $link;
        protected $Conexion;
        public function __construct(){
            $this->link  = "mysql:host=".$this->host;
            $this->link .= ";dbname=".$this->bdt;
            try{
                $this->Conexion = new PDO($this->link, $this->usuario, $this->password);
                $this->Conexion->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
                $this->Conexion->query("SET NAMES 'utf8';");
            }catch(PDOException $e){
                echo "error al tratar de conectarse: ".$e;
            }
            return $this->Conexion;
        }

        public function cerrarConexion(){
            $this->Conexion = null;
        }
    }
?>