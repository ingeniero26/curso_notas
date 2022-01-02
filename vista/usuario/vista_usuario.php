
 

 <div class="col-md-12">
          <div class="box box-warning box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Panel Usuarios</h3>

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
             <table id="tabla_usuario" class="display responsive nowrap table-bordered" style="width:100%">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Usuario</th>
                    <th>Rol</th>
                   
                    <th>Correo</th>
                    <th>Foto</th>
                    <th>Fecha Registro</th>
                    <th>Estatus</th>
                    <th>Acci&oacute;n</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                     <th>#</th>
                    <th>Usuario</th>
                    <th>Rol</th>
                   
                    <th>Correo</th>
                    <th>Foto</th>
                    <th>Fecha Registro</th>
                    <th>Estatus</th>
                    <th>Acci&oacute;n</th>
                  </tr>
                </tfoot>
                </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>

<!--modal registro usuario-->
  <form  autocomplete="false" onsubmit="return false">
     <div class="modal fade" id="modal_registro" role="dialog">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Registro de Usuario</h4>
            </div>
            <div class="modal-body">
              <div class="col-lg-4">
                  <label for="usuario">Usuario:</label>
                  <input type="text" id="txt_usu" name="" class="form-control" placeholder="Digite su usuario"><br>
              </div>

                <div class="col-lg-4">
                  <label for="usuario">Contraseña:</label>
                  <input type="password" id="txt_con1" name="" class="form-control" placeholder="Digite su clave"><br>
              </div>

                <div class="col-lg-4">
                  <label for="usuario">Confirmar Clave:</label>
                  <input type="password" id="txt_con2" name="" class="form-control" placeholder="Confirme su clave"><br>
              </div>
               <div class="col-lg-4">
                  <label for="usuario">Rol:</label>
                  <select class="js-example-basic-single" id="cmb_rol" name="state" style="width: 100%">
                    
                  </select> <br>
              </div>
              <div class="col-lg-4">
                  <label for="usuario">Correo:</label>
                  <input type="text" id="txt_correo" name="" class="form-control" placeholder="Digite su correo"><br>
              </div>

             
              <div class="col-lg-12">
                <label for="">Subir Imagen</label>
                <input type="file" id="imagen" accept="imagen/*">
               </div><br><br>

              
            </div>
            <div class="modal-footer">
              <button class="btn btn-primary" onclick="Registrar_Usuario()">Registrar</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
          </div>
        </div>
      </div>
  </form>


  <form  autocomplete="false" onsubmit="return false">
     <div class="modal fade" id="modal_editar" role="dialog">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Registro de Usuario</h4>
            </div>
            <div class="modal-body">
              <div class="col-lg-4">
                <input type="text" name="" id="txtidusuario" hidden="">
                  <label for="usuario">Usuario:</label>
                  <input type="text" id="txt_usu_editar" hidden="" class="form-control" placeholder="Digite su usuario" hidden><br>
              </div>


              
               <div class="col-lg-4">
                  <label for="usuario">Rol:</label>
                  <select class="js-example-basic-single" id="cmb_rol_editar" name="state" style="width: 100%">
                    
                  </select> <br>
              </div>
              <div class="col-lg-4">
                  <label for="usuario">Correo:</label>
                  <input type="text" id="txt_correo_editar" name="" class="form-control" placeholder="Digite su correo"><br>
              </div>

             

              <div class="col-lg-10">
                <label for="">Subir Imagen</label>
                <input type="file" id="imagen_editar" accept="imagen/*">
               </div><br>
              <div class="col-lg-2">
              <label for="">&nbsp;</label><br>
               <button class="btn btn-success" onclick="Editar_Foto()">Actualizar</button>
             </div>

              
            </div>
            <div class="modal-footer">
              <button class="btn btn-primary" onclick="Registrar_Usuario()">Registrar</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
          </div>
        </div>
      </div>
  </form>


 




<script type="text/javascript" src="../js/usuario.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
            ListarUsuario();

            $('.js-example-basic-single').select2();
             listar_combo_rol();
              $("#modal_registro").on('shown.bs.modal',function(){
              $("#txt_usu").focus();
              })
          } );

        document.getElementById("imagen").addEventListener("change", () => {
     var fileName = document.getElementById("imagen").value; 
     var idxDot = fileName.lastIndexOf(".") + 1; 
     var extFile = fileName.substr(idxDot, fileName.length).toLowerCase(); 
     if (extFile=="jpg" || extFile=="jpeg" || extFile=="png"){ 
      //TO DO 
     }else{ 
      Swal.fire("MENSAJE DE ADVERTENCIA","DEBE SELECCIONAR SOLO IMAGENES","warning");
       document.getElementById("imagen").value="";
     } 
    });


          document.getElementById("imagen_editar").addEventListener("change", () => {
     var fileName = document.getElementById("imagen_editar").value; 
     var idxDot = fileName.lastIndexOf(".") + 1; 
     var extFile = fileName.substr(idxDot, fileName.length).toLowerCase(); 
     if (extFile=="jpg" || extFile=="jpeg" || extFile=="png"){ 

      //TO DO 

     }else{ 

      Swal.fire("MENSAJE DE ADVERTENCIA","DEBE SELECCIONAR SOLO IMAGENES","warning");
       document.getElementById("imagen_editar").value="";
     } 
  });
    </script>