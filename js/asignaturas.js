var t_modulos
function listar_asignaturas(){
     t_modulos = $("#tabla_asignaturas").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controlador/asignaturas/listar_modulos.php",
            type:'POST'
        },
        "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"nombre_modulo"},
             {"data":"cant_horas"},
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

    document.getElementById("tabla_asignaturas_filter").style.display="none";

	      $('input.global_filter').on( 'keyup click', function () {
	        filterGlobal();
	    } );
	    $('input.column_filter').on( 'keyup click', function () {
	        filterColumn( $(this).parents('tr').attr('data-column') );
	    });

// modificar datos usuario
    $('#tabla_asignaturas').on('click','.editar',function(){
    	var data = t_modulos.row($(this).parents('tr')).data();
    	 if(t_modulos.row(this).child.isShown()){
		        var data = t_modulos.row(this).data();
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
    $('#tabla_asignaturas').on('click','.activar',function(){
    	var data = t_modulos.row($(this).parents('tr')).data();
    	 if(t_modulos.row(this).child.isShown()){
		        var data = t_modulos.row(this).data();
		    }
    	Swal.fire({
		  title: 'Está seguro de activar el módulo?',
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
    $('#tabla_asignaturas').on('click','.desactivar',function(){
    	var data = t_modulos.row($(this).parents('tr')).data();
    	 if(t_modulos.row(this).child.isShown()){
		        var data = t_modulos.row(this).data();
		    }
    	Swal.fire({
		  title: 'Está seguro de desactivar el modulo?',
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
			url:"../controlador/asignaturas/control_modificar_estatus.php",
	         type:'POST',
	         data:{
	         	id:id,
	         	estatus: estatus       	
	         }
		}).done(function(resp){
			alert(resp);
			if(resp > 0) {
					Swal.fire("Mensaje  de confirmaciòn","Rol "+mensaje+" exitosamente",
					"success")
				.then((value)=>{
					//LimpiarRegistro();
					t_modulos.ajax.reload();
				
				});
			}
			
		})
	}



	function filterGlobal() {
	    $('#tabla_asignaturas').DataTable().search(
	        $('#global_filter').val(),
	    ).draw();
	}

}

function AbrirModalRegistro() {
	$("#modal_registro").modal({backdrop:'static',keyboard:false})
	$('#modal_registro').modal('show');
}


 function Registrar_Asignatura() {
      var asignatura = $('#txt_nombre').val();
       var cantidad_horas = $('#txt_cantidad').val();
      if(asignatura.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/asignaturas/controlador_registro_asignaturas.php',
        type:'POST',
        data:{
          asignatura:asignatura,
          cantidad_horas:cantidad_horas
        }
      }).done(function(resp){
      	//alert(resp);
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Asignatura registrado exitosamente",
                    "success")
                .then((value)=>{
                    listar_asignaturas();
               // LimpiarCampos();
                    t_modulos.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Asignatura ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Asignatura no insertado','warning');
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
                    t_modulos.ajax.reload();
                
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


  function   LimpiarCampos() {
    $('#txt_nombre').val("");
  }