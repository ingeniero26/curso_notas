var t_jornada
function listar_jornadas(){
     t_jornada = $("#tabla_jornadas").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controlador/configuracion/control_jornadas_listar.php",
            type:'POST'
        },
        "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"nombre_jornada"},
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

    document.getElementById("tabla_jornadas_filter").style.display="none";

	      $('input.global_filter').on( 'keyup click', function () {
	        filterGlobal();
	    } );
	    $('input.column_filter').on( 'keyup click', function () {
	        filterColumn( $(this).parents('tr').attr('data-column') );
	    });

// modificar datos usuario
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



// desactivar usuario
    $('#tabla_jornadas').on('click','.activar',function(){
    	var data = t_jornada.row($(this).parents('tr')).data();
    	 if(t_jornada.row(this).child.isShown()){
		        var data = t_jornada.row(this).data();
		    }
    	Swal.fire({
		  title: 'Está seguro de activar la jornada?',
		  text: "Activación",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Si'
		}).then((result) => {
		  if (result.isConfirmed) {
		   	 Modificar_Estatus(data.id,'ACTIVO');
		  }
		})
    })


// function activar usuario
    $('#tabla_jornadas').on('click','.desactivar',function(){
    	var data = t_jornada.row($(this).parents('tr')).data();
    	 if(t_jornada.row(this).child.isShown()){
		        var data = t_jornada.row(this).data();
		    }
    	Swal.fire({
		  title: 'Está seguro de desactivar la jornada?',
		  text: "Esto afectara los programas academicos",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Si'
		}).then((result) => {
		  if (result.isConfirmed) {
		   	 Modificar_Estatus(data.id,'INACTIVO');
		  }
		})
    })





    function Modificar_Estatus(id,estatus) {
    	var mensaje ="";
    	if(estatus=='INACTIVO') {
    		mensaje="desactivado";
    	}else {
    		mensaje="activo";
    	}
	$.ajax({
			url:"../controlador/configuracion/control_modificar_estatus.php",
	         type:'POST',
	         data:{
	         	id:id,
	         	estatus: estatus       	
	         }
		}).done(function(resp){
			//JORNADAalert(resp);
			if(resp > 0) {
					Swal.fire("Mensaje  de confirmaciòn","JORNADA "+mensaje+" exitosamente",
					"success")
				.then((value)=>{
					//LimpiarRegistro();
					t_jornada.ajax.reload();
				
				});
			}
			
		})
	}



	function filterGlobal() {
	    $('#tabla_jornadas').DataTable().search(
	        $('#global_filter').val(),
	    ).draw();
	}

}

function AbrirModalRegistro() {
	$("#modal_registro").modal({backdrop:'static',keyboard:false})
	$('#modal_registro').modal('show');
}


 function Registrar_Jornada() {
      var nombre = $('#txt_nombre').val();
      if(nombre.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/configuracion/controlador_registro_jornadas.php',
        type:'POST',
        data:{
          nombre:nombre
        }
      }).done(function(resp){
      	//alert(resp);
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Jornada registrado exitosamente",
                    "success")
                .then((value)=>{
                    listar_jornadas();
               // LimpiarCampos();
                    t_jornada.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Jornada ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Jornada no insertado','warning');
        }
      })
    }


    function Modificar_Perfil() {
      var id = $('#txt_idrol').val();
      var rol_actual = $('#txt_nombre_rol_actual').val();
      var rol_nuevo = $('#txt_nombre_rol_nuevo').val();
     var estatus =$("#cmb_estatus").val();

      if(rol_nuevo.length == 0 ) {
        Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
      }
      $.ajax({
        url:'../controlador/rol/controlador_modificar_rol.php',
        type:'POST',
        data:{
          id:id,
          rol_actual:rol_actual,
          rol_nuevo:rol_nuevo,
          estatus:estatus
        }
      }).done(function(resp){
      	alert(resp);
         if(resp > 0) {
            if(resp==1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Rol editado exitosamente",
                    "success")
                .then((value)=>{
                    listar_rol();
               // LimpiarCampos();
                    t_jornada.ajax.reload();
                
                });
            } else {
              //  LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Rol ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Rol no editado','warning');
        }
      })
    }