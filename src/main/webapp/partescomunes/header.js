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
			<div class="d-none d-md-flex align-items-center gap-3">
			    <button type="button" class="btn-ayuntamiento btn mt-3" data-bs-toggle="modal" data-bs-target="#ModalIniciarSesion" id="iniciar-session1">Iniciar Sesión</button>
			    
			    <h3 class="mb-0 fs-4 d-none text-center" id="usuario-nombre"></h1>
				<button type="button" class="btn-ayuntamiento btn mt-3 d-none" id="cerrar-sesion">Cerrar Sesion</button>
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
          <button type="submit" class="btn btn-localizacion " id ="iniciar-session" >Iniciar sesión</button>
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
                            <a class="nav-link" href="/Proyecto_final_ayuntamiento_Noez/Controller?operacion=inicio">Inicio</a>
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
                                <li><a class="dropdown-item" href="/Proyecto_final_ayuntamiento_Noez/Controller?operacion=listaNoticias">Noticias</a></li>
                                <li><a class="dropdown-item" href="/Proyecto_final_ayuntamiento_Noez/Controller?operacion=listarEventos">Eventos</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="https://noez.sedelectronica.es/info.0"> <i class="fa fa-reply pe-2"></i>Sede Electrónica</a>
                        </li>

                       <li class="nav-item d-none" id="adminNavItem" style="">
                            <a class="nav-link" href="/Proyecto_final_ayuntamiento_Noez/Administrador/Admin.html">Administrador</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>

`;


document.addEventListener('DOMContentLoaded', () => {
    document.querySelector("header").innerHTML = header;
    inicializarLogin();
});

function inicializarLogin() {
    const cerrarButton = document.getElementById("cerrar-sesion");
    const usuarioNombre = document.getElementById("usuario-nombre");
    const adminNavItem = document.getElementById("adminNavItem");
    const iniciarSesionBtn = document.getElementById("iniciar-session1");
    const eventoAdminDiv = document.getElementById("Evento-admin");

    const usuario = sessionStorage.getItem("usuario");
    const rol = sessionStorage.getItem("rol");

    if (usuario && rol) {
        if (usuarioNombre) {
            usuarioNombre.textContent = "Usuario: " + usuario;
            usuarioNombre.classList.remove("d-none");
        }
        if (cerrarButton) cerrarButton.classList.remove("d-none");
        if (iniciarSesionBtn) iniciarSesionBtn.classList.add("d-none");

        // Mostrar div Evento-admin si hay sesión iniciada (independientemente del rol)
        if (eventoAdminDiv) eventoAdminDiv.classList.remove("d-none");

        // Mostrar nav Admin solo si el rol es admin
        if (rol === "admin" && adminNavItem) {
            adminNavItem.classList.remove("d-none");
        }
    } else {
        if (usuarioNombre) usuarioNombre.classList.add("d-none");
        if (cerrarButton) cerrarButton.classList.add("d-none");
        if (iniciarSesionBtn) iniciarSesionBtn.classList.remove("d-none");
        if (adminNavItem) adminNavItem.classList.add("d-none");
        if (eventoAdminDiv) eventoAdminDiv.classList.add("d-none");
    }

    // Gestión del formulario de login
    const loginForm = document.querySelector("#ModalIniciarSesion form");
    if (loginForm) {
        loginForm.addEventListener("submit", function (event) {
            event.preventDefault();

            const usuarioInput = document.getElementById("usuario");
            const contrasenaInput = document.getElementById("contrasena");

            if (!usuarioInput || !contrasenaInput) {
                alert("Error interno: no se encuentran los campos de login.");
                return;
            }

            const usuario = usuarioInput.value.trim();
            const contrasena = contrasenaInput.value.trim();

            if (usuario === "" || contrasena === "") {
                alert("Por favor, completa todos los campos.");
                return;
            }

            fetch("Controller?operacion=login1", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: new URLSearchParams({
                    usuario: usuario,
                    contrasena: contrasena
                })
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success && data.rol && data.nombre) {
                        sessionStorage.setItem("rol", data.rol);
                        sessionStorage.setItem("usuario", data.nombre);
                        alert("Inicio de sesión exitoso");
                        location.reload();
                    } else {
                        sessionStorage.clear();
                        alert(data.message || "Usuario o contraseña incorrectos.");
                    }
                })
                .catch(error => {
                    sessionStorage.clear();
                    console.error('Error en el login:', error);
                    alert("Error en el servidor. Intenta más tarde.");
                });
        });
    }

    if (cerrarButton) {
        cerrarButton.addEventListener("click", function () {
            sessionStorage.clear();
            location.reload();
        });
    }
}
