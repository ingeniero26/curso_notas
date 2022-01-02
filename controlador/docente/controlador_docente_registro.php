<?php 

 include '../../modelo/modelo_docente.php';

 $MP = new Modelo_Docente();
  $documento = htmlspecialchars($_POST['documento'],ENT_QUOTES,'UTF-8');
 $tipo_doc = htmlspecialchars($_POST['tipo_doc'],ENT_QUOTES,'UTF-8');
 $nombres = htmlspecialchars($_POST['nombres'],ENT_QUOTES,'UTF-8');
$apellidos = htmlspecialchars($_POST['apellidos'],ENT_QUOTES,'UTF-8');
$direccion = htmlspecialchars($_POST['direccion'],ENT_QUOTES,'UTF-8');
 $barrio = htmlspecialchars($_POST['barrio'],ENT_QUOTES,'UTF-8');
 $telefono = htmlspecialchars($_POST['telefono'],ENT_QUOTES,'UTF-8');
 $sexo = htmlspecialchars($_POST['sexo'],ENT_QUOTES,'UTF-8');
 $fnac = htmlspecialchars($_POST['fnac'],ENT_QUOTES,'UTF-8');
 $idprofesion = htmlspecialchars($_POST['idprofesion'],ENT_QUOTES,'UTF-8');
 //$idsede = htmlspecialchars($_POST['idsede'],ENT_QUOTES,'UTF-8');
 $usu = htmlspecialchars($_POST['usu'],ENT_QUOTES,'UTF-8');
 $contra =  password_hash($_POST['contra'], PASSWORD_DEFAULT,['cost'=>10]);
 $idrol = htmlspecialchars($_POST['idrol'],ENT_QUOTES,'UTF-8');
 $email = htmlspecialchars($_POST['email'],ENT_QUOTES,'UTF-8');


$consulta =$MP->Registrar_Docente($documento,$tipo_doc,$nombres,
            $apellidos,$direccion, $barrio,$telefono,$sexo, $fnac,$idprofesion,
           $usu,$contra,$idrol,$email);
echo $consulta;
//var_dump($consulta);











 ?>