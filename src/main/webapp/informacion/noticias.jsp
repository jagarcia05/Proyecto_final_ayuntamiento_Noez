<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="es">

<head>
    <title>Ayuntamiento Noez - Noticias</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="/Proyecto_final_ayuntamiento_Noez/css/style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
</head>

<body class="bg-beige">
    <header></header>

    <main class="container py-5">

        <c:if test="${not empty ListaNoticias}">
            <h2 class="text-center mb-5">📰 Lista de Noticias</h2>
            <div class="row row-cols-1 row-cols-md-2 g-4">
                <c:forEach var="noticia" items="${ListaNoticias}">
                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${noticia.imagen}" class="card-img-top" alt="Imagen noticia"
                                style="height: 200px; object-fit: cover;" />
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title">${noticia.titulo}</h5>
                                <p class="text-muted mb-2">
                                    <i class="fa-regular fa-calendar me-1"></i>
                                    <fmt:formatDate value="${noticia.fecha}" pattern="dd 'de' MMMM 'de' yyyy" />
                                    <span class="mx-2">|</span>
                                    <i class="fa-regular fa-user me-1"></i>${noticia.autor}
                                </p>
                                <p class="card-text text-truncate" style="max-height: 4.5em; overflow: hidden;">
                                    ${noticia.resumen}
                                </p>

                                <div class="mt-auto d-flex justify-content-between align-items-center">
                                    <a href="Controller?operacion=noticiaseleccionada&id=${noticia.id}"
                                        class="btn btn-primary btn-sm px-3">Leer completa</a>

                                    <div class="d-none Evento-admin">
                                       <button class="eliminar-noticia btn btn-danger" data-id="${noticia.id}" data-page="${paginaActual}">Eliminar</button>
                                       
                                        
                                        <a href="Controller?operacion=ActualizarNoticiaPagina&id=${noticia.id}"
                                            class="btn btn-success ">Actualizar</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Paginación -->
            <nav aria-label="Paginación noticias" class="mt-4">
                <ul class="pagination justify-content-center mb-0">
                    <c:if test="${paginaActual > 1}">
                        <li class="page-item">
                            <a class="page-link" href="Controller?operacion=listaNoticias&page=${paginaActual - 1}">Anterior</a>
                        </li>
                    </c:if>

                    <c:forEach begin="1" end="${totalPaginas}" var="i">
                        <li class="page-item ${i == paginaActual ? "active" : ""}">
                            <a class="page-link" href="Controller?operacion=listaNoticias&page=${i}">${i}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${paginaActual < totalPaginas}">
                        <li class="page-item">
                            <a class="page-link" href="Controller?operacion=listaNoticias&page=${paginaActual + 1}">Siguiente</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </c:if>

        <c:if test="${totalNoticias == 0}">
            <h3 class="text-center mt-5">No hay noticias disponibles</h3>
            <div class="text-center d-none Evento-admin" >
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
        document.querySelectorAll('.eliminar-noticia').forEach(btn => {
            btn.addEventListener('click', function(event) {
                event.preventDefault();

                const id = this.dataset.id;
                const page = parseInt(this.dataset.page, 10) || 1;
                console.log("Página para eliminar noticia:", page);

                if (!id) {
                    alert("❌ ID de noticia no válido.");
                    return;
                }

                if (!confirm("¿Estás seguro de que quieres eliminar esta noticia?")) {
                    return;
                }

                fetch('Controller', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        operacion: 'EliminarNoticia',
                        id: id,
                        page: page
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.exito) {
                    	console.log("Noticia eliminada con éxito:", data.redirigirPagina);
                        const redirigir = data.redirigirPagina ;
                       
                        console.log("Redirigiendo a página:", redirigir);
                        
                        alert("✅ Eliminado correctamente.");
                        window.location.assign('/Proyecto_final_ayuntamiento_Noez/Controller?operacion=listaNoticias&page=' + redirigir);

                    } else {
                        alert("❌ Error al eliminar.");
                    }
                })
                .catch(error => {
                    console.error("Error de red:", error);
                    alert("❌ Error de red.");
                });
            });
        });
    });



    </script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
