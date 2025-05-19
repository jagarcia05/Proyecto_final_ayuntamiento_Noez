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

        <section class="bg-light py-5">
            <div class="container">
                <h2 class="text-center mb-5">🎉 Próximos Eventos</h2>

                <div class="row align-items-center mb-5">
                    <!-- Imagen del evento -->
                    <div class="col-lg-6 text-center">
                        <img src="img/eventos/romeria2025.jpg" alt="Imagen del evento"
                            class="img-fluid rounded shadow-lg border border-2 border-success"
                            style="max-height: 400px;">
                    </div>

                   
                    <div class="col-lg-6">
                        <h3 class="mb-3">Romería de San Isidro 2025</h3>
                        <p class="text-muted mb-2"><i class="fa fa-calendar"></i> 15 de mayo de 2025 | <i
                                class="fa fa-map-marker-alt"></i> Ermita de San Isidro</p>
                        <p class="text-justify">
                            Celebra con nosotros la tradicional romería en honor a San Isidro Labrador. Una jornada de
                            convivencia, comida popular, actividades infantiles y misa al aire libre.
                        </p>
                        <a href="Controller?operacion=eventoseleccionado&id=1"
                            class="btn btn-success mt-3 px-4 py-2">Ver evento completo</a>
                        <c:if test="${usuario.rol == 'admin'}">
                            
                        <a href="" id="eliminar-evento" data-id="{evento.id}"
                            class="btn btn-success mt-3 px-4 py-2">Eliminar Evento</a>
                        <a href="/Administrador/ActualizarEvento.jsp?id={id}" class="btn btn-success mt-3 px-4 py-2">Actualizar Evento</a>

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
            document.getElementById('.eliminar-Evento').forEach(btn => {
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