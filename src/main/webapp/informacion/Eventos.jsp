<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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


    <main>

      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>






<c:if test="${not empty ListaEvento}">
    <h2 class="pt-5 text-center mb-4">📝 Lista de Eventos</h2>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <c:forEach var="evento" items="${ListaEvento}">
            <div class="col">
                <div class="card h-100 shadow-sm">
                    <img src="${evento.imagen}" class="card-img-top" alt="Imagen del evento" style="height: 200px; object-fit: cover;">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">${evento.titulo}</h5>
                        <p class="card-text text-truncate">${evento.resumen}</p>
                        <p class="card-text"><strong>Lugar:</strong> ${evento.lugar}</p>
                        <p class="card-text"><small class="text-muted">Fecha: ${evento.fecha}</small></p>

                        <div class="mt-auto d-flex justify-content-between align-items-center">
                            <a href="Controller?operacion=EventoSeleccionado&id=${evento.id}" class="btn btn-primary btn-sm px-3">Leer completa</a>

                            
                                <div class ="d-none" id="Evento-admin">
                                    <a href="" data-id="eliminar-Evento"
                                       class="btn btn-danger btn-sm me-2 eliminar-evento" 
                                       >
                                        Eliminar
                                    </a>
                                    <a href="/Administrador/ActualizarEvento.jsp?id=${evento.id}" 
                                       class="btn btn-success btn-sm">
                                        Actualizar
                                    </a>
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

<c:if test="${empty ListaEvento}">
    <h2 class="pt-5 text-center">No hay eventos disponibles</h2>
    <p class="text-center">Por favor, añade un evento.</p>
    <div class="text-center">
        <a href="InsertarEvento.jsp" class="btn btn-primary">Añadir Evento</a>
    </div>
</c:if>


    </main>
    <footer></footer>

    <script src="/Proyecto_final_ayuntamiento_Noez/partescomunes/footer.js"></script>
    <script src="/Proyecto_final_ayuntamiento_Noez/partescomunes/header.js"></script>

    <script src="/partescomunes/footer.js"></script>
    <script src="/partescomunes/header.js"></script>

  <script>
        document.addEventListener('DOMContentLoaded', () => {
            document.getElementById('.eliminar-Evento').forEach(btn => {
                btn.addEventListener('click', function () {
                    const id = this.dataset.id;

                    if (!confirm("Â¿EstÃ¡s seguro de que quieres eliminar esta Noticia?")) {
                        return;
                    }

                    fetch(`Controller?operacion=EliminarNoticia&id=${id}`, {
                        method: 'GET'
                    })
                        .then(response => {
                            if (response.ok) {
                                alert("â Eliminado correctamente.");
                                // Puedes eliminar el elemento del DOM si lo deseas:
                                this.closest('.evento-container')?.remove();
                            } else {
                                alert("â Error al eliminar.");
                            }
                        })
                        .catch(error => {
                            console.error("Error:", error);
                            alert("â Error de red.");
                        });
                });
            });
        });



    </script>
    <script src="/Proyecto_final_ayuntamiento_Noez/partescomunes/header.js"   ></script>

    <script src="/Proyecto_final_ayuntamiento_Noez/partescomunes/footer.js"></script>
    
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