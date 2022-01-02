
<div>
<div>

</div>    
 

 <div class="col-md-12">
          <div class="box box-primary box-solid">
            <div class="box-header with-border">
               <h1 class="box-title">MODULO CALIFICACIONES</h1>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="form-group">
                <div class="col-lg-2">
                    <label for="estatus"><b>Sede:</b></label>
                    <select class="js-example-basic-single  form form-control combo" name="state" id="cmb_sede_matricula"></select> 
                </div>
                <div class="col-lg-2">
                    <label for="estatus"><b>Programa:</b></label>
                    <select class="js-example-basic-single  form form-control combo" name="state" id="cmb_programa_matricula"></select> 

                </div>
                <div class="col-lg-2">
                    <label for="estatus"><b>Semestre:</b></label>
                    <select class="js-example-basic-single form form-control combo" name="state"  id="cmb_semestre_matricula" onchange="listar_combo_asignaturas_programa()"
                    ></select> 
                </div>
                <div class="col-lg-2">
                    <label for="estatus"><b>Módulo:</b></label>
                    <select class="js-example-basic-single form form-control combo" name="state"  id="cmb_asignatura_dist"></select> 
                </div>
                <div class="col-lg-2">
                    <label for=""><b>Seleccione Jornada:</b></label>
                    <select class="js-example-basic-single  form form-control combo" name="state" id="cmb_jornada">                    
                    </select> 
                </div> 
                <div class="col-lg-2">
                    <button class="btn btn-primary" onclick="cargar_planilla()">Cargar Planilla</button> 
                </div>              
              </div>
              <div id="planilla">

              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
</div>

</div>
<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog fade in" role="document" style="width: 70%;">
    <div class="modal-content">
      <div class="modal-header">
        <h1>MODULO DE REGISTRO DE CALIFICACIONES POR ESTUDIANTE</h1>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="cargasFormulario">        
        
      </div>
    </div>
  </div>
</div>
    <script type="text/javascript">
        $(document).ready(function() {
            listar_combo_sedes();
            listar_combo_semestre();
            listar_combo_jornada();
            $('.js-example-basic-single').select2();
            listar_combo_rol();
            $("#modal_registro").on('shown.bs.modal',function(){
                $("#txt_usu").focus();
            });
        });


       $("#cmb_sede_matricula").change(function(){
            var idsede = $("#cmb_sede_matricula").val();
            listar_combo_programa(idsede);
            //alert(' id ' +idsede);
        })
    </script>