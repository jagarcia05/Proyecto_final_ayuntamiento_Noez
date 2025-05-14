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
    <link rel="stylesheet" href="/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">







</head>

<body class="bg-beige">
    <header></header>

    <!-- Spinner para carga -->
    <div id="loadingSpinner" class="d-none">
        <div class="spinner-border" role="status">
            <span class="visually-hidden">Cargando...</span>
        </div>
    </div>

    <div class="mensaje" id="mensaje" class="d-none">
        <div class="alert alert-success" id="mensaje-exito" style="display:none;">
            <strong>¡Éxito!</strong> La noticia se ha insertado correctamente.
        </div>
        <div class="alert alert-danger" id="mensaje-error" style="display:none;">
            <strong>Error:</strong> Ha ocurrido un error al insertar la noticia.
        </div>
    </div>

    <main class="container py-5">
        <h2 class="pt-5 text-center">✏️ Actualizar Noticia</h2>
        <form id="form-actualizar-noticia" action="Controller" method="post" enctype="multipart/form-data">
            <input type="hidden" name="operacion" value="actualizarNoticia">
            <input type="hidden" name="id" value="<%= noticia.getId() %>">

            <div class="mb-3">
                <label for="titulo-noticia-actualizar" class="form-label">Título</label>
                <input type="text" class="form-control" id="titulo-noticia-actualizar" name="titulo"
                    value="<%= noticia.getTitulo() %>" required>
            </div>

            <div class="mb-3">
                <label for="fecha-noticia-actualizar" class="form-label">Fecha</label>
                <input type="date" class="form-control" id="fecha-noticia-actualizar" name="fecha"
                    value="<%= noticia.getFecha() %>" required>
            </div>

            <div class="mb-3">
                <label for="autor-noticia-actualizar" class="form-label">Autor</label>
                <input type="text" class="form-control" id="autor-noticia-actualizar" name="autor"
                    value="<%= noticia.getAutor() %>" required>
            </div>

            <div class="mb-3">
                <label for="imagen-noticia-actualizar" class="form-label">Imagen (JPG/PNG)
                    (opcional)</label>
                <input type="file" class="form-control" id="imagen-noticia-actualizar" name="imagen"
                    accept=".jpg,.jpeg,.png">
            </div>

            <div class="mb-3">
                <label for="resumen-noticia-actualizar" class="form-label">Resumen</label>
                <textarea class="form-control" id="resumen-noticia-actualizar" name="resumen" rows="3"
                    required><%= noticia.getResumen() %></textarea>
            </div>

            <div class="mb-3">
                <label for="contenido-noticia-actualizar" class="form-label">Contenido
                    completo</label>
                <textarea class="form-control" id="contenido-noticia-actualizar" name="contenidoCompleto" rows="6"
                    required></textarea>
            </div>

            <button type="submit" class="btn btn-warning">Actualizar Noticia</button>
        </form>




        <h2 class="pt-5 text-center">✏️ Actualizar Evento</h2>
        <form id="form-actualizar" action="Controller" method="post" enctype="multipart/form-data">
            <input type="hidden" name="operacion" value="actualizarEvento">
            <input type="hidden" name="id" value="<%= evento.getId() %>">

            <div class="mb-3">
                <label for="titulo-evento" class="form-label">Título del
                    evento</label>
                <input type="text" class="form-control" id="titulo-evento" name="titulo"
                    value="<%= evento.getTitulo() %>" required>
            </div>

            <div class="mb-3">
                <label for="fecha-evento" class="form-label">Fecha</label>
                <input type="date" class="form-control" id="fecha-evento" name="fecha" value="<%= evento.getFecha() %>"
                    required>
            </div>

            <div class="mb-3">
                <label for="lugar-evento" class="form-label">Lugar</label>
                <input type="text" class="form-control" id="lugar-evento" name="lugar" value="<%= evento.getLugar() %>"
                    required>
            </div>

            <div class="mb-3">
                <label for="imagen-evento" class="form-label">Imagen (JPG/PNG)
                    (opcional)</label>
                <input type="file" class="form-control" id="imagen-evento" name="imagen" accept=".jpg,.jpeg,.png">
            </div>

            <div class="mb-3">
                <label for="resumen-evento" class="form-label">Resumen</label>
                <textarea class="form-control" id="resumen-evento" name="resumen-evento" rows="3"
                    required><%= evento.getResumen() %></textarea>
            </div>

            <div class="mb-3">
                <label for="contenido-evento" class="form-label">Descripción
                    completa</label>
                <textarea class="form-control" id="contenido-evento" name="descripcionCompleta" rows="6"
                    required><%= evento.getDescripcionCompleta() %></textarea>
            </div>

            <button type="submit" class="btn btn-warning">Actualizar Evento</button>
        </form>


    </main>

    <footer></footer>
    <script src="../partescomunes/footer.js"></script>
    <script src="../partescomunes/header.js"></script>
    <script src="../js/validacionformulario.js"></script>

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