
 

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

                
               <div class="col-lg-3">
                    <label for="">Seleccione una sede</label>
                    <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_sede_matricula">
                            
                             </select> <br> <br>
                </div>

                  <div class="col-lg-3">
                    <label for="">Programa</label>
                    <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_programa_matricula">
                            
                             </select> <br> <br>
                </div>

                 <div class="col-lg-3">
                    <label for="">Semestre</label>
                    <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_semestre_matricula">
                            
                             </select> <br> <br>
                </div>
                 <div class="col-lg-3">
                    <label for="">Jornada</label>
                    <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_jornada_matricula">
                            
                             </select> <br> <br>
                </div>

                <div class="col-lg-2"> 
                  <label for="">&nbsp;</label><br>
                   <button class="btn btn-primary" style="width: 100%" onclick="listar_matriculas()"><i class="fa  fa-search">Buscar</i></button> <br> <br>
                </div>
               
              </div>
             <table id="tabla_matriculas" class="display responsive nowrap table-bordered" style="width:100%">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Estudiante</th>
                    <th>Documento</th>
                    <th>Sede</th>
                    <th>Programa</th>
                    <th>Semestre</th>
                    <th>Jornada</th>
                    <th>Fecha Matricula</th>
                    
                    <th>Estatus</th>
                    <th>Acci&oacute;n</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                       <th>#</th>
                    <th>Estudiante</th>
                    <th>Documento</th>
                    <th>Sede</th>
                    <th>Programa</th>
                    <th>Semestre</th>
                    <th>Jornada</th>
                    <th>Fecha Matricula</th>
                    
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






 




<script type="text/javascript" src="../js/matriculas.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
          listar_matriculas();
          listar_combo_sedes();
          listar_combo_semestre();
          listar_combo_jornada();

           $('.js-example-basic-single').select2();


       $("#cmb_sede_matricula").change(function(){
            var idsede = $("#cmb_sede_matricula").val();
            listar_combo_programa(idsede);
            //alert(' id ' +idsede);
        })

    

    
  })
    </script>