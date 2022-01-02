<?php 
require '../../modelo/modelo_docente.php';
        
        
$MME = new Modelo_Docente();
$iddocente = htmlspecialchars($_POST['iddocente'],ENT_QUOTES,'UTF-8');
$tipo_doc = htmlspecialchars($_POST['tipo_doc'],ENT_QUOTES,'UTF-8');
$nombres = htmlspecialchars($_POST['nombres'],ENT_QUOTES,'UTF-8');
$apellidos = htmlspecialchars($_POST['apellidos'],ENT_QUOTES,'UTF-8');
$direccion = htmlspecialchars($_POST['direccion'],ENT_QUOTES,'UTF-8');
$barrio = htmlspecialchars($_POST['barrio'],ENT_QUOTES,'UTF-8');
$telefono = htmlspecialchars($_POST['telefono'],ENT_QUOTES,'UTF-8');
$sexo = htmlspecialchars($_POST['sexo'],ENT_QUOTES,'UTF-8');
$fnac = htmlspecialchars($_POST['fnac'],ENT_QUOTES,'UTF-8');

$idprofesion = htmlspecialchars($_POST['idprofesion'],ENT_QUOTES,'UTF-8');





$consulta =$MME->EditarDocente($iddocente,$tipo_doc,$nombres,$apellidos,$direccion,$barrio,$telefono, $sexo,$fnac,$idprofesion);
echo $consulta;




 ?>