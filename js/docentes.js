var t_docente 
function ListarDocente(){
	
     t_docente = $("#tabla_docente").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controlador/docente/controlador_docente_listar.php",
            type:'POST',
            
        },
        "columns":[
            {"data":"posicion"},
            {"data":"id"},
			{"data":"tipo_documento"},
			{"data":"nombres"},
			{"data":"apellidos"},
			{"data":"direccion"},
			{"data":"barrio"},
			{"data":"telefono"},
			
			{"data":"sexo", 
            render: function (data, type, row ) {
                if(data=='MASCULINO'){
                    return "<i class='fa fa-male'></i>";                   
                }else{
                  return "<i class='fa fa-female'></i>";               
                }
              }
            },

			
          

            {"data":"fecha_nacimiento"},
            {"data":"nombre_profesion"},
           
 
        	 {"data":"fregistro"},
             {
                "data": "estatus",
                render: function(data, type, row) {
                    if (data == 'ACTIVO') {
                        return "<span class='label label-success'>" + data + "</span>";
                    } else {
                        return "<span class='label label-danger'>" + data + "</span>";
                    }
                }
            },
            {
                "data": "estatus",
                render: function(data, type, row) {
                    if (data == 'ACTIVO') {
                        return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' ><i class='fa fa-trash' disabled ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' disabled><i class='fa fa-check'></i></button> <button style='font-size:13px;' type='button' class='imprimir btn btn-primary'><i class='fa fa-print'></i></button>&nbsp;&nbsp;";
                    } else {
                        return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' disabled ><i class='fa fa-trash'  ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' ><i class='fa fa-check'></i></button>";
                    }
                }
            },

        
        ],

        "language":idioma_espanol,
        select: true
    });
         t_docente.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_docente').DataTable().page.info();
        t_docente.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );

    document.getElementById("tabla_docente_filter").style.display="none";

	      $('input.global_filter').on( 'keyup click', function () {
	        filterGlobal();
	    } );
	    $('input.column_filter').on( 'keyup click', function () {
	        filterColumn( $(this).parents('tr').attr('data-column') );
	    });

// modificar datos usuario
  // modificar datos del procedimiento
$('#tabla_docente').on('click', '.editar', function() {
    var data = t_docente.row($(this).parents('tr')).data();

    if (t_docente.row(this).child.isShown()) {
        var data = t_docente.row(this).data();
    }
    $("#modal_editar").modal({ backdrop: 'static', keyboard: false })
    $("#modal_editar").modal('show');
    $("#txt_iddocente").val(data.id);
    $("#txt_nrodocumento_editar").val(data.id);
    $("#cmb_tipo_documento_editar").val(data.tipo_documento).trigger("change");
    $("#txt_nombre_editar").val(data.nombres);
    $("#txt_apepat_editar").val(data.apellidos);
    $("#txt_direccion_editar").val(data.direccion);
    $("#txt_barrio_editar").val(data.barrio);
    $("#txt_movil_editar").val(data.telefono);


    $("#cmb_sexo_editar").val(data.sexo).trigger("change");
    $("#txt_fecha_editar").val(data.fecha_nacimiento);
    $("#cmb_profesion_editar").val(data.idprofesion).trigger("change");
     $("#txtid_usuario").val(data.idusuario);
     $("#txt_usu_editar").val(data.usuario_nombre);

})


