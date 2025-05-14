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


    <main>



        <section class="ultima-noticia bg-light py-5">
            <div class="container">
                <h2 class="text-center mb-5">📰 Lista Noticias</h2>

                <div class="row align-items-center">
                    <!-- Imagen destacada -->
                    <div class="col-lg-6 mb-4 mb-lg-0 text-center">
                        <img src="img/imagen_escudo.png" alt="Imagen de la noticia"
                            class="img-fluid rounded shadow-lg border border-2 border-primary"
                            style="max-height: 400px;">
                    </div>

                    <!-- Contenido de la noticia -->
                    <div class="col-lg-6">
                        <h3 class="mb-3">Título de la Noticia Más Completa</h3>
                        <p class="text-muted mb-2"><i class="bi bi-calendar-event"></i> 14 de mayo de 2025 | <i
                                class="bi bi-person-circle"></i> Redacción Noticias</p>
                        <p class="text-justify">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque id sapien nec nulla
                            vulputate
                            pretium. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac
                            turpis
                            egestas. In vitae dolor vitae turpis tincidunt laoreet. Vivamus euismod, arcu quis efficitur
                            tincidunt, lorem sapien convallis quam, et volutpat est lacus ut sem.
                        </p>
                        <p class="text-justify">
                            Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                            laudantium,
                            totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae
                            vitae
                            dicta sunt explicabo.
                        </p>
                        <a href="Controller?operacion=noticiaselecionada&id={noticia.id}"
                            class="btn btn-primary mt-3 px-4 py-2">Leer noticia completa</a>
                        <c:if test="${usuario.rol == 'admin'}">

                            <a href="Controller?operacion=EliminarNoticia&id=1" id="eliminar-Noticia"
                                data-id="{noticia.id}" class="btn btn-success mt-3 px-4 py-2">Eliminar Noticia</a>
                           <a href="/Administrador/ActualizarNoticia.jsp?id={id}" class="btn btn-success mt-3 px-4 py-2">Actualizar Noticia</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </section>



    </main>
    <footer></footer>
    <script src="../partescomunes/footer.js"></script>
    <script src="../partescomunes/header.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            document.getElementById('.eliminar-Noticia').forEach(btn => {
                btn.addEventListener('click', function () {
                    const id = this.dataset.id;

                    if (!confirm("¿Estás seguro de que quieres eliminar esta Noticia?")) {
                        return;
                    }

                    fetch(`Controller?operacion=EliminarNoticia&id=${id}`, {
                        method: 'GET'
                    })
                        .then(response => {
                            if (response.ok) {
                                alert("✅ Eliminado correctamente.");
                                // Puedes eliminar el elemento del DOM si lo deseas:
                                this.closest('.evento-container')?.remove();
                            } else {
                                alert("❌ Error al eliminar.");
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