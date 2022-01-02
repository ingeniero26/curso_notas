<?php 
require '../../modelo/modelo_estudiantes.php';


$MME = new Modelo_Estudiantes();
$idestudiante = htmlspecialchars($_POST['idestudiante'],ENT_QUOTES,'UTF-8');
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
$apellidos = htmlspecialchars($_POST['apellidos'],ENT_QUOTES,'UTF-8');
$tipo_doc = htmlspecialchars($_POST['tipo_doc'],ENT_QUOTES,'UTF-8');
$fnac = htmlspecialchars($_POST['fnac'],ENT_QUOTES,'UTF-8');
$sexo = htmlspecialchars($_POST['sexo'],ENT_QUOTES,'UTF-8');
$estado_civil = htmlspecialchars($_POST['estado_civil'],ENT_QUOTES,'UTF-8');
$direccion = htmlspecialchars($_POST['direccion'],ENT_QUOTES,'UTF-8');
$depto = htmlspecialchars($_POST['depto'],ENT_QUOTES,'UTF-8');
$ciudad = htmlspecialchars($_POST['ciudad'],ENT_QUOTES,'UTF-8');
$telefono = htmlspecialchars($_POST['telefono'],ENT_QUOTES,'UTF-8');
$tipo_vivienda = htmlspecialchars($_POST['tipo_vivienda'],ENT_QUOTES,'UTF-8');
$estrato = htmlspecialchars($_POST['estrato'],ENT_QUOTES,'UTF-8');
$grupo_poblacion = htmlspecialchars($_POST['grupo_poblacion'],ENT_QUOTES,'UTF-8');
$eps = htmlspecialchars($_POST['eps'],ENT_QUOTES,'UTF-8');
$nivel_sisben = htmlspecialchars($_POST['nivel_sisben'],ENT_QUOTES,'UTF-8');
$formacion = htmlspecialchars($_POST['formacion'],ENT_QUOTES,'UTF-8');
$ocupacion = htmlspecialchars($_POST['ocupacion'],ENT_QUOTES,'UTF-8');




$consulta =$MME->EditarEstudiante($idestudiante,$nombre,$apellidos,$tipo_doc,$fnac,$sexo,$estado_civil,$direccion,
	$depto,$ciudad,$telefono,$tipo_vivienda,$estrato,$grupo_poblacion,$eps,$nivel_sisben,
	 $formacion,$ocupacion);
echo $consulta;




 ?>