// desactivar usuario
    $('#tabla_docente').on('click','.activar',function(){
    	var data = t_docente.row($(this).parents('tr')).data();
    	 if(t_docente.row(this).child.isShown()){
		        var data = t_docente.row(this).data();
		    }
    	Swal.fire({
		  title: 'Está seguro de activar el docente?',
		  text: "Una vez activado el docente  podrá ingresar al sistema",
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
    $('#tabla_docente').on('click','.desactivar',function(){
    	var data = t_docente.row($(this).parents('tr')).data();
    	 if(t_docente.row(this).child.isShown()){
		        var data = t_docente.row(this).data();
		    }
    	Swal.fire({
		  title: 'Está seguro de desactivar el docente?',
		  text: "Una vez desactivado el docente no podrá ingresar al sistema",
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
			url:"../controlador/docente/controlador_docente_modificar_estatus.php",
	         type:'POST',
	         data:{
	         	id:id,
	         	estatus: estatus,       	
	         }
		}).done(function(resp){
			alert(resp);
			if(resp > 0) {
					Swal.fire("Mensaje  de confirmaciòn","Docente "+mensaje+" exitosamente",
					"success")
				.then((value)=>{
					//LimpiarRegistro();
					t_docente.ajax.reload();
				
				});
			}
			
		})
	}



	function filterGlobal() {
	    $('#tabla_docente').DataTable().search(
	        $('#global_filter').val(),
	    ).draw();
	}

}

function AbrirModalRegistro() {
	$("#modal_registro").modal({backdrop:'static',keyboard:false})
	$('#modal_registro').modal('show');
}


function listar_combo_rol() {
	$.ajax({
		url:"../controlador/usuario/controlador_combo_rol_listar.php",
         type:'POST'
	}).done(function(resp){
		//alert(resp);
		var data = JSON.parse(resp);
		//console.log(resp);
		var cadena ="<option value=''>Seleccione...</option>";
		if(data.length>0) {
			for (var i = 0; i < data.length; i++) {
				 if(data[i][0]=='2'){
                     cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
				}
			}
			$('#cmb_rol').html(cadena);
			$('#cmb_rol_editar').html(cadena);
		} else {
			cadena+="<option value=''> No Hay datos</option>";
			$('#cmb_rol').html(cadena);
			$('#cmb_rol_editar').html(cadena);
		}
	})
}

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
			$('#cmb_sede_docente').html(cadena);
			$('#cmb_sede_ingreso_doc').html(cadena);
		} else {
			cadena+="<option value=''> No Hay datos</option>";
			$('#cmb_sede_docente').html(cadena);
			$('#cmb_sede_ingreso_doc').html(cadena);
		}
	})
}


function listar_combo_profesion() {
	$.ajax({
		url:"../controlador/docente/cntl_combo_profesion_listar.php",
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
			$('#cmb_profesion').html(cadena);
			$('#cmb_profesion_editar').html(cadena);
		} else {
			cadena+="<option value=''> No Hay datos</option>";
			$('#cmb_profesion').html(cadena);
			$('#cmb_profesion_editar').html(cadena);
		}
	})
}


// registro de usuarios
/*documento char(50) NOT NULL
tipo_documento enum('CEDULA','PASAPORTE','TI') NULL
nombres varchar(100) NULL
apellidos varchar(100) NULL
direccion char(100) NULL
barrio char(250) NULL
telefono char(100) NULL
sexo enum('MASCULINO','FEMENINO') NULL
foto varchar(250) NULL
fecha_nacimiento date NULL
idprofesion int(11) NULL
idsede int(11) NULL
idusuario int(11) NULL
fregistro timestamp NOT NULL
estatus enum('ACTIVO','INACTIVO') NULL*/

function Registrar_Docente() {

	var documento = $('#txt_nrodocumento').val();
	var tipo_doc = $('#cmb_tipo_documento').val();
	var nombres =$('#txt_nombre').val();
	var apellidos =$('#txt_apepat').val();
	var direccion = $('#txt_direccion').val();
	var barrio =$('#txt_barrio').val();
	var telefono =$('#txt_movil').val();
	var sexo =$('#cmb_sexo').val();
   
	var fnac = $("#txt_fecha").val();
    var idprofesion =$('#cmb_profesion').val();
    //var idsede =$('#cmb_profesion').val();
   
/*para el usuario*/
	 var usu = $("#txt_usu").val();
     var contra = $("#txt_contra").val();
     var idrol = $("#cmb_rol").val();
     var email = $("#txt_email").val();
      var validaremail = $("#validar_email").val();

     if(validaremail=="incorrecto") {
        return Swal.fire('Mensaje de error', 'El correo no tiene formato valido', 'warning'
        );
     }
	
	if(documento.length==0 || nombres.length==0 ||  apellidos.length ==0 
		|| 		email.length==0 || usu.length ==0 || contra.length ==0) { 
		return Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
		);
	}

   
	  $.ajax({
           url:'../controlador/docente/controlador_docente_registro.php',
           type:'POST',
           data:{
           documento:documento,
           tipo_doc:tipo_doc,
           nombres:nombres,
           apellidos:apellidos,
           direccion:direccion,
           barrio:barrio,
           telefono:telefono,
           sexo:sexo,
           fnac:fnac,
           idprofesion:idprofesion,
          // idsede:idsede,
           usu:usu,
           contra:contra,
           idrol:idrol,
           email:email
    }
   }).done(function(resp){
   	alert(resp);
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Docente registrado exitosamente",
                    "success")
                .then((value)=>{
                    ListarDocente();
                        //LimpiarRegistro();
                    t_docente.ajax.reload();
                
                });
            } else {
                return Swal.fire( 'Mensaje de error',  'Docente ya existe en el sistema, utilice otro', 'warning'
        );
            }
        }else {
            return Swal.fire( 'Mensaje de error',  'Docente no insertado', 'warning'
        );
    }
   })
}

