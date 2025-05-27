<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!doctype html>
<html lang="es">

<head>
    <title>🏛️ Ayuntamiento Noez</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">
    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
</head>

<body class="bg-beige">
    <header></header>

    <main>

        <c:if test="${not empty evento}">
            <section class="container my-5" data-aos="fade-up">
                <h2 class="text-center mb-4">📅 Último Evento</h2>
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card shadow-sm">
                            <img src="${evento.imagen}" class="card-img-top" alt="Imagen del evento" style="height: 300px; object-fit: cover;">
                            <div class="card-body">
                                <h5 class="card-title">${evento.titulo}</h5>
                                <p class="card-text">${evento.resumen}</p>
                                <p><strong>📍 Lugar:</strong> ${evento.lugar}</p>
                                <p><small class="text-muted">🗓️ Fecha: ${evento.fecha}</small></p>
                                <a href="Controller?operacion=EventoSeleccionado&id=${evento.id}" class="btn btn-primary">Leer completa</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </c:if>

        <c:if test="${not empty noticia}">
            <section class="container my-5" data-aos="fade-up">
                <h2 class="text-center mb-4">📰 Última Noticia</h2>
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card shadow-sm">
                            <img src="${noticia.imagen}" class="card-img-top" alt="Imagen noticia" style="height: 300px; object-fit: cover;">
                            <div class="card-body">
                                <h5 class="card-title">${noticia.titulo}</h5>
                                <p class="text-muted mb-1">
                                    <i class="fa-regular fa-calendar"></i>
                                    <fmt:formatDate value="${noticia.fecha}" pattern="dd 'de' MMMM 'de' yyyy" />
                                    |
                                    <i class="fa-regular fa-user"></i>
                                    ${noticia.autor}
                                </p>
                                <p class="card-text">${noticia.resumen}</p>
                                <a href="Controller?operacion=noticiaseleccionada&id=${noticia.id}" class="btn btn-primary">Leer completa</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </c:if>

        <section class="sobreelpueblo container my-5">
            <div class="row align-items-center">
                <div class="col-md-6 mb-4" data-aos="fade-up">
                    <h2 class="text-center mb-4">🏞️ Sobre el Pueblo</h2>
                    <p style="text-align: justify;">
                        Noez es un encantador pueblo de la provincia de Toledo, en el corazón de Castilla-La Mancha,
                        donde la naturaleza y la tradición se funden para ofrecer una experiencia auténtica.
                        Con el imponente Pico de Noez como fondo, es el destino perfecto para los amantes del senderismo
                        y la vida al aire libre. Su arquitectura singular, reflejada en la majestuosa iglesia parroquial
                        y el palacio señorial, es testimonio vivo de la identidad local.
                        Además, las festividades patronales, celebradas cada segundo domingo de septiembre, fortalecen
                        el sentido de comunidad y herencia cultural, haciendo de Noez un lugar acogedor tanto para
                        residentes como para visitantes.
                    </p>
                </div>
                <div class="col-md-6 mb-4 text-center">
                    <img src="img/foto_pueblo.jpeg" alt="Vista panorámica del pueblo de Noez" class="img-fluid rounded shadow" data-aos="zoom-in" />
                </div>
            </div>
        </section>

        <section class="historia-Noez container my-5">
            <div class="row align-items-center">
                <div class="col-md-6 mb-4" data-aos="slide-left">
                    <h2 class="text-center mb-4">📜 Historia de Noez</h2>
                    <p style="text-align: justify;">
                        Noez es un pequeño pueblo de la provincia de Toledo con una rica trayectoria que se remonta al
                        siglo XIII. Documentos del año 1238 atestiguan su existencia durante la Reconquista, y en 1326
                        fue constituido como villa por Alfonso Fernández Nieto. Con el paso de los siglos, el control
                        del pueblo pasó a manos de la familia Niño en el siglo XV.
                    </p>
                    <p style="text-align: justify;">
                        Durante el reinado de Carlos II en 1672, Noez adquirió la categoría de villa, separándose de
                        Toledo y obteniendo el privilegio de jurisdicción, lo que permitió consolidar su identidad y
                        crecimiento. Hoy en día, elementos emblemáticos como el Palacio de los Niño y la iglesia
                        parroquial de San Julián siguen evocando la esencia histórica y cultural que define al pueblo.
                    </p>
                    <p style="text-align: justify;">
                        Noez continúa siendo un destino donde la tradición se une con el encanto rural, ofreciendo a sus
                        visitantes una mirada única al pasado mientras se mantiene vibrante en el presente.
                    </p>
                    <div class="text-center">
                        <a href="./pueblo/historia.html" class="btn btn-outline-primary mt-3">📖 Leer más</a>
                    </div>
                </div>
                <div class="col-md-6 mb-4 text-center">
                    <img src="img/86463-foto-antigua-1928.jpg" alt="Imagen antigua del pueblo de Noez"
                        class="img-fluid rounded shadow" data-aos="zoom-in" />
                </div>
            </div>
        </section>

    </main>

    <footer></footer>

    <script>
        AOS.init({
            duration: 1000,
            easing: 'ease-in-out',
            once: true
        });
    </script>

    <script src="/Proyecto_final_ayuntamiento_Noez/partescomunes/header.js"></script>
    <script src="/Proyecto_final_ayuntamiento_Noez/partescomunes/footer.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
</body>

</html>
