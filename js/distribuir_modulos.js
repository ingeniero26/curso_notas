var t_distribucion
function listar_distribucion_modulos(){
	var idprograma = $("#cmb_programa_distribucion").val();
	var idsemestre = $("#cmb_semestre_distribucion").val();
	
	
     t_distribucion = $("#tabla_distribuir_modulos").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controlador/configuracion/control_distribucion_modulos.php",
            type:'POST',
            data: {
            	idprograma:idprograma,
            	idsemestre:idsemestre
            	
            }
           
        },
        "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"nombre_programa"},
            {"data":"nombre_modulo"},
            {"data":"cant_horas"},
          
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

    document.getElementById("tabla_distribuir_modulos_filter").style.display="none";

	      $('input.global_filter').on( 'keyup click', function () {
	        filterGlobal();
	    } );
	    $('input.column_filter').on( 'keyup click', function () {
	        filterColumn( $(this).parents('tr').attr('data-column') );
	    });





        function filterGlobal() {
        $('#tabla_distribuir_modulos').DataTable().search(
            $('#global_filter').val(),
        ).draw();
    }

}

function AbrirModalRegistro() {
    $("#modal_registro").modal({backdrop:'static',keyboard:false})
    $('#modal_registro').modal('show');
}


  $('#tabla_jornadas').on('click','.editar',function(){
        var data = t_jornada.row($(this).parents('tr')).data();
         if(t_jornada.row(this).child.isShown()){
                var data = t_jornada.row(this).data();
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
        $('#cmb_sede_distribucion').html(cadena);
         $('#cmb_sede_dist').html(cadena);
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
            $('#cmb_programa_distribucion').html(cadena);
           $('#cmb_programa_dist').html(cadena);
    })
}


function listar_combo_semestre() {
    $.ajax({
            url:"../controlador/estudiantes/controlador_combo_semestre.php",
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
        //cadena +="<option value='Todos'>Todas</option>";
        $('#cmb_semestre_distribucion').html(cadena);
        $('#cmb_semestre_dist').html(cadena);
    })
}

function listar_combo_asignaturas() {
    $.ajax({
            url:"../controlador/configuracion/controlador_combo_asignatura.php",
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
        //cadena +="<option value='Todos'>Todas</option>";
        $('#cmb_asignatura_dist').html(cadena);
       // $('#cmb_semestre_dist').html(cadena);
    })
}
function Registrar_Distribucion() {
     var idprograma = $('#cmb_programa_dist').val();
      var idasignatura = $('#cmb_asignatura_dist').val();
      var idsemestre = $('#cmb_semestre_dist').val();
      if(idprograma.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/configuracion/controlador_registro_distribucion.php',
        type:'POST',
        data:{
          idprograma:idprograma,
          idasignatura:idasignatura,
          idsemestre:idsemestre
        }
      }).done(function(resp){
        alert(resp);
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Modulo registrado exitosamente",
                    "success")
                .then((value)=>{
                    listar_distribucion_modulos();
               // LimpiarCampos();
                    t_distribucion.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Modulo ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Modulo ya exite en la sede','warning');
        }
      })
}

function listar_combo_asignaturas_programa(){
    //console.log("Que ocurre?");
    var idPrograma = $("#cmb_programa_matricula").val();
    var semestre  = $("#cmb_semestre_matricula").val();
    //alert(" Semestre = "+semestre+" Programa: "+idPrograma);
    $.ajax({
        url:"../controlador/configuracion/controlador_combo_asignatura.php",
        type:'POST',
        data:{accion:"Cargar", idPrograma:idPrograma, semestre:semestre}
    }).done(function(resp){
        console.log(resp);
        var data = JSON.parse(resp);
        var cadena ="<option value=''>Seleccione...</option>";
        //console.log(data[0]['nombre_modulo']);
        if(data.length>0) {
            for (var i = 0; i < data.length; i++) {
                cadena+="<option value='"+data[i]['idasignatura']+"'>"+data[i]['nombre_modulo']+"</option>";
            }
        } else {
            cadena+="<option value=''> No Hay datos</option>";
        }
        $('#cmb_asignatura_dist').html(cadena);
    })
}