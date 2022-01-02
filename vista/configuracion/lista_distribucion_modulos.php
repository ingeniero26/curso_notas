
 

 <div class="col-md-12">
          <div class="box box-warning box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Panel Distribuir Módulos</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="form-group">
                <div class="col-lg-8">
                  <div class="input-group">
                   <input type="text" class="global_filter form-control" id="global_filter" placeholder="ingersar dato a buscar ">
                   <span class="input-group-addon"><i class="fa fa-search"></i></span>
                 </div> <br>
                  
                </div>
                 <div class="col-lg-4"> 
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button><br> <br>
                </div> 
                
               <div class="col-lg-3">
                    <label for="">Seleccione una sede</label>
                    <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_sede_distribucion">
                            
                             </select> <br> <br>
                </div>

                  <div class="col-lg-3">
                    <label for="">Programa</label>
                    <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_programa_distribucion">
                            
                             </select> <br> <br>
                </div>

                 <div class="col-lg-3">
                    <label for="">Semestre</label>
                    <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_semestre_distribucion">
                            
                             </select> <br> <br>
                </div>
              

                <div class="col-lg-2"> 
                  <label for="">&nbsp;</label><br>
                   <button class="btn btn-primary" style="width: 100%" onclick="listar_distribucion_modulos()"><i class="fa  fa-search">Buscar</i></button> <br> <br>
                </div>
               
              </div>
             <table id="tabla_distribuir_modulos" class="display responsive nowrap table-bordered" style="width:100%">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Programa</th>
                    <th>Asignatura</th>
                    <th>Horas</th>
                    <th>Semestre</th>
                    <th>Registro</th>
                    <th>Estado</th>
                    <th>Acci&oacute;n</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                       <th>#</th>
                    <th>Programa</th>
                    <th>Asignatura</th>
                    <th>Horas</th>
                    <th>Semestre</th>
                     <th>Registro</th>
                    <th>Estado</th>
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
                    <label for="">Seleccione una sede</label>
                    <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_sede_dist">
                            
                             </select> <br> <br>
                </div>
            		
	               <div class="col-lg-12">
                    <label for=""><b>Seleccione un Programa</b></label>
                    <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_programa_dist">
                            
                             </select> <br> <br>
                </div>
                  <div class="col-lg-12">
                    <label for=""><b>Seleccione un Modulo</b></label>
                    <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_asignatura_dist">
                            
                             </select> <br> <br>
                </div>
                  <div class="col-lg-12">
                    <label for=""><b>Seleccione el semestre</b></label>
                    <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_semestre_dist">
                            
                             </select> <br> <br>
                </div>


            	</div>
             
            
             
            </div>
            <div class="modal-footer">
            <button class="btn btn-primary" onclick="Registrar_Distribucion()">Registrar</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
    </div>
  </div>



 




<script type="text/javascript" src="../js/distribuir_modulos.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
          listar_distribucion_modulos();
         listar_combo_sedes();
        listar_combo_semestre();
        listar_combo_asignaturas();

           $('.js-example-basic-single').select2();


       $("#cmb_sede_distribucion").change(function(){
            var idsede = $("#cmb_sede_distribucion").val();
            listar_combo_programa(idsede);
            //alert(' id ' +idsede);
        })

         $("#cmb_sede_dist").change(function(){
            var idsede = $("#cmb_sede_dist").val();
            listar_combo_programa(idsede);
            //alert(' id ' +idsede);
        })


    

    
  })
    </script>