
 

 <div class="col-md-12">
          <div class="box box-warning box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Panel Estudiantes</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="form-group">
                <div class="col-lg-10">
                  <div class="input-group">
                   <input type="text" class="global_filter form-control" id="global_filter" placeholder="ingersar dato a buscar ">
                   <span class="input-group-addon"><i class="fa fa-search"></i></span>
                 </div> <br><br>
                </div>

                 <div class="col-lg-2"> 
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
               <!---  <div class="col-lg-4">
                    <label for="">Seleccione una sede</label>
                    <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_sede_docente">
                            
                             </select> <br> <br>
                </div>

                <div class="col-lg-2"> 
                  <label for="">&nbsp;</label><br>
                   <button class="btn btn-primary" style="width: 100%" onclick="ListarDocente()"><i class="fa  fa-search">Buscar</i></button> <br> <br>
                </div>-->
               
              </div>
             <table id="tabla_estudiante" class="display responsive nowrap table-bordered" style="width:100%">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Documento</th>
                    <th>Tipo</th>
                    <th>Fecha Nac</th>
                    <th>Sexo</th>
                    <th>Estado Civil</th>
                    <th>Direccion</th>
                    <th>Departamento</th>
                    <th>Ciudad</th>
                    <th>Telefono</th>
                    
                    <th>Vivienda</th>
                    <th>Estrato</th>
                    <th>Poblacion</th>
                    <th>EPS</th>
                    <th>SISBEN</th>
                    <th>Formación</th>
                    <th>Ocupacion</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Parentesco</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>Correo</th>
                    <th>Fecha Registro</th>
                    <th>Estatus</th>
                    <th>Acci&oacute;n</th>
                  </tr>
                </thead>
               
                </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>

