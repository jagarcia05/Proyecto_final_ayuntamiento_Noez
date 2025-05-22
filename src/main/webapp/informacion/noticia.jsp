<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="es">

<head>
    <title>Ayuntamiento Noez</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <link rel="stylesheet" href="/Proyecto_final_ayuntamiento_Noez/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>

<body class="bg-beige">
    <header></header>

    <main class="container py-5">

        <c:if test="${not empty noticiaSeleccionada}">
            <div class="card shadow">
                <img src="${noticiaSeleccionada.imagen}" class="card-img-top" alt="Imagen de la noticia"
                    style=" object-fit: cover;">
                <div class="card-body">
                    <h2 class="card-title">${noticiaSeleccionada.titulo}</h2>
                    <p class="text-muted">
                        <i class="fa fa-calendar-alt"></i> 
                        <fmt:formatDate value="${noticiaSeleccionada.fecha}" pattern="dd/MM/yyyy"/>
                        &nbsp;|&nbsp;
                        <i class="fa fa-user"></i> ${noticiaSeleccionada.autor}
                    </p>

                    <p class="card-text lead">${noticiaSeleccionada.resumen}</p>
                    <hr>
                    <div style="white-space: pre-line;">
                        ${noticiaSeleccionada.contenidoCompleto}
                    </div>

                    <a href="Controller?operacion=listaNoticias" class="btn btn-secondary mt-4">
                        <i class="fa-solid fa-arrow-left"></i> Volver a noticias
                    </a>
                </div>
            </div>
        </c:if>

        <c:if test="${empty noticiaSeleccionada}">
            <div class="alert alert-warning text-center" role="alert">
                No se ha encontrado la noticia seleccionada.
            </div>
        </c:if>

    </main>

    <footer></footer>
    <script src="/Proyecto_final_ayuntamiento_Noez/partescomunes/footer.js"></script>
    <script src="/Proyecto_final_ayuntamiento_Noez/partescomunes/header.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
</body>

</html>
