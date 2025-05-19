

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title><%= noticia.getTitulo() %> - Ayuntamiento de Noez</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap + Estilos -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" href="/Proyecto_final_ayuntamiento_Noez/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-light">
    
    <header></header>

   <main class="container py-5">
    <h1 class="mb-3"><%= Notica.getTitulo() %></h1>
    <p class="text-muted">
        <i class="fa fa-calendar-alt"></i>Notica.getFecha() %> |
        <i class="fa fa-map-marker-alt"></i> <%= Notica.getLugar() %>
    </p>

    <img src="img/eventos/<%= evento.getImagen() %>" class="img-fluid rounded mb-4 border" alt="Imagen del evento">

    <p class="lead"><%= Notica.getResumen() %></p>
    <hr>
    <div style="white-space: pre-line;">
        <%= Notica.getDescripcionCompleta() %>
    </div>

    <a href="noticia.jsp" class="btn btn-secondary mt-4">← Volver a Noticia</a>
</main>


    <footer></footer>
    <script src="/partescomunes/header.js"></script>
    <script src="/partescomunes/footer.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
