var t_estudiante
function ListarEstudiante(){
	// var idsede = $("#cmb_sede_docente").val();
     t_estudiante = $("#tabla_estudiante").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controlador/estudiantes/controlador_estudiante_listar.php",
            type:'POST',
          
        },
        "columns":[
             {"defaultContent":""},
            {"data":"nombres"},
             {"data":"apellidos"},
			{"data":"tipo_documento"},
			{"data":"documento"},
			{"data":"fecha_nacimiento"},
			{"data":"sexo", 
            render: function (data, type, row ) {
                if(data=='MASCULINO'){
                    return "<i class='fa fa-male'></i>";                   
                }else{
                  return "<i class='fa fa-female'></i>";               
                }
              }
            },

			{"data":"estado_civil"},
			{"data":"direccion"},
			{"data":"departamento"},
			{"data":"ciudad"},
			{"data":"telefono"},
				
          
            {"data":"tipo_vivienda"},
            {"data":"estrato"},
            {"data":"tipo_poblacion"},
            {"data":"eps"},
            {"data":"sisben"},
            {"data":"formacion"},
            {"data":"ocupacion"},
            {"data":"nombre_ref"},
            {"data":"apellidos_ref"},
            {"data":"parentesco"},
            {"data":"direccion_ref"},
            {"data":"telefono_ref"},
            {"data":"correo_ref"},
 
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
     t_estudiante.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_estudiante').DataTable().page.info();
        t_estudiante.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );

    document.getElementById("tabla_estudiante_filter").style.display="none";

	      $('input.global_filter').on( 'keyup click', function () {
	        filterGlobal();
	    } );
	    $('input.column_filter').on( 'keyup click', function () {
	        filterColumn( $(this).parents('tr').attr('data-column') );
	    });

// modificar datos usuario
    $('#tabla_estudiante').on('click','.editar',function(){
    	var data = t_estudiante.row($(this).parents('tr')).data();
    	 if(t_estudiante.row(this).child.isShown()){
		        var data = t_estudiante.row(this).data();
		    }
    	$("#modal_editar").modal({backdrop:'static',keyboard:false})
		$('#modal_editar').modal('show');
		$('#txt_idestudiante').val(data.documento);
		$('#txt_fecha_matricula_editar').val(data.fecha_ingreso);
		$('#txt_numero_editar').val(data.documento);
		$('#cmb_tipodocumento_editar').val(data.tipo_documento).trigger("change");
		$('#txt_nombre_editar').val(data.nombres);
		$('#txt_apellidos_editar').val(data.apellidos);
		$('#txt_fnacimiento_editar').val(data.fecha_nacimiento);
		$('#cmb_sexo_editar').val(data.sexo).trigger("change");
		$('#cmb_estado_civil_editar').val(data.estado_civil).trigger("change");
		$('#txt_direccion_editar').val(data.direccion);
		$('#txt_depto_editar').val(data.departamento);
		$('#txt_ciudad_editar').val(data.ciudad);
		$('#txt_telefono_editar').val(data.telefono);
		$('#cmb_tipo_vivienda_editar').val(data.tipo_vivienda).trigger("change");
		$('#txt_estrato_editar').val(data.estrato);
		$('#cmb_tipo_poblacion_editar').val(data.tipo_poblacion).trigger("change");
		$('#txt_eps_editar').val(data.eps);
		$('#txt_sisben_editar').val(data.sisben);
		$('#txt_formacion_editar').val(data.formacion);
		$('#txt_ocupacion_editar').val(data.ocupacion);
		//referencias
		$('#txt_nombre_ref_editar').val(data.nombre_ref);
		$('#txt_apellidos_ref_editar').val(data.apellidos_ref);
		$('#txt_parentesco_ref_editar').val(data.parentesco);
		$('#txt_direccion_ref_editar').val(data.direccion_ref);
		$('#txt_telefono_ref_editar').val(data.telefono_ref);
		$('#txt_email_ref_editar').val(data.correo_ref);

		//usuario
		$('#cmb_rol_editar').val(data.rol_id).trigger("change");
		$('#txt_usu_editar').val(data.usuario_nombre);
		$('#txt_email_editar').val(data.usuario_email);
		$('#txt_idusuario').val(data.idusuario);
    })



// desactivar usuario
    $('#tabla_estudiante').on('click','.activar',function(){
    	var data = t_estudiante.row($(this).parents('tr')).data();
    	 if(t_estudiante.row(this).child.isShown()){
		        var data = t_estudiante.row(this).data();
		    }
    	Swal.fire({
		  title: 'Está seguro de activar el estudiante?',
		  text: "Una vez activado el estudiante  podrá ingresar al sistema",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Si'
		}).then((result) => {
		  if (result.isConfirmed) {
		   	 Modificar_Estatus(data.documento,'ACTIVO');
		  }
		})
    })


