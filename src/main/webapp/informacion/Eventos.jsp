<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="es">

<head>
    <title>Ayuntamiento Noez</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS v5.3.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <link rel="stylesheet" href="/Proyecto_final_ayuntamiento_Noez/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&family=Poppins&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
</head>

<body class="bg-beige">
    <header></header>

    <main class="container py-5">
        <c:if test="${not empty ListaEvento}">
            <h2 class="pt-5 text-center mb-4">📝 Lista de Eventos</h2>

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
                <c:forEach var="evento" items="${ListaEvento}">
                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${evento.imagen}" class="card-img-top" alt="Imagen del evento" style="height: 200px; object-fit: cover;">
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title">${evento.titulo}</h5>
                                <p class="card-text text-truncate">${evento.resumen}</p>
                                <p class="card-text"><strong>Lugar:</strong> ${evento.lugar}</p>
                                <p class="card-text"><small class="text-muted">Fecha: ${evento.fecha}</small></p>

                                <div class="mt-auto d-flex justify-content-between">
                                    <a href="Controller?operacion=EventoSeleccionado&id=${evento.id}" class="btn btn-primary btn-sm">Leer completa</a>

                                    <div class="d-none Evento-admin" >
                                        <button class="btn btn-danger eliminar-evento" data-id="${evento.id}" data-page="${paginaActual}">
										    Eliminar
										</button>
                                        <a href="Controller?operacion=ActualizarEventoPagina&id=${evento.id}" class="btn btn-success ">Actualizar</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Paginación -->
            <nav aria-label="Page navigation" class="mt-4">
                <ul class="pagination justify-content-center">
                    <c:if test="${paginaActual > 1}">
                        <li class="page-item">
                            <a class="page-link" href="Controller?operacion=listarEventos&page=${paginaActual - 1}">Anterior</a>
                        </li>
                    </c:if>

                    <c:forEach begin="1" end="${totalPaginas}" var="i">
                        <li class="page-item ${i == paginaActual ? 'active' : ''}">
                            <a class="page-link" href="Controller?operacion=listarEventos&page=${i}">${i}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${paginaActual < totalPaginas}">
                        <li class="page-item">
                            <a class="page-link" href="Controller?operacion=listarEventos&page=${paginaActual + 1}">Siguiente</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </c:if>

        <c:if test="${totalEventos == 0}">
            <h2 class="pt-5 text-center">No hay eventos disponibles</h2>
            <div class="text-center d-none Evento-admin">
                <p>Por favor, añade un evento.</p>
                <a href="/Proyecto_final_ayuntamiento_Noez/Administrador/Admin.html" class="btn btn-primary">Añadir Noticia</a>
            </div>
        </c:if>
    </main>

    <footer></footer>

    <script src="/Proyecto_final_ayuntamiento_Noez/partescomunes/footer.js"></script>
    <script src="/Proyecto_final_ayuntamiento_Noez/partescomunes/header.js"></script>

    <script>
    document.addEventListener('DOMContentLoaded', () => {
        document.querySelectorAll('.eliminar-evento').forEach(btn => {
            btn.addEventListener('click', function (e) {
                e.preventDefault();

                const id = this.dataset.id;
                const page = parseInt(this.dataset.page, 10) || 1;  // Aseguramos que page sea número, y si no, 1

                if (!id) {
                    alert("❌ ID de evento no válido.");
                    return;
                }

                if (!confirm("¿Estás seguro de que quieres eliminar este evento?")) {
                    return;
                }

                fetch('Controller', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        operacion: 'EliminarEvento',
                        id: id,
                        page: page
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.exito) {
                        const redirigir = data.redirigirPagina ;
                        alert("✅ Eliminado correctamente.");
                        window.location.assign('Controller?operacion=listarEventos&page=' + redirigir);
                        
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("❌ Error de red.");
                });
            });
        });
    });



    </script>

    <!-- Bootstrap JS bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
</body>

</html>
