const header = `


<header class="shadow-sm z-1" >

    <div class="bg-principal py-2">
        <div class="container d-flex flex-column flex-md-row justify-content-between align-items-center text-center text-md-start">
            <div>
                <span class="me-3">📞 925 37 40 62</span>
                <span>📧 aytonoezics@gmail.com</span>
            </div>
            <div>
                <small>Ayuntamiento de Noez</small>
            </div>
        </div>
    </div>

    <div class="bg- py-3 border-bottom">
        <div class="container d-flex flex-column flex-md-row align-items-center justify-content-between">
            <div class="d-flex align-items-center">
                <img src="/Proyecto_final_ayuntamiento_Noez/img/imagen_escudo.png" alt="Escudo de Noez" class="img-fluid me-3" style="height: 100px;" />
                <h1 class="mb-0 fs-4 text-marron">Ayuntamiento de Noez</h1>
            </div>
            <div class="d-none d-md-block">
              <button type="buttonIniciarSesion" class=" btn-ayuntamiento btn   mt-3" data-bs-toggle="modal"
                        data-bs-target="#ModalIniciarSesion"> Iniciar Sesión</button>
                
            </div>
        </div>
<div class="modal fade" id="ModalIniciarSesion" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content border-primary">
      <div class="modal-header bg-principal text-white">
        <h5 class="modal-title text-white" id="loginModalLabel">Inicio de Sesión - Ayuntamiento</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>
      <form action="Controller?operacion=login" method="post">
        <div class="modal-body">
          <div class="mb-3">
            <label for="usuario" class="form-label">Usuario</label>
            <input type="text" class="form-control" id="usuario" name="usuario" required>
          </div>
          <div class="mb-3">
            <label for="contrasena" class="form-label">Contraseña</label>
            <input type="password" class="form-control" id="contrasena" name="contrasena" required>
          </div>
          <div class="form-text text-danger">
            Solo personal autorizado del Ayuntamiento
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-localizacion ">Iniciar sesión</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        </div>
      </form>
    </div>
  </div>
</div>
        <nav class="navbar navbar-expand-lg bg-principal navbar-dark  justify-content-center">
            <div class="text-center ">
                <a class="navbar-brand d-lg-none" href="#">Menú</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-center" id="mainNav">
                    <ul class="navbar-nav">

                        <li class="nav-item">
                            <a class="nav-link" href="/Proyecto_final_ayuntamiento_Noez/index.html">Inicio</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link" href="#" id="puebloDropdown" role="button" data-bs-toggle="dropdown">
                                Pueblo
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/Proyecto_final_ayuntamiento_Noez/pueblo/historia.html">Historia</a></li>
                                <li><a class="dropdown-item" href="/Proyecto_final_ayuntamiento_Noez/pueblo/Fiestas.html">Fiestas</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link" href="#" id="puebloDropdown" role="button" data-bs-toggle="dropdown">
                                Áreas
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/Proyecto_final_ayuntamiento_Noez/Areas/JuventudDeporte.html">Juventud y <br> Deporte</a></li>
                                <li><a class="dropdown-item" href="/Proyecto_final_ayuntamiento_Noez/Areas/CulturaEducacionFestejo.html">Cultura, <br> Educación, <br> Festejos</a></li>
                                <li><a class="dropdown-item" href="/Proyecto_final_ayuntamiento_Noez/Areas/EconomiaHacienda.html">Economía, <br> Hacienda y <br> Bienestar Social</a></li>
                                <li><a class="dropdown-item" href="/Proyecto_final_ayuntamiento_Noez/Areas/NaturalezMedioambiente.html">Naturaleza <br> y Medioambiente</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link" href="#" id="ayuntamientoDropdown" role="button" data-bs-toggle="dropdown">
                                Ayuntamiento
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/Proyecto_final_ayuntamiento_Noez/Ayuntamiento/Información.html">Atención al cliente</a></li>
                                <li><a class="dropdown-item" href="/Proyecto_final_ayuntamiento_Noez/Ayuntamiento/EquipoGobierno.html">Equipo <br> de Gobierno</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link" href="#" id="infoDropdown" role="button" data-bs-toggle="dropdown">
                                Información
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/Proyecto_final_ayuntamiento_Noez/Controller?Operacion=listaNoticias">Noticias</a></li>
                                <li><a class="dropdown-item" href="/Proyecto_final_ayuntamiento_Noez/Controller?Operacion=listarEventos">Eventos</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="https://noez.sedelectronica.es/info.0"> <i class="fa fa-reply pe-2"></i>Sede Electrónica</a>
                        </li>

                       <li class="nav-item" id="adminNavItem" style="">
                            <a class="nav-link" href="/Proyecto_final_ayuntamiento_Noez/Administrador/Admin.html">Administrador</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>

`;
/*document.querySelector("header").innerHTML = header;
function checkAdminRole() {
    
    const rol = sessionStorage.getItem("rol"); 
    if (rol && rol === "admin") {
        document.getElementById("adminNavItem").style.display = "block"; 
    }
}
checkAdminRole();
*/
document.addEventListener('DOMContentLoaded', () => {
document.querySelector("header").innerHTML = header;
});