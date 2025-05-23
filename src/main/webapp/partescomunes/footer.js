const footer = `
<footer class="bg-principal text-white p-5" data-aos="fade-up">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-left mb-3 mb-md-0">
                <p class="mb-0">&copy; 2025 Ayuntamiento de Noez</p>
            </div>
            <div class="col-md-6 text-center text-md-right">
                <a href="https://www.facebook.com/p/Ayuntamiento-De-NOEZ-100064458951118/?locale=es_ES"
                   target="_blank" class="text-white mx-2 text-decoration-none" aria-label="Facebook">
                    <i class="fab fa-facebook fa-lg"></i> Facebook
                </a>
                <a href="https://sede.electronica.noez.es" target="_blank"
                   class="text-white mx-2 text-decoration-none" aria-label="Sede Electrónica">
                    <i class="fas fa-laptop fa-lg"></i> Sede Electrónica
                </a>
            </div>
        </div>
    </div>
</footer>


 `

 document.addEventListener('DOMContentLoaded', () => {
document.querySelector("footer").innerHTML = footer;
});