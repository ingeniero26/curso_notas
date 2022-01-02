
 

 <div class="col-md-12">
    <div class="box box-warning box-solid">
      <div class="box-header with-border">
        <h3 class="box-title">Panel Docentes</h3>

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
               

              
               
              </div>
             <table id="tabla_docente" class="display responsive nowrap table-bordered" style="width:100%">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Documento</th>
                    <th>Tipo</th>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>Direccion</th>
                    <th>Barrio</th>
                    <th>Telefono</th>
                    <th>Sexo</th>
                    
                    <th>Nacimiento</th>
                    <th>Profesion</th>
                    
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


<div class="modal fade" id="modal_registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Docentes</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-lg-4">
               <label for=""> <b>Documento:</b></label>
                    <input type="text" id="txt_nrodocumento" name="" class="form-control" placeholder="Digite No Documento"><br>
            </div>
            <div class="col-lg-4">
                  <label for="usuario">Tipo Documento:</label>
                  <select class="js-example-basic-single" id="cmb_tipo_documento" name="state" style="width: 100%">
                    <option value="CEDULA">CEDULA</option>
                    <option value="TI">TI</option>
                   <option value="PASAPORTE">PASAPORTE</option>
                    
                  </select> <br>
              </div>
          <div class="col-lg-4">
                  
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="txt_nombre" name="" class="form-control" placeholder="Digite nombre"><br>
                </div>

                  <div class="col-lg-3">
                    <label for="">Apellido:</label>
                    <input type="text" id="txt_apepat" name="" class="form-control" placeholder="Digite apellidos"><br>
                </div>
              
               <div class="col-lg-3">
                    <label for="">Dirección:</label>
                    <input type="text" id="txt_direccion" name="" class="form-control" placeholder="Digite dir"><br>
                </div>
                <div class="col-lg-3">
                    <label for="">Barrio:</label>
                    <input type="text" id="txt_barrio" name="" class="form-control" placeholder="Digite dir"><br>
                </div>
                 
                <div class="col-lg-3">
                    <label for="">Teléfono:</label>
                    <input type="text" id="txt_movil" name="" class="form-control" placeholder="Digite tel" ><br> <br>
                </div>


                <div class="col-lg-3">
                  <label for="usuario">Sexo:</label>
                  <select class="js-example-basic-single" id="cmb_sexo" name="state" style="width: 100%">
                    <option value="MASCULINO">MASCULINO</option>
                    <option value="FEMENINO">FEMENINO</option>
                   
                    
                  </select> <br>
              </div>
                 <div class="col-lg-3">
                    <label for="">Fecha Nacimiento:</label>
                    <input type="date" id="txt_fecha" name="" class="form-control" placeholder="" ><br> 
                </div>
                   <div class="col-lg-3">
                    <label for="">Profesion:</label>
                    <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_profesion">
                   </select> <br>
                </div>
              
          

            <div class="col-lg-12" style="text-align: center;">
                  <b>DATOS DEL USUARIO</b><br>
                </div>
                  <div class="col-lg-3">
                    <label for="">Usuario:</label>
                    <input type="text" id="txt_usu" name="" class="form-control" placeholder="Digite usuario"><br>
                </div>
                 <div class="col-lg-3">
                    <label for="">Contraseña:</label>
                    <input type="password" id="txt_contra" name="" class="form-control" placeholder="Digite Clave"><br>
                </div>

                <div class="col-lg-3">
                    <label for="">Rol:</label>
                    <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_rol">
                   </select> <br>
                </div>

                <div class="col-lg-3">
                  <label for="">Correo ELectrónico</label>
                  <input type="text" id="txt_email" class="form-control" placeholder="Digite su email">
                  
                </div>
                
              
                
          </div>
       
      </div>
     <div class="modal-footer">
              <button class="btn btn-primary" onclick="Registrar_Docente()">Registrar</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
    </div>
  </div>
</div>




<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Módulo Edición de Docentes</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-lg-4">
              <input type="text" id="txt_iddocente" hidden>
               <label for=""> <b>Documento:</b></label>
                    <input type="text" id="txt_nrodocumento_editar" name="" class="form-control" placeholder="Digite No Documento" disabled><br>
            </div>
            <div class="col-lg-4">
                  <label for="usuario">Tipo Documento:</label>
                  <select class="js-example-basic-single" id="cmb_tipo_documento_editar" name="state" style="width: 100%">
                    <option value="CEDULA">CEDULA</option>
                    <option value="TI">TI</option>
                   <option value="PASAPORTE">PASAPORTE</option>
                    
                  </select> <br>
              </div>
          <div class="col-lg-4">
                  
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="txt_nombre_editar" name="" class="form-control" placeholder="Digite nombre"><br>
                </div>

                  <div class="col-lg-3">
                    <label for="">Apellido:</label>
                    <input type="text" id="txt_apepat_editar" name="" class="form-control" placeholder="Digite apellidos"><br>
                </div>
              
               <div class="col-lg-3">
                    <label for="">Dirección:</label>
                    <input type="text" id="txt_direccion_editar" name="" class="form-control" placeholder="Digite dir"><br>
                </div>
                <div class="col-lg-3">
                    <label for="">Barrio:</label>
                    <input type="text" id="txt_barrio_editar" name="" class="form-control" placeholder="Digite dir"><br>
                </div>
                 
                <div class="col-lg-3">
                    <label for="">Teléfono:</label>
                    <input type="text" id="txt_movil_editar" name="" class="form-control" placeholder="Digite tel" ><br> <br>
                </div>


                <div class="col-lg-3">
                  <label for="usuario">Sexo:</label>
                  <select class="js-example-basic-single" id="cmb_sexo_editar" name="state" style="width: 100%">
                    <option value="MASCULINO">MASCULINO</option>
                    <option value="FEMENINO">FEMENINO</option>
                   
                    
                  </select> <br>
              </div>
                 <div class="col-lg-3">
                    <label for="">Fecha Nacimiento:</label>
                    <input type="date" id="txt_fecha_editar" name="" class="form-control" placeholder="" ><br> 
                </div>
                   <div class="col-lg-3">
                    <label for="">Profesion:</label>
                    <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_profesion_editar">
                   </select> <br>
                </div>
              
          

            <div class="col-lg-12" style="text-align: center;">
                  <b>DATOS DEL USUARIO</b><br>
                </div>
                  <div class="col-lg-3">
                    <input type="text" id="txtid_usuario" hidden>
                    <label for="">Usuario:</label>
                    <input type="text" id="txt_usu_editar" disabled class="form-control" placeholder="Digite usuario"><br>
                </div>
                           
                
          </div>
       
      </div>
     <div class="modal-footer">
              <button class="btn btn-warning" onclick="Modificar_Docente()">Modificar</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
    </div>
  </div>
</div>

  


 




 <script type="text/javascript" src="../js/docentes.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
           ListarDocente();
           // listar_combo_sedes();
            listar_combo_profesion();

            $('.js-example-basic-single').select2();
             listar_combo_rol();
              $("#modal_registro").on('shown.bs.modal',function(){
              $("#txt_usu").focus();
              })
          } );

            /*valida email*/
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