var t_distribucion_programas
function listar_distribucion_modulos(){
	//var idprograma = $("#cmb_programa_distribucion").val();
	//var idsemestre = $("#cmb_semestre_distribucion").val();
	
	
     t_distribucion_programas = $("#tabla_programas_distribuir").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controlador/configuracion/control_distribucion_programas.php",
            type:'POST',
          
           
        },
        "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"docente"},
            {"data":"documento"},
             {"data":"sede_nombre"},
            {"data":"nombre_programa"},
           
            {"data":"nombre_modulo"},
            {"data":"numero"},
           
            {"data":"fregistro"},
           
            {"data":"estatus",
            render: function (data, type, row ) {
                if(data=='ASIGNADO'){
                    return "<span class='label label-success'>"+data+"</span>";                   
                }else{
                  return "<span class='label label-danger'>"+data+"</span>";                 
                }
              }
            }, 

            {
                "data": "estatus",
                render: function(data, type, row) {
                    if (data == 'ASIGNADO') {
                        return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' ><i class='fa fa-trash' disabled ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' disabled><i class='fa fa-check'></i></button>";
                    } else {
                        return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' disabled ><i class='fa fa-trash'  ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' ><i class='fa fa-check'></i></button>";
                    }
                }
            },
        
      ],

        "language":idioma_espanol,
        select: true
    });

    document.getElementById("tabla_programas_distribuir_filter").style.display="none";

	      $('input.global_filter').on( 'keyup click', function () {
	        filterGlobal();
	    } );
	    $('input.column_filter').on( 'keyup click', function () {
	        filterColumn( $(this).parents('tr').attr('data-column') );
	    });





        function filterGlobal() {
        $('#tabla_programas_distribuir').DataTable().search(
            $('#global_filter').val(),
        ).draw();
    }

}

function AbrirModalRegistro() {
    $("#modal_registro").modal({backdrop:'static',keyboard:false})
    $('#modal_registro').modal('show');
}


  $('#tabla_jornadas').on('click','.editar',function(){
        var data = t_distribucion_programas.row($(this).parents('tr')).data();
         if(t_distribucion_programas.row(this).child.isShown()){
                var data = t_distribucion_programas.row(this).data();
            }
        $("#modal_editar").modal({backdrop:'static',keyboard:false})
        $('#modal_editar').modal('show');
        $('#txt_idjornada').val(data.id);
        $('#txt_nombre_rol_actual').val(data.nombre_jornada);
        $('#txt_nombre_rol_nuevo').val(data.nombre_jornada);
        $('#cmb_estatus').val(data.estatus).trigger("change");
        //$('#cmb_rol_editar').val(data.rol_id).trigger("change");

    })




function listar_combo_sedes() {
    $.ajax({
        url:"../controlador/programas/controlador_combo_sedes_listar.php",
         type:'POST'
    }).done(function(resp){
        //alert(resp);
        var data = JSON.parse(resp);
        //console.log(resp);
        var cadena ="<option value=''>Seleccione...</option>";
        if(data.length>0) {
            for (var i = 0; i < data.length; i++) {
                cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
            }
            //$('#cmb_sede_ingreso_doc').html(cadena);
            //alert(idsede);
        } else {
            cadena+="<option value=''> No Hay datos</option>";
        }
        cadena +="<option value='Todos'>Todas</option>";
        $('#cmb_sede_programa_dist').html(cadena);
       //  $('#cmb_sede_dist').html(cadena);
    })
}


function listar_combo_programa(idsede) {
    $.ajax({
        url:"../controlador/estudiantes/controlador_combo_programa.php",
         type:'POST', 
         data:{
            idsede:idsede
         }
    }).done(function(resp){
        //alert(resp);
        var data = JSON.parse(resp);
        //console.log(resp);
        var cadena ="<option value=''>Seleccione...</option>";
        if(data.length>0) {
            for (var i = 0; i < data.length; i++) {
                cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
            }
        } else {
            cadena+="<option value=''> No Hay datos</option>";
        }
        cadena +="<option value='Todos'>Todos</option>";
          //  $('#cmb_sede_programa_dist').html(cadena);
           $('#cmb_dist_programa').html(cadena);
    })
}


function listar_combo_docente() {
    $.ajax({
        url:"../controlador/configuracion/controlador_combo_docente.php",
         type:'POST'
    }).done(function(resp){
        //alert(resp);
        var data = JSON.parse(resp);
        //console.log(resp);
        var cadena ="<option value=''>Seleccione...</option>";
        if(data.length>0) {
            for (var i = 0; i < data.length; i++) {
                cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
            }
            //$('#cmb_sede_ingreso_doc').html(cadena);
            //alert(idsede);
        } else {
            cadena+="<option value=''> No Hay datos</option>";
        }
        cadena +="<option value='Todos'>Todas</option>";
        $('#cmb_docente_dist').html(cadena);
       //  $('#cmb_sede_dist').html(cadena);
    })
}

function Registro_Dist_Programas() {
    var idprograma = $('#cmb_dist_programa').val();
    var iddocente = $('#cmb_docente_dist').val();
      if(idprograma.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/configuracion/controlador_registro_dist_programa.php',
        type:'POST',
        data:{
          idprograma:idprograma,
          iddocente:iddocente
          
        }
      }).done(function(resp){
        alert(resp);
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Programa registrado exitosamente",
                    "success")
                .then((value)=>{
                    listar_distribucion_programas();
               // LimpiarCampos();
                    t_distribucion_programas.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Programa ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Programa No se pudo insertar','warning');
        }
      })
}