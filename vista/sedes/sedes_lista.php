
 

 <div class="col-md-12">
    <div class="box box-warning box-solid">
        <div class="box-header with-border">
            <h3 class="box-title">Mantenimiento de Sedes</h3>

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
                   <input type="text" class="global_filter form-control" id="global_filter" placeholder="Buscar  ">
                   <span class="input-group-addon"><i class="fa fa-search"></i></span>
                 </div> <br><br>
                </div>

                 <div class="col-lg-2"> 
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
               
              </div>
             <table id="tabla_sedes" class="display responsive nowrap table-bordered" style="width:100%">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>Ciudad</th>
                    <th>Fecha registro</th>
                    <th>Estatus</th>
                    <th>Acci&oacute;n</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>Ciudad</th>
                    <th>Fecha registro</th>
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

 <div class="modal fade" id="modal_registro" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Registro de SEDES </h4>
            </div>
            <div class="modal-body">
            	<div class="row">
            		 <div class="col-lg-12">
	                  <label for="">Perfil:</label>
	                  <input type="text" id="txt_nombre" name="" class="form-control" placeholder="Nombre"><br>
	              </div>

	               <div class="col-lg-12">
                  <label for="">Ciudad:</label>
                  <input type="text" id="txt_ciudad" name="" class="form-control" placeholder="Ciudad"><br>
              </div>


            	</div>
             
            
             
            </div>
            <div class="modal-footer">
            <button class="btn btn-primary" onclick="Registrar_Sede()">Registrar</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
    </div>
  </div>



 <div class="modal fade" id="modal_editar" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Edición de SEDES </h4>
            </div>
            <div class="modal-body">
            	<div class="row">
            		<input type="text" name="" id="txt_idsede" hidden="">
            		 <div class="col-lg-12">
	                  <label for="">Perfil:</label>
	                  <input type="text" id="txt_nombre_editar_actual" hidden=""  placeholder="Nombre"><br>
	                   <input type="text" id="txt_nombre_editar_nuevo"  class="form-control" placeholder="Nombre"><br>
	              </div>

	               <div class="col-lg-12">
                  <label for="">Ciudad:</label>
                  <input type="text" id="txt_ciudad_editar" name="" class="form-control" placeholder="Ciudad"><br>
              </div>


            	</div>
             
            
             
            </div>
            <div class="modal-footer">
            <button class="btn btn-warning" onclick="Modificar_Sede()">Modificar</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
    </div>
  </div>






<script type="text/javascript" src="../js/sedes.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
            listar_sedes();

            $('.js-example-basic-single').select2();
          
              $("#modal_registro").on('shown.bs.modal',function(){
              $("#txt_nombre").focus();
              })
          } );

    

    </script>