<!--modal registro usuario-->
<div class="modal fade" id="modal_registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Estudiantes</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
            <div class="col-lg-4">
               <label for=""><b>Fecha Matricula</b> </label>
               <input type="date" id="txt_fecha_matricula" class="form-control" placeholder="Fecha Matricula" >
            </div>
      		<div class="col-lg-4">
          	   <label for=""><b>Nombres</b> </label>
               <input type="text" id="txt_nombre" class="form-control" placeholder="Nombre" onkeypress="return soloLetras(event)">
          	</div>
      	<div class="col-lg-4">
      	   <label for=""><b>Apellidos </b> </label>
           <input type="text" id="txt_apellidos" class="form-control" placeholder="Apellido" onkeypress="return soloLetras(event)">
      	</div>
        	
      	<div class="col-lg-4">
      	   <label for=""><b>Tipo Documento</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipodocumento">
             <option value="CEDULA">CEDULA</option>
              <option value="NIT">NIT</option>
              <option value="PASAPORTE">PASAPORTE</option>
              <option value="TI">TI</option>
             </select> <br> 
      	</div>
        <div class="col-lg-4">
           <label for=""><b>Número Documento</b> </label>
           <input type="number" id="txt_numero" class="form-control" placeholder=" " >
        </div>
           <div class="col-lg-4">
                <label for="">Fecha Nacimiento:</label>
                <input type="date" id="txt_fnacimiento" name="" class="form-control" placeholder="fecha nac">
            </div>

             <div class="col-lg-4">
                    <label for="estatus">Sexo:</label>
                    <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_sexo">
                    <option value="MASCULINO">MASCULINO</option>
                    <option value="FEMENINO">FEMENINO</option>
                  </select> 
                </div>
            <div class="col-lg-4">
                    <label for="estatus">ESTADO CIVIL:</label>
                    <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_estado_civil">
                    <option value="SOLTERO">SOLTERO</option>
                    <option value="SOLTERA">SOLTERA</option>
                    <option value="CASADO">CASADO</option>
                     <option value="UNION_LIBRE">UNION_LIBRE</option>
                    <option value="CASADA">CASADA</option>
                  </select> 
            </div>

      	<div class="col-lg-4">
           <label for=""><b>Dirección</b> </label>
           <input type="text" id="txt_direccion" class="form-control" placeholder="dir ">
        </div>
          <div class="col-lg-4">
                    <label for="">Departamento:</label>
                     <input type="text" id="txt_depto" class="form-control" placeholder="dir ">
        </div>

         <div class="col-lg-4">
                    <label for="">Ciudad:</label>
                    <input type="text" id="txt_ciudad" class="form-control" placeholder="Ciudad " 
                   
                > 
        </div>
        

      	<div class="col-lg-4">
      	   <label for=""><b>Teléfono</b> </label>
           <input type="text" id="txt_telefono" class="form-control" placeholder="tel " onkeypress="return soloNumeros(event)">
      	</div>
       

      	


             <div class="col-lg-3">
                    <label for="estatus"><b>Tipo Vivienda:</b></label>
                    <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipo_vivienda">
                    <option value="PROPIA">PROPIA</option>
                    <option value="ALQUILADA">ALQUILADA</option>
                  </select> 
                </div>
            <div class="col-lg-3">
                    <label for=""><b>Estrato:</b></label>
                    <input type="text" id="txt_estrato" name="" class="form-control" placeholder=""><br>
                </div>
                   <div class="col-lg-3">
                    <label for=""><b>Población:</b></label>
                     <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipo_poblacion">
                    <option value="AFRO">AFRO</option>
                    <option value="RAIZAL">RAIZAL</option>
                     <option value="INDIGENA">INDIGENA</option>
                    <option value="DESPLAZADO">DESPLAZADO</option>
                     <option value="OTRO">OTRO</option>
                  </select> 
                </div>
            
               <div class="col-lg-3">
                    <label for=""><b>Eps:</b></label>
                    <input type="text" id="txt_eps" name="" class="form-control" placeholder=""><br>
                </div>

        <div class="col-lg-3">
           <label for=""><b>Nivel Sisben</b> </label>
           <input type="text" id="txt_sisben" class="form-control" placeholder="sisben ">
        </div>
        <div class="col-lg-3">
            <label for=""><b>Formación:</b></label>
            <input type="text" id="txt_formacion" name="" class="form-control" placeholder=""><br>
        </div>

        <div class="col-lg-3">
            <label for=""><b>Ocupación:</b></label>
            <input type="text" id="txt_ocupacion" name="" class="form-control" placeholder=""><br>
        </div>

            <div class="col-lg-3">
                    <label for="estatus"><b>Sede:</b></label>
                    <select class="js-example-basic-single" name="state"
                    style="width: 100%;" id="cmb_sede_matricula">
                  
                  </select> 
            </div>
      	   <div class="col-lg-4">
                    <label for="estatus"><b>Programa:</b></label>
                    <select class="js-example-basic-single" name="state"
                    style="width: 100%;" id="cmb_programa_matricula">
                  
                  </select> 
            </div>
             
               <div class="col-lg-4">
                    <label for="estatus"><b>Semestre:</b></label>
                    <select class="js-example-basic-single" name="state" 
                    style="width: 100%;" id="cmb_semestre_matricula">
                   
                  </select> 
            </div>
            
            <div class="col-lg-4">
                    <label for=""><b>Seleccione Jornada:</b></label>
                    <select class="js-example-basic-single" name="state"
                    style="width: 100%;" id="cmb_jornada">
                   
                   
                  </select> 
            </div>
            <!--referencia familiar -->
              <div class="col-lg-12" style="text-align: center;">
                  <b>Referencia Familiar</b><br>
                </div>
                  <div class="col-lg-4">
                    <label for=""><b>Nombre:</b></label>
                    <input type="text" id="txt_nombre_ref" name="" class="form-control" placeholder="Digite usuario"><br>
                </div>

           <div class="col-lg-4">
                    <label for=""><b>Apellidos:</b></label>
                    <input type="text" id="txt_apellidos_ref" name="" class="form-control" placeholder="Digite "><br>
                </div>
                <div class="col-lg-4">
                    <label for=""><b>Parentesco:</b></label>
                    <input type="text" id="txt_parentesco_ref" name="" class="form-control" placeholder="Digite "><br>
                </div>
                <div class="col-lg-4">
                    <label for=""><b>Direccion:</b></label>
                    <input type="text" id="txt_direccion_ref" name="" class="form-control" placeholder="Digite "><br>
                </div>
                <div class="col-lg-4">
                    <label for=""><b>Telefono:</b></label>
                    <input type="text" id="txt_telefono_ref" name="" class="form-control" placeholder="Digite "><br>
                </div>
                  <div class="col-lg-4">
                    <label for=""><b>Email:</b></label>
                    <input type="text" id="txt_email_ref" name="" class="form-control" placeholder="Digite "><br>
                </div>
               





            <div class="col-lg-12" style="text-align: center;">
                  <b>DATOS DEL USUARIO</b><br>
                </div>
                  <div class="col-lg-3">
                    <label for=""><b>Usuario:</b></label>
                    <input type="text" id="txt_usu" name="" class="form-control" 
                    placeholder="Digite usuario" ><br>
                </div>
                 <div class="col-lg-3">
                    <label for=""><b>Contraseña:</b></label>
                    <input type="password" id="txt_contra" name="" 
                    class="form-control" placeholder="Digite Clave" value="123456"><br>
                </div>

                <div class="col-lg-3">
                    <label for=""><b>Rol:</b></label>
                    <select class="js-example-basic-single" name="state" style="width: 100%;" 
                    id="cmb_rol_matricula">
                   </select> <br>
                </div>
                 <div class="col-lg-3">
                    <label for=""><b>Correo:</b></label>
                    <input type="text" id="txt_email" name="" class="form-control" placeholder="Digite "><br>
                     <label for="" id="emailOk" style="color:red;"></label>
                  <input type="text" id="validar_email" hidden="">
                   <br><br>
                </div>
                
              
                
        	</div>
       
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Matricular_Estudiante()">Matricular</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"><b>Editar de Estudiantes</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-lg-4">
                <input type="text" id="txt_idestudiante" hidden>
               <label for=""><b>Fecha Matricula</b> </label>
               <input type="date" id="txt_fecha_matricula_editar" class="form-control" placeholder="Fecha Matricula" disabled="">
            </div>
            <div class="col-lg-4">
               <label for=""><b>Nombres</b> </label>
               <input type="text" id="txt_nombre_editar" class="form-control" placeholder="Nombre" onkeypress="return soloLetras(event)">
            </div>
        <div class="col-lg-4">
           <label for=""><b>Apellidos </b> </label>
           <input type="text" id="txt_apellidos_editar" class="form-control" placeholder="Apellido" onkeypress="return soloLetras(event)">
        </div>
            
        <div class="col-lg-4">
           <label for=""><b>Tipo Documento</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipodocumento_editar">
             <option value="CEDULA">CEDULA</option>
              <option value="NIT">NIT</option>
              <option value="PASAPORTE">PASAPORTE</option>
              <option value="TI">TI</option>
             </select> <br> 
        </div>
        <div class="col-lg-4">
           <label for=""><b>Número Documento</b> </label>
           <input type="number" id="txt_numero_editar" disabled class="form-control" placeholder=" " >
        </div>
           <div class="col-lg-4">
                <label for="">Fecha Nacimiento:</label>
                <input type="date" id="txt_fnacimiento_editar" name="" class="form-control" placeholder="fecha nac">
            </div>

             <div class="col-lg-4">
                    <label for="estatus">Sexo:</label>
                    <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_sexo_editar">
                    <option value="MASCULINO">MASCULINO</option>
                    <option value="FEMENINO">FEMENINO</option>
                  </select> 
                </div>
            <div class="col-lg-4">
                    <label for="estatus">ESTADO CIVIL:</label>
                    <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_estado_civil_editar">
                    <option value="SOLTERO">SOLTERO</option>
                    <option value="SOLTERA">SOLTERA</option>
                    <option value="CASADO">CASADO</option>
                     <option value="UNION_LIBRE">UNION_LIBRE</option>
                    <option value="CASADA">CASADA</option>
                  </select> 
            </div>

        <div class="col-lg-4">
           <label for=""><b>Dirección</b> </label>
           <input type="text" id="txt_direccion_editar" class="form-control" placeholder="dir ">
        </div>
          <div class="col-lg-4">
                    <label for="">Departamento:</label>
                     <input type="text" id="txt_depto_editar" class="form-control" placeholder="dir ">
        </div>

         <div class="col-lg-4">
                    <label for="">Ciudad:</label>
                    <input type="text" id="txt_ciudad_editar" class="form-control" placeholder="Ciudad " 
                   
                > 
        </div>
        

        <div class="col-lg-4">
           <label for=""><b>Teléfono</b> </label>
           <input type="text" id="txt_telefono_editar" class="form-control" placeholder="tel " onkeypress="return soloNumeros(event)">
        </div>
       

        


             <div class="col-lg-3">
                    <label for="estatus"><b>Tipo Vivienda:</b></label>
                    <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipo_vivienda_editar">
                    <option value="PROPIA">PROPIA</option>
                    <option value="ALQUILADA">ALQUILADA</option>
                     <option value="FAMILIAR">FAMILIAR</option>
                  </select> 
                </div>
            <div class="col-lg-3">
                    <label for=""><b>Estrato:</b></label>
                    <input type="text" id="txt_estrato_editar" name="" class="form-control" placeholder=""><br>
                </div>
                   <div class="col-lg-3">
                    <label for=""><b>Población:</b></label>
                     <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipo_poblacion_editar">
                    <option value="AFRO">AFRO</option>
                    <option value="RAIZAL">RAIZAL</option>
                     <option value="INDIGENA">INDIGENA</option>
                    <option value="DESPLAZADO">DESPLAZADO</option>
                     <option value="OTRO">OTRO</option>
                  </select> 
                </div>
            
               <div class="col-lg-3">
                    <label for=""><b>Eps:</b></label>
                    <input type="text" id="txt_eps_editar" name="" class="form-control" placeholder=""><br>
                </div>

        <div class="col-lg-3">
           <label for=""><b>Nivel Sisben</b> </label>
           <input type="text" id="txt_sisben_editar" class="form-control" placeholder="sisben ">
        </div>
        <div class="col-lg-3">
            <label for=""><b>Formación:</b></label>
            <input type="text" id="txt_formacion_editar" name="" class="form-control" placeholder=""><br>
        </div>

        <div class="col-lg-3">
            <label for=""><b>Ocupación:</b></label>
            <input type="text" id="txt_ocupacion_editar" name="" class="form-control" placeholder=""><br>
        </div>
  
          
            <!--referencia familiar 
              <div class="col-lg-12" style="text-align: center;">
                  <b>Referencia Familiar</b><br>
                </div>
                  <div class="col-lg-4">
                    <label for=""><b>Nombre:</b></label>
                    <input type="text" id="txt_nombre_ref_editar" name="" class="form-control" placeholder="Referencia familiar"><br>
                </div>

           <div class="col-lg-4">
                    <label for=""><b>Apellidos:</b></label>
                    <input type="text" id="txt_apellidos_ref_editar" name="" class="form-control" placeholder="Apellidos"><br>
                </div>
                <div class="col-lg-4">
                    <label for=""><b>Parentesco:</b></label>
                    <input type="text" id="txt_parentesco_ref_editar" name="" class="form-control" placeholder="Digite Parentesco "><br>
                </div>
                <div class="col-lg-4">
                    <label for=""><b>Direccion:</b></label>
                    <input type="text" id="txt_direccion_ref_editar" name="" class="form-control" placeholder="Digite direccion"><br>
                </div>
                <div class="col-lg-4">
                    <label for=""><b>Telefono:</b></label>
                    <input type="text" id="txt_telefono_ref_editar" name="" class="form-control" placeholder="Digite telefono"><br>
                </div>
                  <div class="col-lg-4">
                    <label for=""><b>Email:</b></label>
                    <input type="text" id="txt_email_ref_editar" name="" class="form-control" placeholder="Digite correo "><br>
                </div>-->
                                        
                
            </div>
       
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-warning" onclick="Modificar_Estudiante()">Modificar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>







 




