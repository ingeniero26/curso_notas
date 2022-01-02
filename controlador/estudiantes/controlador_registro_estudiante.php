<?php 
require '../../modelo/modelo_estudiantes.php';

$MES = new Modelo_Estudiantes();

$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
$apellidos = htmlspecialchars($_POST['apellidos'],ENT_QUOTES,'UTF-8');
$tipo_doc = htmlspecialchars($_POST['tipo_doc'],ENT_QUOTES,'UTF-8');
$numero = htmlspecialchars($_POST['numero'],ENT_QUOTES,'UTF-8');
$fnac = htmlspecialchars($_POST['fnac'],ENT_QUOTES,'UTF-8');
$sexo = htmlspecialchars($_POST['sexo'],ENT_QUOTES,'UTF-8');
$estado_civil = htmlspecialchars($_POST['estado_civil'],ENT_QUOTES,'UTF-8');
$direccion = htmlspecialchars($_POST['direccion'],ENT_QUOTES,'UTF-8');
$depto = htmlspecialchars($_POST['depto'],ENT_QUOTES,'UTF-8');
$ciudad = htmlspecialchars($_POST['ciudad'],ENT_QUOTES,'UTF-8');
$telefono = htmlspecialchars($_POST['telefono'],ENT_QUOTES,'UTF-8');
//$email = htmlspecialchars($_POST['email'],ENT_QUOTES,'UTF-8');
$tipo_vivienda = htmlspecialchars($_POST['tipo_vivienda'],ENT_QUOTES,'UTF-8');
$estrato = htmlspecialchars($_POST['estrato'],ENT_QUOTES,'UTF-8');
$grupo_poblacion = htmlspecialchars($_POST['grupo_poblacion'],ENT_QUOTES,'UTF-8');
$eps = htmlspecialchars($_POST['eps'],ENT_QUOTES,'UTF-8');
$nivel_sisben = htmlspecialchars($_POST['nivel_sisben'],ENT_QUOTES,'UTF-8');
$formacion = htmlspecialchars($_POST['formacion'],ENT_QUOTES,'UTF-8');
$ocupacion = htmlspecialchars($_POST['ocupacion'],ENT_QUOTES,'UTF-8');
//$idacudiente = htmlspecialchars($_POST['idacudiente'],ENT_QUOTES,'UTF-8');

$usu = htmlspecialchars($_POST['usu'],ENT_QUOTES,'UTF-8');
$contra =  password_hash($_POST['contra'], PASSWORD_DEFAULT,['cost'=>10]);
$rol = htmlspecialchars($_POST['rol'],ENT_QUOTES,'UTF-8');
$correo = htmlspecialchars($_POST['correo'],ENT_QUOTES,'UTF-8');

$idsede = htmlspecialchars($_POST['idsede'],ENT_QUOTES,'UTF-8');
$idprograma = htmlspecialchars($_POST['idprograma'],ENT_QUOTES,'UTF-8');
$idsemestre = htmlspecialchars($_POST['idsemestre'],ENT_QUOTES,'UTF-8');
$idjornada = htmlspecialchars($_POST['idjornada'],ENT_QUOTES,'UTF-8');
$fecha_matricula = htmlspecialchars($_POST['fecha_matricula'],ENT_QUOTES,'UTF-8');

$nombre_ref = htmlspecialchars($_POST['nombre_ref'],ENT_QUOTES,'UTF-8');
$apellidos_ref = htmlspecialchars($_POST['apellidos_ref'],ENT_QUOTES,'UTF-8');
$parentesco_ref = htmlspecialchars($_POST['parentesco_ref'],ENT_QUOTES,'UTF-8');
$direccion_ref = htmlspecialchars($_POST['direccion_ref'],ENT_QUOTES,'UTF-8');
$telefono_ref = htmlspecialchars($_POST['telefono_ref'],ENT_QUOTES,'UTF-8');
$email_ref = htmlspecialchars($_POST['email_ref'],ENT_QUOTES,'UTF-8');




$consulta =$MES->Registrar_Estudiante($nombre,$apellidos,$tipo_doc,$numero,$fnac,$sexo,
    $estado_civil,$direccion,$depto,$ciudad,$telefono,$tipo_vivienda,
    $estrato,$grupo_poblacion,$eps,$nivel_sisben ,$formacion ,$ocupacion ,
    $usu,$contra,$rol,$correo, $idsede,$idprograma,$idsemestre,$idjornada,
     $fecha_matricula,
     $nombre_ref, $apellidos_ref ,$parentesco_ref,$direccion_ref ,$telefono_ref,$email_ref);
echo $consulta;





 ?>