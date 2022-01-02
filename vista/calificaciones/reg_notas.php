<?php
    $objNotas = new Calificacion();
    $objNotas->idMatricula = $_POST['idMatricula'];
    $objNotas->idAsignatura = $_POST['modulo'];
?>
<table class="table table-striped">
    <thead>
        <tr>
            <th>No.</th>
            <th>Nota</th>
            
        </tr>
    </thead>
    <tbody>
        <?php 
        $num = 1;
        foreach ($objNotas->cargar() as $dato) { ?>
        <tr>
            <td>Nota <?php echo $num ?></td>
            <td><input type="number" class="form form-cotrol" id="nt1" readonly="true" value="<?php echo $dato['nota'] ?>"></td>
            <td><button class="btn btn-danger" onclick="eliminarNota('<?php echo $dato['id']; ?>',<?php echo $_POST['idMatricula']; ?>,<?php echo $_POST['modulo']; ?>)"><i class="fa fa-trash"> </i></button></td>
        </tr>
        <?php
        $num++;
        }
        ?>
    </tbody>
</table>