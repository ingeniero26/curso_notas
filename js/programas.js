var t_programas
function listar_programas(){
	 var idsede = $("#cmb_sede").val();
     t_programas = $("#tabla_programas").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controlador/programas/listar_programas.php",
            type:'POST',
            data:{
            	idsede:idsede
            }
        },
        "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"nombre_programa"},
            {"data":"sede_nombre"},
            {"data":"fregistro"},
            {"data":"estatus",
            render: function (data, type, row ) {
                if(data=='ACTIVO'){
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

    document.getElementById("tabla_programas_filter").style.display="none";

	      $('input.global_filter').on( 'keyup click', function () {
	        filterGlobal();
	    } );
	    $('input.column_filter').on( 'keyup click', function () {
	        filterColumn( $(this).parents('tr').attr('data-column') );
	    });

// modificar datos usuario
    $('#tabla_programas').on('click','.editar',function(){
    	var data = t_rol.row($(this).parents('tr')).data();
    	 if(t_rol.row(this).child.isShown()){
		        var data = t_rol.row(this).data();
		    }
    	$("#modal_editar").modal({backdrop:'static',keyboard:false})
		$('#modal_editar').modal('show');
		$('#txt_idrol').val(data.id);
		$('#txt_nombre_rol_actual').val(data.nombre_rol);
		$('#txt_nombre_rol_nuevo').val(data.nombre_rol);
		$('#cmb_estatus').val(data.estatus).trigger("change");
		//$('#cmb_rol_editar').val(data.rol_id).trigger("change");

    })



// desactivar usuario
    $('#tabla_programas').on('click','.activar',function(){
    	var data = t_programas.row($(this).parents('tr')).data();
    	 if(t_programas.row(this).child.isShown()){
		        var data = t_programas.row(this).data();
		    }
    	Swal.fire({
		  title: 'Está seguro de el programa?',
		  text: "Activado",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Si'
		}).then((result) => {
		  if (result.isConfirmed) {
		   	 Modificar_Estatus(data.programa_id,'ACTIVO');
		  }
		})
    })


// function activar usuario
    $('#tabla_programas').on('click','.desactivar',function(){
    	var data = t_programas.row($(this).parents('tr')).data();
    	 if(t_programas.row(this).child.isShown()){
		        var data = t_programas.row(this).data();
		    }
    	Swal.fire({
		  title: 'Está seguro desactivar el programa, esto afectara el sistema',
		  text: "DESACTIVADO",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Si'
		}).then((result) => {
		  if (result.isConfirmed) {
		   	 Modificar_Estatus(data.programa_id,'INACTIVO');
		  }
		})
    })





    function Modificar_Estatus(programa_id,estatus) {
    	var mensaje ="";
    	if(estatus=='INACTIVO') {
    		mensaje="desactivado";
    	}else {
    		mensaje="activo";
    	}
	$.ajax({
			url:"../controlador/programas/control_modificar_estatus.php",
	         type:'POST',
	         data:{
	         	programa_id:programa_id,
	         	estatus: estatus       	
	         }
		}).done(function(resp){
			alert(resp);
			if(resp > 0) {
					Swal.fire("Mensaje  de confirmaciòn","Programa "+mensaje+" exitosamente",
					"success")
				.then((value)=>{
					//LimpiarRegistro();
					t_programas.ajax.reload();
				
				});
			}
			
		})
	}



	function filterGlobal() {
	    $('#tabla_programas').DataTable().search(
	        $('#global_filter').val(),
	    ).draw();
	}

}

function AbrirModalRegistro() {
	$("#modal_registro").modal({backdrop:'static',keyboard:false})
	$('#modal_registro').modal('show');
}



function listar_combo_sedes() {
	$.ajax({
		url:"../controlador/programas/controlador_combo_sedes_listar.php",
         type:'POST'
	}).done(function(resp){
		alert(resp);
		var data = JSON.parse(resp);
		//console.log(resp);
		var cadena ="<option value=''>Seleccione...</option>";
		if(data.length>0) {
			for (var i = 0; i < data.length; i++) {
				cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
			}
		//	$('#cmb_sede').html(cadena);
		//	$('#cmb_sede_programa').html(cadena);
		} else {
			cadena+="<option value=''> No Hay datos</option>";
			//$('#cmb_sede').html(cadena);
		//	$('#cmb_sede_programa').html(cadena);
		}
		$('#cmb_sede').html(cadena);
		$('#cmb_sede_programa').html(cadena);
	})
}


function Registrar_Programa(){
	 var nombre = $('#txt_nombre').val();
      var idsede = $('#cmb_sede_programa').val();
      if(nombre.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/programas/controlador_registro_programas.php',
        type:'POST',
        data:{
          nombre:nombre,
          idsede:idsede
        }
      }).done(function(resp){
      	alert(resp);
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Programa registrado exitosamente",
                    "success")
                .then((value)=>{
                    listar_programas();
               // LimpiarCampos();
                    t_programas.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Programa ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Programa ya exite en la sede','warning');
        }
      })
}