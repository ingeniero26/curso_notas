
 

 <div class="col-md-12">
          <div class="box box-warning box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Panel Distribuir  Programas</h3>

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
             <table id="tabla_programas_distribuir" class="display responsive nowrap table-bordered" style="width:100%">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Docente</th>
                    <th>Documento</th>
                    <th>Sede</th>
                    <th>Programa</th>
                    <th>Asignatura</th>
                    <th>Semestre</th>
                    <th>Fecha Registro</th>
                    <th>Estatus</th>
                    <th>Acci&oacute;n</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                      <th>#</th>
                    <th>Docente</th>
                    <th>Documento</th>
                    <th>Sede</th>
                    <th>Programa</th>
                     <th>Asignatura</th>
                    <th>Semestre</th>
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
  <div class="modal fade" id="modal_registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Distribución de Programas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
        
          <div class="col-lg-4">
                    <label for="estatus"><b>Seleccione una Sede:</b></label>
                    <select class="js-example-basic-single" name="state"
                    style="width: 100%;" id="cmb_sede_programa_dist">
                  
                  </select> 
            </div>

      	   <div class="col-lg-4">
                    <label for="estatus"><b>Seleccione un Programa:</b></label>
                    <select class="js-example-basic-single" name="state"
                    style="width: 100%;" id="cmb_dist_programa">
                  
                  </select> 
            </div>
             
               <div class="col-lg-4">
                    <label for="estatus"><b>Seleccione un docente:</b></label>
                    <select class="js-example-basic-single" name="state" 
                    style="width: 100%;" id="cmb_docente_dist">
                   
                  </select> 
            </div>                                
        	</div>
       
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registro_Dist_Programas()">Registrar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>





 




<script type="text/javascript" src="../js/programas_distribucion.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
           listar_distribucion_modulos();
         listar_combo_sedes();
      listar_combo_docente();
     //  listar_combo_jornada();

            $('.js-example-basic-single').select2();
          //   listar_combo_rol();
              $("#modal_registro").on('shown.bs.modal',function(){
              $("#txt_usu").focus();
              })
          } );


      $("#cmb_sede_programa_dist").change(function(){
            var idsede = $("#cmb_sede_programa_dist").val();
            listar_combo_programa(idsede);
            //alert(' id ' +idsede);
        })



     


      


      

    </script>