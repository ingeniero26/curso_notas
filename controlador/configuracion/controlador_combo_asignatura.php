<?php 
 include '../../modelo/modelo_distribucion_modulos.php';

 $accion = "";

 if(isset($_POST['accion'])){
    $accion = $_POST['accion'];
 }

 switch ($accion) {
     case 'Cargar':
        $MR = new Modelo_Distri_Modulos();
        $consulta = $MR->listar_distribucion_modulos_2($_POST['idPrograma'],$_POST['semestre']);
         break;
     
     default:
        $MR = new Modelo_Distri_Modulos();
        $consulta =$MR->listar_combo_asignatura();
         break;
 }

echo json_encode($consulta);




 ?>