document.addEventListener('DOMContentLoaded', () => {
    console.log("✅ Script cargado");

    const form1 = document.getElementById('form-noticia');
    const form2 = document.getElementById('form-evento');
    form1.addEventListener('submit', function (event) {
        event.preventDefault();

        const Titulo = document.getElementById('titulo-noticia').value.trim();
        const Fecha = document.getElementById('fecha-noticia').value.trim();
        const Autor = document.getElementById('autor-noticia').value.trim();
        const ImagenInput = document.getElementById('imagen-noticia');
        const Resumen = document.getElementById('resumen-noticia').value.trim();
        const Contenido = document.getElementById('contenido-noticia').value.trim();
		const fechaSeleccionada = new Date(Fecha);
		const hoy = new Date();
		hoy.setHours(0, 0, 0, 0);
        // Validar campos vacíos
        if (!Titulo || !Fecha || !Autor || ImagenInput.files.length === 0 || !Resumen || !Contenido) {
            alert("Por favor, completa todos los campos.");
            return;
        }

         const archivo = ImagenInput.files[0];

    	if (!archivo) return;

   	 const nombreArchivo = archivo.name.toLowerCase();
    	const extensionValida = /\.(jpg|jpeg|png)$/i;
    	const tamañoMaximo = 5 * 1024 * 1024; // 5 MB en bytes

    	if (!extensionValida.test(nombreArchivo)) {
        alert("La imagen debe tener formato .jpg, .jpeg o .png.");
        imagenInput.value = ""; // Limpia el campo
        return;
    	}

    	if (archivo.size > tamañoMaximo) {
        alert("La imagen no debe superar los 5 MB.");
        imagenInput.value = ""; // Limpia el campo
        return;
    	}

    // Si pasa todas las validaciones, puedes continuar
    console.log("Imagen válida:", nombreArchivo);

        // Validaciones de longitud
        if (Resumen.length < 20 || Resumen.length > 500) {
            alert("El resumen debe tener entre 20 y 500 caracteres.");
            return;
        }

        if (Contenido.length < 100 || Contenido.length > 5000) {
            alert("El contenido debe tener entre 100 y 5000 caracteres.");
            return;
        }

        if (Titulo.length > 100) {
            alert("El título no puede exceder los 100 caracteres.");
            return;
        }

        if (Autor.length > 50) {
            alert("El autor no puede exceder los 50 caracteres.");
            return;
        }
		if (fechaSeleccionada > hoy) {
		   alert("❌ La fecha de una noticia no puede ser futura.");
		   return false; // Evita que se envíe el formulario
		 }

        // Mostrar spinner y enviar
        document.getElementById('loadingSpinner').classList.remove('d-none');
        console.log("✅ Envío del formulario con imagen válida");
        form1.submit();
    });
     form2.addEventListener('submit', function (event) {
        event.preventDefault();

        const Titulo = document.getElementById('titulo-evento').value.trim();
        const Fecha = document.getElementById('fecha-evento').value.trim();
        const lugar = document.getElementById('lugar-evento').value.trim();
        const ImagenInput = document.getElementById('imagen-evento');
        const Resumen = document.getElementById('resumen-evento').value.trim();
        const Contenido = document.getElementById('contenido-evento').value.trim();
		const fechaSeleccionada = new Date(Fecha);
				const hoy = new Date();
				hoy.setHours(0, 0, 0, 0);
        // Validar campos vacíos
		 if (!Titulo || !Fecha || !lugar || ImagenInput.files.length === 0 || !Resumen || !Contenido) {
			 alert("Por favor, completa todos los campos.");
			 return;
		 }
        // Validar extensión de imagen
        const nombreArchivo = ImagenInput.files[0].name.toLowerCase();
        const extensionValida = /\.(jpg|jpeg|png)$/i;

        if (!extensionValida.test(nombreArchivo)) {
            alert("La imagen debe tener formato .jpg, .jpeg o .png.");
            return;
        }

        // Validaciones de longitud
        if (Resumen.length < 20 || Resumen.length > 500) {
            alert("El resumen debe tener entre 20 y 500 caracteres.");
            return;
        }

        if (Contenido.length < 100 || Contenido.length > 5000) {
            alert("El contenido debe tener entre 100 y 5000 caracteres.");
            return;
        }

        if (Titulo.length > 100) {
            alert("El título no puede exceder los 100 caracteres.");
            return;
        }
		if(fechaSeleccionada < hoy) {
			                       alert("❌ La fecha de un evento no puede ser pasada.");
				                          return ; // Evita que se envíe el formulario
									  }	

        

        // Mostrar spinner y enviar
        document.getElementById('loadingSpinner').classList.remove('d-none');
        console.log("✅ Envío del formulario con imagen válida");
        form2.submit();
    });




});
