<ul class="sidebar-menu" data-widget="tree">
        <li class="header">Menu Administrador</li>
         <li class="treeview">
          <a href="#">
            <i class="fa fa-folder"></i> <span>Acceso</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li>  <a onclick="cargar_contenido('contenido_principal','usuario/perfiles.php')" style="cursor: pointer;">
              <i class="fa  fa-share-alt-square"></i> <span>Perfiles</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
           </a></li>
            <li>  <a onclick="cargar_contenido('contenido_principal','usuario/vista_usuario.php')" style="cursor: pointer;">
            <i class="fa fa-user"></i> <span>Usuarios</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a></li>   
           </ul>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-folder"></i> <span>Configuración</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li>  <a onclick="cargar_contenido('contenido_principal','modulos/modulos_listar.php')" style="cursor: pointer;">
              <i class="fa  fa-share-alt-square"></i> <span>Módulos</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
           </a></li>
           <li>
               <a onclick="cargar_contenido('contenido_principal','sedes/sedes_lista.php')" style="cursor: pointer;">
               <i class="fa fa-outdent"></i> <span>Sedes</span>
               <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
               </span>
            </a>
          </li>
          <li>
             <a onclick="cargar_contenido('contenido_principal','programas_academicos/programas_lista.php')" style="cursor: pointer;">
              <i class="fa   fa-list"></i> <span>Programas Académicos</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
           </a>
          </li>
           <li>
             <a onclick="cargar_contenido('contenido_principal','configuracion/lista_jornadas.php')" style="cursor: pointer;">
              <i class="fa   fa-list"></i> <span>Jornadas Académicas</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
           </a>
          </li>

           <li>
             <a onclick="cargar_contenido('contenido_principal','configuracion/lista_distribucion_modulos.php')" style="cursor: pointer;">
              <i class="fa   fa-list"></i> <span>Distribuir Módulos</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
           </a>
          </li>

           <li>
             <a onclick="cargar_contenido('contenido_principal','configuracion/lista_distribucion_programas.php')"  style="cursor: pointer;">
              <i class="fa   fa-list"></i> <span>Distribuir Programas Académicos</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
           </a>
          </li>
             
           </ul>
        </li>


        <li class="active treeview">

            <a onclick="cargar_contenido('contenido_principal','docentes/lista_profesion.php')" style="cursor: pointer;">
              <i class="fa fa-stethoscope"></i> <span>Profesión</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
           </a>

            <a onclick="cargar_contenido('contenido_principal','docentes/docente_listar.php')" style="cursor: pointer;">
              <i class="fa fa-user-md"></i> <span>Docentes</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
           </a>


          <a onclick="cargar_contenido('contenido_principal','estudiantes/vista_estudiantes.php')" style="cursor: pointer;">
            <i class="fa fa-user"></i> <span>Estudiantes</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>

           <a onclick="cargar_contenido('contenido_principal','matriculas/listado_matriculas.php')" style="cursor: pointer;">
             <i class="fa fa-list"></i> <span>Matriculas</span>
             <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
             </span>
            </a>

           

         

            <a onclick="cargar_contenido('contenido_principal','calificaciones/calificaciones_docentes.php')" style="cursor: pointer;">
             <i class="fa  fa-sticky-note"></i> <span>Registro Notas</span>
             <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
             </span>
            </a>

            <a onclick="cargar_contenido('contenido_principal','medicamento/vista_medicamento.php')">
             <i class="fa  fa-cog"></i> <span>Consultas</span>
             <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
             </span>
            </a>
       
         
       
      </ul>