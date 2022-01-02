function cargar_planilla(){
    var sede = $("#cmb_sede_matricula").val();
    var idPrograma = $("#cmb_programa_matricula").val();
    var semestre = $("#cmb_semestre_matricula").val();
    var modulo = $("#cmb_asignatura_dist").val();
    var jornada  = $("#cmb_jornada").val();
    $.ajax({
        type : "POST",
        url:"../controlador/controlador_calificaciones.php",
        type:'POST',
        data:{accion:"Planilla",sede:sede, idPrograma:idPrograma, semestre:semestre, modulo:modulo, jornada:jornada},
        success: function(data){
            $("#planilla").html(data);
        },
        error: function(err){
            console.log("Error: "+err);
        }
    })
}

function calificarEstudiante(idMatricula){
    var modulo = $("#cmb_asignatura_dist").val();
    $.ajax({
        type: "POST",
        url: "../controlador/controlador_calificaciones.php",
        data:{accion:"Cargar", idMatricula:idMatricula, modulo:modulo},
        success: function(data){
            $("#cargasFormulario").html(data);
        },
        error: function(err){
            console.log("Error: "+err);
        }
    });
}

function AgregarNota(idMatricula,modulo){
    var nota = $("#nota").val();
    $.ajax({
        type: "POST",
        url: "../controlador/controlador_calificaciones.php",
        data:{accion:"Agregar", idMatricula:idMatricula, modulo:modulo,nota:nota},
        success: function(data){
            listarNotas(idMatricula,modulo);
            cargarDefinitiva(idMatricula,modulo);
            cargar_planilla();
        },
        error: function(err){
            console.log("Error: "+err);
        }
    });
}

function eliminarNota(id,idMatricula,modulo){
    var nota = $("#nota").val();
    $.ajax({
        type: "POST",
        url: "../controlador/controlador_calificaciones.php",
        data:{accion:"Eliminar", id:id},
        success: function(data){
            listarNotas(idMatricula,modulo);
            cargarDefinitiva(idMatricula,modulo);
            cargar_planilla();
        },
        error: function(err){
            console.log("Error: "+err);
        }
    });
}

function listarNotas(idMatricula,modulo){
    $.ajax({
        type: "POST",
        url: "../controlador/controlador_calificaciones.php",
        data:{accion:"listarNotas", idMatricula:idMatricula, modulo:modulo},
        success: function(data){
            $("#reg_notas").html(data);
        },
        error: function(err){
            console.log("Error: "+err);
        }
    });
}
function cargarDefinitiva(idMatricula,modulo){
    $.ajax({
        type: "POST",
        url: "../controlador/controlador_calificaciones.php",
        data:{accion:"definitiva", idMatricula:idMatricula, modulo:modulo},
        success: function(data){
            $("#definitiva").html(data);
        },
        error: function(err){
            console.log("Error: "+err);
        }
    });
}