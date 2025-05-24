<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="es">

<head>
    <title>Ayuntamiento Noez - Actualizar Evento</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

      <link rel="stylesheet" href="/Proyecto_final_ayuntamiento_Noez/css/style.css">
  
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
</head>

<body class="bg-beige">
    <header></header>

    <main class="container py-5">
        <h2 class="pt-5 text-center">Actualizar Evento</h2>
        <form id="form-actualizar" action="Controller" method="post" enctype="multipart/form-data">
            <input type="hidden" name="operacion" value="actualizarEvento" />
            <input type="hidden" name="id" value="${eventoActualizar.id}" />

            <div class="mb-3">
                <label for="titulo-evento" class="form-label">Título del evento</label>
                <input type="text" class="form-control" id="titulo-evento" name="titulo" value="${eventoActualizar.titulo}" required />
            </div>

            <div class="mb-3">
                <label for="fecha-evento" class="form-label">Fecha</label>
                <input type="date" class="form-control" id="fecha-evento" name="fecha" value="${eventoActualizar.fecha}" required />
            </div>

            <div class="mb-3">
                <label for="lugar-evento" class="form-label">Lugar</label>
                <input type="text" class="form-control" id="lugar-evento" name="lugar" value="${eventoActualizar.lugar}" required />
            </div>

            <div class="mb-3">
                <label for="imagen-evento" class="form-label">Imagen (JPG/PNG) (opcional)</label>
                <input type="file" class="form-control" id="imagen-evento" name="imagen" accept=".jpg,.jpeg,.png" />
            </div>

            <div class="mb-3">
                <label for="resumen-evento" class="form-label">Resumen</label>
                <textarea class="form-control" id="resumen-evento" name="resumenEvento" rows="3" required>${eventoActualizar.resumen}</textarea>
            </div>

            <div class="mb-3">
                <label for="contenido-evento" class="form-label">Descripción completa</label>
                <textarea class="form-control" id="contenido-evento" name="descripcionCompleta" rows="6" required>${eventoActualizar.descripcionCompleta}</textarea>
            </div>

            <button type="submit" class="btn btn-warning">Actualizar Evento</button>
        </form>
		<c:if test="${not empty mensaje}">
			<div class="alert alert-success mt-4" role="alert">${mensaje}</div>
		</c:if>
	</main>

    <footer></footer>
  <script src="/Proyecto_final_ayuntamiento_Noez/partescomunes/footer.js"></script>
    <script src="/Proyecto_final_ayuntamiento_Noez/partescomunes/header.js"></script>
    <script src="/Proyecto_final_ayuntamiento_Noez/js/validacionformulario.js"></script>
    <!-- Bootstrap JS y dependencias -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
</body>

</html>
