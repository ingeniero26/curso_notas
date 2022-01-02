var t_sedes 
function listar_sedes(){
     t_sedes = $("#tabla_sedes").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controlador/sedes/listar_sedes.php",
            type:'POST'
        },
        "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"sede_nombre"},
            {"data":"sede_ciudad"},
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

    document.getElementById("tabla_sedes_filter").style.display="none";

	      $('input.global_filter').on( 'keyup click', function () {
	        filterGlobal();
	    } );
	    $('input.column_filter').on( 'keyup click', function () {
	        filterColumn( $(this).parents('tr').attr('data-column') );
	    });

// modificar datos usuario
    $('#tabla_sedes').on('click','.editar',function(){
    	var data = t_sedes.row($(this).parents('tr')).data();
    	 if(t_sedes.row(this).child.isShown()){
		        var data = t_sedes.row(this).data();
		    }
    	$("#modal_editar").modal({backdrop:'static',keyboard:false})
		$('#modal_editar').modal('show');
		$('#txt_idsede').val(data.sede_id);
		$('#txt_nombre_editar_actual').val(data.sede_nombre);
		$('#txt_nombre_editar_nuevo').val(data.sede_nombre);
        $('#txt_ciudad_editar').val(data.sede_ciudad);
		$('#cmb_estatus').val(data.estatus).trigger("change");
		//$('#cmb_rol_editar').val(data.rol_id).trigger("change");

    })



// desactivar usuario
    $('#tabla_sedes').on('click','.activar',function(){
    	var data = t_sedes.row($(this).parents('tr')).data();
    	 if(t_sedes.row(this).child.isShown()){
		        var data = t_sedes.row(this).data();
		    }
    	Swal.fire({
		  title: 'Está seguro de activar la sede?',
		  text: "Activación",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Si'
		}).then((result) => {
		  if (result.isConfirmed) {
		   	 Modificar_Estatus(data.sede_id,'ACTIVO');
		  }
		})
    })


// function activar usuario
    $('#tabla_sedes').on('click','.desactivar',function(){
    	var data = t_sedes.row($(this).parents('tr')).data();
    	 if(t_sedes.row(this).child.isShown()){
		        var data = t_sedes.row(this).data();
		    }
    	Swal.fire({
		  title: 'Está seguro desactivar, esto afectara su sistema',
		  text: "INACTIVO",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Si'
		}).then((result) => {
		  if (result.isConfirmed) {
		   	 Modificar_Estatus(data.sede_id,'INACTIVO');
		  }
		})
    })





    function Modificar_Estatus(sede_id,estatus) {
    	var mensaje ="";
    	if(estatus=='INACTIVO') {
    		mensaje="desactivado";
    	}else {
    		mensaje="activo";
    	}
	$.ajax({
			url:"../controlador/sedes/control_modificar_estatus.php",
	         type:'POST',
	         data:{
	         	sede_id:sede_id,
	         	estatus: estatus       	
	         }
		}).done(function(resp){
			alert(resp);
			if(resp > 0) {
					Swal.fire("Mensaje  de confirmaciòn","SEDE "+mensaje+" exitosamente",
					"success")
				.then((value)=>{
					//LimpiarRegistro();
					t_sedes.ajax.reload();
				
				});
			}
			
		})
	}



	function filterGlobal() {
	    $('#tabla_sedes').DataTable().search(
	        $('#global_filter').val(),
	    ).draw();
	}

}

function AbrirModalRegistro() {
	$("#modal_registro").modal({backdrop:'static',keyboard:false})
	$('#modal_registro').modal('show');
}


 function Registrar_Sede() {
      var nombre = $('#txt_nombre').val();
      var ciudad = $('#txt_ciudad').val();
      if(nombre.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/sedes/controlador_registro_sedes.php',
        type:'POST',
        data:{
          nombre:nombre,
          ciudad:ciudad
        }
      }).done(function(resp){
      	//alert(resp);
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","PerfSEDEil registrado exitosamente",
                    "success")
                .then((value)=>{
                    listar_sedes();
               // LimpiarCampos();
                    t_sedes.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'SEDE ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','SEDE no insertado','warning');
        }
      })
    }


    function Modificar_Sede() {
      var id = $('#txt_idsede').val();
      var sede_actual = $('#txt_nombre_editar_actual').val();
      var sede_nuevo = $('#txt_nombre_editar_nuevo').val();
     var ciudad =$("#txt_ciudad_editar").val();

      if(sede_nuevo.length == 0 ) {
        Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
      }
      $.ajax({
        url:'../controlador/sedes/controlador_modificar_sede.php',
        type:'POST',
        data:{
          id:id,
          sede_actual:sede_actual,
          sede_nuevo:sede_nuevo,
          ciudad:ciudad
        }
      }).done(function(resp){
      	alert(resp);
         if(resp > 0) {
            if(resp==1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","SEDE editado exitosamente",
                    "success")
                .then((value)=>{
                    listar_rol();
               // LimpiarCampos();
                    t_sedes.ajax.reload();
                
                });
            } else {
              //  LimpiarCampos();
                return Swal.fire('Mensaje de error', 'SEDE ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','SEDE no editado','warning');
        }
      })
    }