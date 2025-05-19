<!doctype html>
<html lang="en">

<head>
    <title>Ayuntamiento Noez</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
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
    <h1 class="mb-3"><%= Evento.getTitulo() %></h1>
    <p class="text-muted">
        <i class="fa fa-calendar-alt"></i>Evento.getFecha() %> |
        <i class="fa fa-map-marker-alt"></i> <%= Evento.getLugar() %>
    </p>

    <img src="img/eventos/<%= evento.getImagen() %>" class="img-fluid rounded mb-4 border" alt="Imagen del evento">

    <p class="lead"><%= Evento.getResumen() %></p>
    <hr>
    <div style="white-space: pre-line;">
        <%= Evento.getDescripcionCompleta() %>
    </div>

    <a href="Eventos.jsp" class="btn btn-secondary mt-4">← Volver a Eventos</a>
</main>
    <footer></footer>
    <script src="../partescomunes/footer.js"></script>
    <script src="../partescomunes/header.js"></script>

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