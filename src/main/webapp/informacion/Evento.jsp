<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="es">

<head>
    <title>Ayuntamiento Noez</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <link rel="stylesheet" href="/Proyecto_final_ayuntamiento_Noez/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
</head>

<body class="bg-beige">
    <header></header>

    <main class="container py-5">

        <c:if test="${not empty eventoSeleccionado}">
            <div class="card shadow-sm mx-auto" style="max-width: 720px;">
                <img src="${eventoSeleccionado.imagen}" class="card-img-top" alt="Imagen del evento" style="object-fit: cover; max-height: 400px; width: 100%;">
                <div class="card-body">
                    <h2 class="card-title mb-3">${eventoSeleccionado.titulo}</h2>
                    <p class="mb-1"><strong>Lugar:</strong> ${eventoSeleccionado.lugar}</p>
                    <p class="mb-3"><strong>Fecha:</strong> ${eventoSeleccionado.fecha}</p>
                    <hr />
                    <p class="card-text">${eventoSeleccionado.descripcionCompleta}</p>
                    <a href="Controller?operacion=listarEventos" class="btn btn-secondary mt-4">
                        <i class="fa-solid fa-arrow-left"></i> Volver a eventos
                    </a>
                </div>
            </div>
        </c:if>

        <c:if test="${empty eventoSeleccionado}">
            <div class="alert alert-warning text-center" role="alert">
                No se ha encontrado el evento seleccionado.
            </div>
        </c:if>

    </main>

    <footer></footer>

    <script src="/Proyecto_final_ayuntamiento_Noez/partescomunes/footer.js"></script>
    <script src="/Proyecto_final_ayuntamiento_Noez/partescomunes/header.js"></script>

    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
