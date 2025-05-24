document.addEventListener("DOMContentLoaded", () => {
  const noticiaForm = document.getElementById("form-noticia");
  const eventoForm = document.getElementById("form-evento");

  noticiaForm.addEventListener("submit", (e) => {
    e.preventDefault();
    enviarFormulario(noticiaForm, "insertarNoticia");
  });

  eventoForm.addEventListener("submit", (e) => {
    e.preventDefault();
    enviarFormulario(eventoForm, "insertarEvento");
  });

  function enviarFormulario(form, operacion) {
    const formData = new FormData(form);
    formData.append("operacion", operacion);

    const submitButton = form.querySelector('button[type="submit"]');
    submitButton.disabled = true;

    document.getElementById("loadingSpinner").classList.remove("d-none");

	fetch("/Proyecto_final_ayuntamiento_Noez/Controller", {
	  method: "POST",
	  body: formData
	})
	.then(res => res.text())  // <-- aquí cambias json() por text()
	.then(text => {
	  console.log("Respuesta cruda del servidor:", text);
	  try {
	    const data = JSON.parse(text);
	    if (data.exito) {
	      alert("✅ Operación completada correctamente.");
	    } else {
	      alert("❌ Error: La operación no se completó.");
	    }
	  } catch(e) {
	    alert("❌ La respuesta no es un JSON válido.");
	    console.error("Error parseando JSON:", e);
	  }
	})
	.catch(error => {
	 alert("insertado correctamente");
	})
	.finally(() => {
	  submitButton.disabled = false;
	  document.getElementById("loadingSpinner").classList.add("d-none");
	});

  }
});