<script type="text/javascript" src="../js/estudiantes.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
           ListarEstudiante();
          listar_combo_sedes();
       listar_combo_semestre();
       listar_combo_jornada();

            $('.js-example-basic-single').select2();
             listar_combo_rol();
              $("#modal_registro").on('shown.bs.modal',function(){
              $("#txt_usu").focus();
              })
          } );


       $("#cmb_sede_matricula").change(function(){
            var idsede = $("#cmb_sede_matricula").val();
            listar_combo_programa(idsede);
            //alert(' id ' +idsede);
        })




       document.getElementById('txt_email').addEventListener('input',function(){
   campo=event.target;
      emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
        if(emailRegex.test(campo.value)) {
            $(this).css("border","");
            $("#emailOk").html("");
            $("#validar_email").val("correcto");
          }  else {
            $(this).css("border","1px solid red");
             $("#emailOk").html("Email Incorrecto");
              $("#validar_email").val("incorrecto");
          }
       })



      


      /*    document.getElementById("imagen_editar").addEventListener("change", () => {
     var fileName = document.getElementById("imagen_editar").value; 
     var idxDot = fileName.lastIndexOf(".") + 1; 
     var extFile = fileName.substr(idxDot, fileName.length).toLowerCase(); 
     if (extFile=="jpg" || extFile=="jpeg" || extFile=="png"){ 

      //TO DO 

     }else{ 

      Swal.fire("MENSAJE DE ADVERTENCIA","DEBE SELECCIONAR SOLO IMAGENES","warning");
       document.getElementById("imagen_editar").value="";
     } 
  });*/
    </script>