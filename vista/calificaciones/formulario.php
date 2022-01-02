<?php
    $nombre = "";
    $carrera = "";
    $semestre = "";
    $foto = "Default.png";
    foreach($obj->cargar_estudiante() as $value){
        $nombre = $value["nombres"]." ".$value["apellidos"];
        $carrera = $value["nombre_programa"];
        $semestre = $value["numero"];
        $foto = $value["foto"];
    }

?>
<div class="contener-notas">
    <div class="datos-estudiante">
        <div class="foto">
            <img src="../plantilla\dist\img\<?php echo $foto ?>" alt="">
        </div>
        <div class="datos-basicos">
            <label for="">Nombre</label>
            <h3><?php echo $nombre ?></h3>
            <label for="">Carrera</label>
            <h3><?php echo $carrera ?></h3>
            <label for="">Semestre</label>
            <h3><?php echo $semestre ?></h3>            
            <div class="calificar">
                <label for="">Calificación</label>
                <input type="text" class="form form-control" id="nota">
                <button class="btn btn-success" onclick="AgregarNota('<?php echo $_POST['idMatricula']; ?>','<?php echo $_POST['modulo']; ?>')">Agregar</button>
                <button class="btn btn-primary"  data-dismiss="modal">Finalizar</button>
            </div>
            <div class="lista-calificaciones">
                <div class="reg-notas" id="reg_notas">
                    <?php include("reg_notas.php"); ?>
                </div>
                <div class="nota-def">
                    <h3>Definitiva</h3>
                    <p id="definitiva">
                    <?php
                        $objDef = new Calificacion();
                        $objDef->idMatricula = $_POST['idMatricula'];
                        $objDef->idAsignatura = $_POST['modulo'];
                        foreach($objDef->definitiva() as $value){
                            echo $value['definitiva'];
                        }
                    ?>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>