// function activar usuario
    $('#tabla_estudiante').on('click','.desactivar',function(){
    	var data = t_estudiante.row($(this).parents('tr')).data();
    	 if(t_estudiante.row(this).child.isShown()){
		        var data = t_estudiante.row(this).data();
		    }
    	Swal.fire({
		  title: 'Está seguro de desactivar el estudiante?',
		  text: "Una vez desactivado el estudiante no podrá ingresar al sistema",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Si'
		}).then((result) => {
		  if (result.isConfirmed) {
		   	 Modificar_Estatus(data.documento,'INACTIVO');
		  }
		})
    })





    function Modificar_Estatus(documento,estatus) {
    	var mensaje ="";
    	if(estatus=='INACTIVO') {
    		mensaje="desactivado";
    	}else {
    		mensaje="activo";
    	}
	$.ajax({
			url:"../controlador/estudiantes/controlador_estudiante_modificar_estatus.php",
	         type:'POST',
	         data:{
	         	documento:documento,
	         	estatus: estatus,       	
	         }
		}).done(function(resp){
			alert(resp);
			if(resp > 0) {
					Swal.fire("Mensaje  de confirmaciòn","Estudiante "+mensaje+" exitosamente",
					"success")
				.then((value)=>{
					//LimpiarRegistro();
					t_estudiante.ajax.reload();
				
				});
			}
			
		})
	}



	function filterGlobal() {
	    $('#tabla_estudiante').DataTable().search(
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
				 if(data[i][0]=='3'){
                     cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
				}
			}
			$('#cmb_rol_matricula').html(cadena);
			//$('#cmb_rol_editar').html(cadena);
		} else {
			cadena+="<option value=''> No Hay datos</option>";
			$('#cmb_rol_matricula').html(cadena);
			//$('#cmb_rol_editar').html(cadena);
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

			$('#cmb_sede_matricula').html(cadena);
			var idsede = $('#cmb_sede_matricula').val();
			//$('#cmb_sede_ingreso_doc').html(cadena);
			//alert(idsede);
			listar_combo_programa(idsede);
		} else {
			cadena+="<option value=''> No Hay datos</option>";
			$('#cmb_sede_matricula').html(cadena);
			//$('#cmb_sede_ingreso_doc').html(cadena);
		}
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
			$('#cmb_programa_matricula').html(cadena);
			$('#cmb_programa_matricula_editar').html(cadena);
		} else {
			cadena+="<option value=''> No Hay datos</option>";
			$('#cmb_programa_matricula').html(cadena);
			$('#cmb_programa_matricula_editar').html(cadena);
		}
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
			$('#cmb_semestre_matricula').html(cadena);
			//$('#cmb_rol_editar').html(cadena);
		} else {
			cadena+="<option value=''> No Hay datos</option>";
			$('#cmb_semestre_matricula').html(cadena);
			//$('#cmb_rol_editar').html(cadena);
		}
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
			$('#cmb_jornada').html(cadena);
			//$('#cmb_rol_editar').html(cadena);
		} else {
			cadena+="<option value=''> No Hay datos</option>";
			$('#cmb_jornada').html(cadena);
			//$('#cmb_rol_editar').html(cadena);
		}
	})
}




function Matricular_Estudiante() {
    var nombre = $('#txt_nombre').val();
    var apellidos = $('#txt_apellidos').val();
    var tipo_doc = $('#cmb_tipodocumento').val();
    var numero = $('#txt_numero').val();
    var fnac = $('#txt_fnacimiento').val();
    var sexo = $('#cmb_sexo').val();
    var estado_civil = $('#cmb_estado_civil').val();
    var direccion = $('#txt_direccion').val();
    var depto = $('#txt_depto').val();
    var ciudad = $('#txt_ciudad').val();
    var telefono = $('#txt_telefono').val();
   // var email = $('#txt_correo').val();
    var tipo_vivienda = $('#cmb_tipo_vivienda').val();
    var estrato = $('#txt_estrato').val();
   var grupo_poblacion = $('#cmb_tipo_poblacion').val();
    var eps = $('#txt_eps').val();
    var nivel_sisben = $('#txt_sisben').val();
    var formacion = $('#txt_formacion').val();
    var ocupacion = $('#txt_ocupacion').val();
   
    var usu = $("#txt_usu").val();
    var contra = $("#txt_contra").val();
    var rol = $("#cmb_rol_matricula").val();
     var correo = $("#txt_email").val();

    //para la matricula

    var idsede = $("#cmb_sede_matricula").val();
    var idprograma = $("#cmb_programa_matricula").val();
    var idsemestre = $("#cmb_semestre_matricula").val();
    var idjornada = $("#cmb_jornada").val();
    var fecha_matricula = $("#txt_fecha_matricula").val();

    var nombre_ref = $("#txt_nombre_ref").val();
    var apellidos_ref = $("#txt_apellidos_ref").val();
    var parentesco_ref = $("#txt_parentesco_ref").val();
    var direccion_ref = $("#txt_direccion_ref").val();
    var telefono_ref = $("#txt_telefono_ref").val();
    var email_ref = $("#txt_email_ref").val();

    if (  nombre.length == 0 || apellidos.length == 0 ||
        tipo_doc.length == 0 ||
        numero.length == 0 || direccion.length == 0 ||
        telefono.length == 0 || correo.length == 0 || usu.length == 0 ||
        contra.length == 0 || rol.length == 0) {
        return Swal.fire('Mensaje de error', 'Digite los campos estan vacios', 'warning');
    }

    $.ajax({
        url: '../controlador/estudiantes/controlador_registro_estudiante.php',
        type: 'POST',
        data: {
            nombre: nombre,
            apellidos: apellidos,
            tipo_doc: tipo_doc,
            numero: numero,
            fnac: fnac,
            sexo: sexo,
            estado_civil: estado_civil,
            direccion: direccion,
            depto: depto,
            ciudad: ciudad,
            telefono: telefono,
           /// email: email,
            tipo_vivienda: tipo_vivienda,
            estrato: estrato,
            grupo_poblacion: grupo_poblacion,
            eps: eps,
            nivel_sisben: nivel_sisben,
            formacion: formacion,
            ocupacion: ocupacion,
            //idacudiente: idacudiente,
            usu: usu,
            contra: contra,
            rol: rol,
            correo:correo,
            idsede: idsede,
            idprograma: idprograma,
            idsemestre: idsemestre,
            idjornada: idjornada,
            fecha_matricula:fecha_matricula,


            //referencia familiar
            nombre_ref: nombre_ref,
            apellidos_ref: apellidos_ref,
            parentesco_ref: parentesco_ref,
            direccion_ref: direccion_ref,
            telefono_ref: telefono_ref,
            email_ref: email_ref

        }
    }).done(function(resp) {
        alert(resp);
        if (resp > 0) {

            if (resp == 1) {

                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn", "Estudiante registrado exitosamente",
                        "success")
                    .then((value) => {
                        listar_estudiantes();
                        // LimpiarCampos();
                        t_estudiante.ajax.reload();

                    });
            } else {
                // LimpiarCampos();
                return Swal.fire('Mensaje de error', ' Estudiante y/o Documento ya existe en el sistema, utilice otro', 'warning');
            }
        } else {
            return Swal.fire('Mensaje de error', 'Estudiante no insertado', 'warning');
        }
    })
}


