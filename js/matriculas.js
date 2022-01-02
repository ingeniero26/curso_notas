var t_matriculas
function listar_matriculas(){
	var idprograma = $("#cmb_programa_matricula").val();
	var idsemestre = $("#cmb_semestre_matricula").val();
	var idjornada = $("#cmb_jornada_matricula").val();
	
     t_matriculas = $("#tabla_matriculas").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controlador/matriculas/listar_matriculas.php",
            type:'POST',
            data: {
            	idprograma:idprograma,
            	idsemestre:idsemestre,
            	idjornada:idjornada
            }
           
        },
        "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"estudiante"},
            {"data":"documento"},
            {"data":"sede_nombre"},
            {"data":"nombre_programa"},
            {"data":"numero"},
            {"data":"nombre_jornada"},
            {"data":"fecha_ingreso"},
           
            {"data":"estatus",
            render: function (data, type, row ) {
                if(data=='MATRICULADO'){
                    return "<span class='label label-success'>"+data+"</span>";                   
                }else{
                  return "<span class='label label-danger'>"+data+"</span>";                 
                }
              }
            }, 

            {
                "data": "estatus",
                render: function(data, type, row) {
                    if (data == 'ACTIVO') {
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

    document.getElementById("tabla_matriculas_filter").style.display="none";

	      $('input.global_filter').on( 'keyup click', function () {
	        filterGlobal();
	    } );
	    $('input.column_filter').on( 'keyup click', function () {
	        filterColumn( $(this).parents('tr').attr('data-column') );
	    });

// modificar datos usuario
    $('#tabla_matriculas').on('click','.editar',function(){
    	var data = t_matriculas.row($(this).parents('tr')).data();
    	 if(t_matriculas.row(this).child.isShown()){
		        var data = t_matriculas.row(this).data();
		    }
    	$("#modal_editar").modal({backdrop:'static',keyboard:false})
		$('#modal_editar').modal('show');
		$('#txt_idrol').val(data.id);
		$('#txt_nombre_rol_actual').val(data.nombre_rol);
		$('#txt_nombre_rol_nuevo').val(data.nombre_rol);
		$('#cmb_estatus').val(data.estatus).trigger("change");
		//$('#cmb_rol_editar').val(data.rol_id).trigger("change");

    })
function filterGlobal() {
	    $('#tabla_matriculas').DataTable().search(
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
		$('#cmb_sede_matricula').html(cadena);
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
			$('#cmb_programa_matricula').html(cadena);
			//$('#cmb_rol_editar').html(cadena);
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
		$('#cmb_semestre_matricula').html(cadena);
	})
}

function listar_combo_jornada() {
	$.ajax({
			url:"../controlador/configuracion/controlador_combo_jornada.php",
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
		$('#cmb_jornada_matricula').html(cadena);
	})
}

