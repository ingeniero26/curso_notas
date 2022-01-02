
 

 <div class="col-md-12">
    <div class="box box-warning box-solid">
        <div class="box-header with-border">
            <h3 class="box-title">Mantenimiento de Programas Academicos</h3>

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

                <div class="col-lg-4">
                    <label for="">Seleccione una sede</label>
                    <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_sede">
                            
                             </select> <br> <br>
                </div>

                <div class="col-lg-2"> 
                  <label for="">&nbsp;</label><br>
                   <button class="btn btn-primary" style="width: 100%" onclick="listar_programas()"><i class="fa  fa-search">Buscar</i></button> <br> <br>
                </div>

                
               
              </div>
              
             <table id="tabla_programas" class="display responsive nowrap table-bordered" style="width:100%">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Nombre Programa </th>
                    <th>Sede</th>
                    <th>Fecha registro</th>
                    <th>Estatus</th>
                    <th>Acci&oacute;n</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>#</th>
                     <th>Nombre Programa </th>
                    <th>Sede</th>
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
              <h4 class="modal-title">Registro de Programas Academicos </h4>
            </div>
            <div class="modal-body">
            	<div class="row">
            		 <div class="col-lg-12">
	                  <label for=""><b>Programa Académico:</b></label>
	                  <input type="text" id="txt_nombre" name="" class="form-control" placeholder="Nombre"><br>
	              </div>

	               <div class="col-lg-8">
                    <label for=""><b>Seleccione una sede</b></label>
                    <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_sede_programa">
                            
                             </select> <br> <br>
                </div>


            	</div>
             
            
             
            </div>
            <div class="modal-footer">
            <button class="btn btn-primary" onclick="Registrar_Programa()">Registrar</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
    </div>
  </div>



 






<script type="text/javascript" src="../js/programas.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
            listar_programas();

            $('.js-example-basic-single').select2();
            listar_combo_sedes();
          
              $("#modal_registro").on('shown.bs.modal',function(){
              $("#txt_nombre").focus();
              })
          } );

    

    </script>