function Modificar_Estudiante() {
	var idestudiante =$('#txt_idestudiante').val();
	 var nombre = $('#txt_nombre_editar').val();
    var apellidos = $('#txt_apellidos_editar').val();
    var tipo_doc = $('#cmb_tipodocumento_editar').val();
    var numero = $('#txt_numero_editar').val();
    var fnac = $('#txt_fnacimiento_editar').val();
    var sexo = $('#cmb_sexo_editar').val();
    var estado_civil = $('#cmb_estado_civil_editar').val();
    var direccion = $('#txt_direccion_editar').val();
    var depto = $('#txt_depto_editar').val();
    var ciudad = $('#txt_ciudad_editar').val();
    var telefono = $('#txt_telefono_editar').val();
   // var email = $('#txt_correo').val();
    var tipo_vivienda = $('#cmb_tipo_vivienda_editar').val();
    var estrato = $('#txt_estrato_editar').val();
   var grupo_poblacion = $('#cmb_tipo_poblacion_editar').val();
    var eps = $('#txt_eps_editar').val();
    var nivel_sisben = $('#txt_sisben_editar').val();
    var formacion = $('#txt_formacion_editar').val();
    var ocupacion = $('#txt_ocupacion_editar').val();
   
   // var usu = $("#txt_usu_editar").val();
  
   

    //para la matricula

   
    //var fecha_matricula = $("#txt_fecha_matricula").val();

 
    

      if (nombre.length == 0 || apellidos.length == 0 ||
        tipo_doc.length == 0 ||
        numero.length == 0 || 
        direccion.length == 0 ||
        telefono.length == 0 ) {
        return Swal.fire('Mensaje de error', 'Digite los campos estan vacios', 'warning');
    }     
         $.ajax({
           url:'../controlador/estudiantes/controlestudiante_editar.php',
           type:'POST',
           data:{
           	idestudiante:idestudiante,     nombre: nombre,
            apellidos: apellidos,  tipo_doc: tipo_doc,
          
            fnac: fnac,    sexo: sexo,   estado_civil: estado_civil,
            direccion: direccion,  depto: depto,     ciudad: ciudad,
            telefono: telefono,   /// email: email,
            tipo_vivienda: tipo_vivienda,    estrato: estrato,
            grupo_poblacion: grupo_poblacion,    eps: eps,
            nivel_sisben: nivel_sisben,  formacion: formacion,
            ocupacion: ocupacion,            //usuario       
                     //referencia
            
         }
           }).done(function(resp){
            alert(resp);
        if(resp > 0) {
            if(resp==1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Estudiante editado exitosamente",
                    "success")
                .then((value)=>{
                    ListarEstudiante();
                    //LimpiarRegistro();
                    t_estudiante.ajax.reload();
                
                });
            } else {
                return Swal.fire( 'Mensaje de error',  'El documento  ya existe en el sistema, utilice otro', 'warning'
        );
            }
        }else {
            return Swal.fire( 'Mensaje de error',  'Estudiante no editado', 'warning'
             );
         }
        })
}
