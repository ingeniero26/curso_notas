<?php 
 include '../modelo/modelo_calificacion.php';

 $accion = "";

 if(isset($_POST['accion'])){
    $accion = $_POST['accion'];
 }

 switch ($accion) {
   case "Agregar":
      $objNotas = new Calificacion();
      $objNotas->idMatricula = $_POST['idMatricula'];
      $objNotas->idAsignatura = $_POST['modulo'];
      $objNotas->nota = $_POST['nota'];
      $objNotas->agregar();
      include("../vista/calificaciones/reg_notas.php");
      break;
   case 'Cargar':
      $obj = new Calificacion();
      $obj->idMatricula = $_POST['idMatricula'];
      include("../vista/calificaciones/formulario.php");
      break;
   case "Eliminar":
      $objNotas = new Calificacion();
      $objNotas->id = $_POST['id'];
      $objNotas->eliminar();      
      break;
   case 'Planilla':
      $obj = new Calificacion();
      $obj->idSede = $_POST['sede'];
      $obj->idPrograma = $_POST['idPrograma'];
      $obj->idSemestre = $_POST['semestre'];
      $obj->idJornada = $_POST['jornada'];
      $consulta = $obj->listar_estudiantes();
      include("../vista/calificaciones/listado.php");
      break;
   case "listarNotas":
      include("../vista/calificaciones/reg_notas.php");
      break;
   case "definitiva":
      $objNotas = new Calificacion();
      $objNotas->idMatricula = $_POST['idMatricula'];
      $objNotas->idAsignatura = $_POST['modulo'];
      foreach($objNotas->definitiva() as $value){
         echo $value['definitiva'];
      }
      break;

     
     
 }

//echo json_encode($consulta);




 ?>