function LimpiarCampos() {
	$("#txt_usu").val("");
	$("#txt_pass").val("");
	$("#txt_email").val("");
}



// modificar de usuarios

function Modificar_Docente() {
	var iddocente =$('#txt_iddocente').val();
	//var documento = $('#txt_nrodocumento').val();
	var tipo_doc = $('#cmb_tipo_documento_editar').val();
	var nombres =$('#txt_nombre_editar').val();
	var apellidos =$('#txt_apepat_editar').val();
	var direccion = $('#txt_direccion_editar').val();
	var barrio =$('#txt_barrio_editar').val();
	var telefono =$('#txt_movil_editar').val();
	var sexo =$('#cmb_sexo_editar').val();
   
	var fnac = $("#txt_fecha_editar").val();
    var idprofesion =$('#cmb_profesion_editar').val();
    //var idsede =$('#cmb_profesion').val();
   
/*para el usuario*/
		var idusuario =$('#txtid_usuario').val();
	    var usu = $("#txt_usu").val();
  
       

	
	if( nombres.length==0 ||  apellidos.length ==0 
		|| 		direccion.length==0 || barrio.length ==0 || idprofesion.length ==0) { 
		return Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
		);
	}

	

	$.ajax({
		url:"../controlador/docente/controlador_docente_editar_registro.php",
         type:'POST',
         data:{
         	iddocente:iddocente,
         	tipo_doc:tipo_doc,
         	nombres:nombres,
         	apellidos:apellidos,
         	direccion:direccion,
         	barrio:barrio,
         	telefono:telefono,
         	sexo:sexo,
         	fnac:fnac,
         	idprofesion:idprofesion
         }
	}).done(function(resp){
		alert(resp);
		if(resp > 0) {
				$('#modal_editar').modal('hide');
				Swal.fire("Mensaje  de confirmaciòn","Docente modificado exitosamente",
					"success")
				.then((value)=>{
				//	LimpiarRegistro();
					t_docente.ajax.reload();
				//TraerDatosUsuario();
				});
			
		}else {
			return Swal.fire( 'Mensaje de error',  'Docente no modificado', 'warning'
		);
		}
	})

}


function LimpiarRegistro() {
	$("#txt_usu").val("");
	$("#txt_con1").val("");
	$("#txt_con2").val("");
	//$("#cmb_sexo").val("");
	//$("#cmb_rol").val("");
}

















function Editar_Foto() {

	var idusuario =$('#txtidusuario').val();
	var archivo = $('#imagen_editar').val();
	var f = new Date();
	var extension = archivo.split('.').pop();
	var nombrearchivo = "IMG"+f.getDate()+""+(f.getMonth()+1)+""+f.getFullYear()+""+
	f.getHours()+""+f.getMinutes()+""+f.getSeconds()+"."+extension;
 
	var formData = new FormData();
	var foto = $("#imagen_editar")[0].files[0];
	if(archivo.length==0) { 
		return Swal.fire('Mensaje de error','Debe seleccionar un archivo', 'warning'
		);
	}
	
	formData.append('idusuario',idusuario);
	formData.append('foto',foto);
	formData.append('nombrearchivo',nombrearchivo);

	$.ajax({
		url:'../controlador/usuario/controlador_usuario_editar_foto.php',
		type:'POST',
		data:formData,
		contentType:false,
		processData:false,
		success:function(resp){
			//alert(resp);
			if(resp!=0){
               if(resp==1){
               	table.ajax.reload();
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Foto Actualizada exitosamente","success");  
           		 } 
			}
		
		}

	});
	return false;
}