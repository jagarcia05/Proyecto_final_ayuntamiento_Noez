document.addEventListener("DOMContentLoaded", () => {
    console.log("✅ Script cargado");

    const formNoticia = document.getElementById("form-noticia");
    const formEvento = document.getElementById("form-evento");

    formNoticia.addEventListener("submit", (e) => {
        e.preventDefault();
        if (validarNoticia()) {
            enviarFormulario(formNoticia, "insertarNoticia");
        }
    });

    formEvento.addEventListener("submit", (e) => {
        e.preventDefault();
        if (validarEvento()) {
            enviarFormulario(formEvento, "insertarEvento");
        }
    });

    function validarNoticia() {
        const titulo = document.getElementById("titulo-noticia").value.trim();
        const fecha = document.getElementById("fecha-noticia").value.trim();
        const autor = document.getElementById("autor-noticia").value.trim();
        const imagen = document.getElementById("imagen-noticia");
        const resumen = document.getElementById("resumen-noticia").value.trim();
        const contenido = document.getElementById("contenido-noticia").value.trim();
        const fechaSeleccionada = new Date(fecha);
        const hoy = new Date();
        hoy.setHours(0, 0, 0, 0);

        if (!titulo || !fecha || !autor || imagen.files.length === 0 || !resumen || !contenido) {
            alert("Por favor, completa todos los campos.");
            return false;
        }

        const archivo = imagen.files[0];
        const extensionValida = /\.(jpg|jpeg|png)$/i;
        const tamañoMaximo = 5 * 1024 * 1024;

        if (!extensionValida.test(archivo.name.toLowerCase())) {
            alert("La imagen debe tener formato .jpg, .jpeg o .png.");
            imagen.value = "";
            return false;
        }

        if (archivo.size > tamañoMaximo) {
            alert("La imagen no debe superar los 5 MB.");
            imagen.value = "";
            return false;
        }

        if (resumen.length < 20 || resumen.length > 500) {
            alert("El resumen debe tener entre 20 y 500 caracteres.");
            return false;
        }

        if (contenido.length < 100 || contenido.length > 5000) {
            alert("El contenido debe tener entre 100 y 5000 caracteres.");
            return false;
        }

        if (titulo.length > 100) {
            alert("El título no puede exceder los 100 caracteres.");
            return false;
        }

        if (autor.length > 50) {
            alert("El autor no puede exceder los 50 caracteres.");
            return false;
        }

        if (fechaSeleccionada > hoy) {
            alert("❌ La fecha de una noticia no puede ser futura.");
            return false;
        }

        return true;
    }

    function validarEvento() {
        const titulo = document.getElementById("titulo-evento").value.trim();
        const fecha = document.getElementById("fecha-evento").value.trim();
        const lugar = document.getElementById("lugar-evento").value.trim();
        const imagen = document.getElementById("imagen-evento");
        const resumen = document.getElementById("resumen-evento").value.trim();
        const contenido = document.getElementById("contenido-evento").value.trim();
        const fechaSeleccionada = new Date(fecha);
        const hoy = new Date();
        hoy.setHours(0, 0, 0, 0);

        if (!titulo || !fecha || !lugar || imagen.files.length === 0 || !resumen || !contenido) {
            alert("Por favor, completa todos los campos.");
            return false;
        }

        const archivo = imagen.files[0];
        const extensionValida = /\.(jpg|jpeg|png)$/i;

        if (!extensionValida.test(archivo.name.toLowerCase())) {
            alert("La imagen debe tener formato .jpg, .jpeg o .png.");
            imagen.value = "";
            return false;
        }

        if (resumen.length < 20 || resumen.length > 500) {
            alert("El resumen debe tener entre 20 y 500 caracteres.");
            return false;
        }

        if (contenido.length < 100 || contenido.length > 5000) {
            alert("El contenido debe tener entre 100 y 5000 caracteres.");
            return false;
        }

        if (titulo.length > 100) {
            alert("El título no puede exceder los 100 caracteres.");
            return false;
        }

        if (fechaSeleccionada < hoy) {
            alert("❌ La fecha de un evento no puede ser pasada.");
            return false;
        }

        return true;
    }

    function enviarFormulario(form, operacion) {
        const formData = new FormData(form);
        formData.append("operacion", operacion);

        const submitButton = form.querySelector('button[type="submit"]');
        submitButton.disabled = true;

        document.getElementById("loadingSpinner").classList.remove("d-none");

        fetch("/Proyecto_final_ayuntamiento_Noez/Controller", {
            method: "POST",
            body: formData,
        })
            .then((res) => res.text())
            .then((text) => {
                console.log("Respuesta cruda del servidor:", text);
                try {
                    const data = JSON.parse(text);
                    if (data.exito) {
                        alert("✅ Operación completada con éxito.");
                        form.reset();
                    } else {
                        alert("❌ Error: La operación no se completó.");
                    }
                } catch (e) {
                    alert("❌ La respuesta no es un JSON válido.");
                    console.error("Error parseando JSON:", e);
                }
            })
            .catch((error) => {
                alert("❌ Error de red o del servidor.");
                console.error(error);
            })
            .finally(() => {
                submitButton.disabled = false;
                document.getElementById("loadingSpinner").classList.add("d-none");
            });
    }
});
