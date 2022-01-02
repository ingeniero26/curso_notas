<table class="table table-striped">
    <thead>
        <tr>
            <th>No</th>
            <th>Nombre</th>
            <th>Definitiva</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <?php 
        $no = 1;
        foreach($consulta as $value){ ?>
        <tr>
            <td><?php echo $no ?></td>
            <td><?php echo $value['apellidos']." ".$value['nombres'] ?></td>
            <td>
                <?php 
                    $objDef = new Calificacion();
                    $objDef->idMatricula = $value['id'];
                    $objDef->idAsignatura = $_POST['modulo'];
                    foreach($objDef->definitiva() as $d){
                        if ($d['definitiva'] == null){
                            echo "-";
                        }else{
                            echo $d['definitiva'];
                        }
                    }
                ?>
            </td>
            <td>                
                <button class="btn btn-warning" data-toggle="modal" data-target="#staticBackdrop" onclick="calificarEstudiante('<?php echo $value['id'] ?>')">
                    <i class="fa fa-pencil"></i>
                </button>
            </td>
        </tr>
        <?php $no++; } ?>
    </tbody>
</table>