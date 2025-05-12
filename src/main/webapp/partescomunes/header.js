const header = `

<header class="shadow-sm">

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
                <img src="/img/imagen_escudo.png" alt="Escudo de Noez" class="img-fluid me-3" style="height: 100px;" />
                <h1 class="mb-0 fs-4 text-marron">Ayuntamiento de Noez</h1>
            </div>
            <div class="d-none d-md-block">
                <button class="btn-ayuntamiento">Iniciar sesión</button>
            </div>
        </div>

        <nav class="navbar navbar-expand-lg bg-principal navbar-dark">
            <div class="container">
                <a class="navbar-brand d-lg-none" href="#">Menú</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-center" id="mainNav">
                    <ul class="navbar-nav">

                        <li class="nav-item">
                            <a class="nav-link" href="../index.html">Inicio</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link" href="#" id="puebloDropdown" role="button" data-bs-toggle="dropdown">
                                Pueblo
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/pueblo/historia.html">Historia</a></li>
                                <li><a class="dropdown-item" href="/pueblo/Fiestas.html">Fiestas</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link" href="#" id="puebloDropdown" role="button" data-bs-toggle="dropdown">
                                Áreas
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/Areas/JuventudDeporte.html">Juventud y <br> Deporte</a></li>
                                <li><a class="dropdown-item" href="./CulturaEducacionFestejo.html">Cultura, Educación, <br> Festejos</a></li>
                                <li><a class="dropdown-item" href="/Areas/EconomiaHacienda.html">Economía, <br> Hacienda y <br> Bienestar Social</a></li>
                                <li><a class="dropdown-item" href="/Areas/NaturalezMedioambiente.html">Naturaleza <br> y Medioambiente</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link" href="#" id="ayuntamientoDropdown" role="button" data-bs-toggle="dropdown">
                                Ayuntamiento
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/Ayuntamiento/Información.html">Atención al cliente</a></li>
                                <li><a class="dropdown-item" href="/Ayuntamiento/EquipoGobierno.html">Equipo <br> de Gobierno</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link" href="#" id="infoDropdown" role="button" data-bs-toggle="dropdown">
                                Información
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Noticias</a></li>
                                <li><a class="dropdown-item" href="#">Eventos</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="https://noez.sedelectronica.es/info.0"> <i class="fa fa-reply pe-2"></i>Sede Electrónica</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>

`;
document.querySelector("header").innerHTML = header;





