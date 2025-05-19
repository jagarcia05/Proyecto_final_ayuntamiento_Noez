package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Noticias;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.text.ParseException;
import java.util.Date;

import Daos.NoticiasDao;
import jakarta.servlet.annotation.MultipartConfig;

/**
 * Servlet implementation class Controller
 */
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024, // 1MB
	    maxFileSize = 1024 * 1024 * 5,   // 5MB
	    maxRequestSize = 1024 * 1024 * 10 // 10MB
	)

public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operacion = request.getParameter("op");
		
		switch (operacion) {
		case "inicio":
			request.getRequestDispatcher("index.html").forward(request, response);
			break;	
		
		case "insertarNoticia":
		    String titulo = request.getParameter("titulo");
		    String fechaStr = request.getParameter("fecha");
		    LocalDate localdate = LocalDate.parse(fechaStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		    Date fecha = java.sql.Date.valueOf(localdate);
		    String autor = request.getParameter("autor");
		    String resumen = request.getParameter("resumen");
		    String contenidoCompleto = request.getParameter("contenidoCompleto");

		    Part filePart = request.getPart("imagen");
		    String nombreArchivo = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

		    String rutaDestino = "D:\\appDiurno\\imagenes-noticias"; 
		    File carpetaDestino = new File(rutaDestino);
		    if (!carpetaDestino.exists()) {
		        carpetaDestino.mkdirs(); // Crear carpeta si no existe
		    }

		    // Guardar el archivo con InputStream y Files.copy
		    try (InputStream input = filePart.getInputStream()) {
		        Files.copy(input, Paths.get(rutaDestino, nombreArchivo), StandardCopyOption.REPLACE_EXISTING);
		    } catch (IOException e) {
		        e.printStackTrace();
		        // Aquí podrías lanzar excepción o gestionar error
		    }

		    Noticias noticia = new Noticias();
		    noticia.setTitulo(titulo);
		    noticia.setFecha(fecha);
		    noticia.setAutor(autor);
		    noticia.setResumen(resumen);
		    noticia.setContenidoCompleto(contenidoCompleto);
		    noticia.setImagen(rutaDestino+"/"+nombreArchivo);

		    NoticiasDao daoNoticia = new NoticiasDao();
		    daoNoticia.guardarNoticias(noticia);    

		    request.getRequestDispatcher("Administrador/Admin.html").forward(request, response);
		    break;
		}

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	doPost(request, response);
	}

}
