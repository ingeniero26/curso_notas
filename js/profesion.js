var t_profesion 
function listar_profesiones(){
     t_profesion = $("#tabla_profesion").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controlador/docente/profesion_listar.php",
            type:'POST'
        },
        "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"nombre_profesion"},
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

    document.getElementById("tabla_profesion_filter").style.display="none";

	      $('input.global_filter').on( 'keyup click', function () {
	        filterGlobal();
	    } );
	    $('input.column_filter').on( 'keyup click', function () {
	        filterColumn( $(this).parents('tr').attr('data-column') );
	    });

// modificar datos usuario
    $('#tabla_profesion').on('click','.editar',function(){
    	var data = t_profesion.row($(this).parents('tr')).data();
    	 if(t_profesion.row(this).child.isShown()){
		        var data = t_profesion.row(this).data();
		    }
    	$("#modal_editar").modal({backdrop:'static',keyboard:false})
		$('#modal_editar').modal('show');
		$('#txt_idprofesion').val(data.profesion_id);
		$('#txt_nombre_actual').val(data.nombre_profesion);
		$('#txt_nombre_nuevo').val(data.nombre_profesion);
		$('#cmb_estatus').val(data.estatus).trigger("change");
		//$('#cmb_rol_editar').val(data.rol_id).trigger("change");

    })



// desactivar usuario
    $('#tabla_profesion').on('click','.activar',function(){
    	var data = t_profesion.row($(this).parents('tr')).data();
    	 if(t_profesion.row(this).child.isShown()){
		        var data = t_profesion.row(this).data();
		    }
    	Swal.fire({
		  title: 'Está seguro de activar la profesion?',
		  text: "ACTIVADO",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Si'
		}).then((result) => {
		  if (result.isConfirmed) {
		   	 Modificar_Estatus(data.profesion_id,'ACTIVO');
		  }
		})
    })


// function activar usuario
    $('#tabla_profesion').on('click','.desactivar',function(){
    	var data = t_profesion.row($(this).parents('tr')).data();
    	 if(t_profesion.row(this).child.isShown()){
		        var data = t_profesion.row(this).data();
		    }
    	Swal.fire({
		  title: 'Está seguro de dasactivar la profesion?',
		  text: "Activación",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Si'
		}).then((result) => {
		  if (result.isConfirmed) {
		   	 Modificar_Estatus(data.profesion_id,'INACTIVO');
		  }
		})
    })





    function Modificar_Estatus(profesion_id,estatus) {
    	var mensaje ="";
    	if(estatus=='INACTIVO') {
    		mensaje="desactivado";
    	}else {
    		mensaje="activo";
    	}
	$.ajax({
			url:"../controlador/docente/modificar_estatus_profesion.php",
	         type:'POST',
	         data:{
	         	profesion_id:profesion_id,
	         	estatus: estatus       	
	         }
		}).done(function(resp){
			alert(resp);
			if(resp > 0) {
					Swal.fire("Mensaje  de confirmaciòn","Profesion "+mensaje+" exitosamente",
					"success")
				.then((value)=>{
					//LimpiarRegistro();
					t_profesion.ajax.reload();
				
				});
			}
			
		})
	}



	function filterGlobal() {
	    $('#tabla_profesion').DataTable().search(
	        $('#global_filter').val(),
	    ).draw();
	}

}

function AbrirModalRegistro() {
	$("#modal_registro").modal({backdrop:'static',keyboard:false})
	$('#modal_registro').modal('show');
}


 function Registrar_Profesion() {
      var nombre = $('#txt_nombre').val();
      if(nombre.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/docente/controlador_registro_profesion.php',
        type:'POST',
        data:{
          nombre:nombre
        }
      }).done(function(resp){
      	//alert(resp);
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Profesion registrado exitosamente",
                    "success")
                .then((value)=>{
                    listar_profesiones();
               // LimpiarCampos();
                    t_profesion.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Profesion ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Profesion no insertado','warning');
        }
      })
    }


    function Modificar_Profesion() {
      var id = $('#txt_idprofesion').val();
      var profesion_actual = $('#txt_nombre_actual').val();
      var profesion_nuevo = $('#txt_nombre_nuevo').val();
     var estatus =$("#cmb_estatus").val();

      if(profesion_nuevo.length == 0 ) {
        Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
      }
      $.ajax({
        url:'../controlador/docente/modificar_datos_profesion.php',
        type:'POST',
        data:{
          id:id,
          profesion_actual:profesion_actual,
          profesion_nuevo:profesion_nuevo,
          estatus:estatus
        }
      }).done(function(resp){
      	alert(resp);
         if(resp > 0) {
            if(resp==1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Profesion editado exitosamente",
                    "success")
                .then((value)=>{
                    listar_profesiones();
               // LimpiarCampos();
                    t_profesion.ajax.reload();
                
                });
            } else {
              //  LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Profesion ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Profesion no editado','warning');
        }
      })
    }