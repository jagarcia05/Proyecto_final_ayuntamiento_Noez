package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Eventos;
import model.Noticias;
import model.Usuario;

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
import java.util.List;
import java.util.Scanner;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import java.util.Base64;

import Daos.DaoEventos;
import Daos.DaoUsuario;
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
		String operacion = request.getParameter("operacion");
		System.out.println(operacion);
		NoticiasDao daoNoticia = new NoticiasDao();
		 DaoEventos daoEventos = new DaoEventos();
		Eventos evento = new Eventos();
		String apiKey = "e5c4c04ed5f5042498c1ed3d7fbb4924";
		   String pageParam = "";
	    int page = 1; // página por defecto
	    int recordsPerPage = 5; // noticias por página
		switch (operacion) {
		case "inicio":
			 evento = new Eventos();
			 daoEventos = new DaoEventos();
			evento = daoEventos.obtenerUltimoEvento();
			Noticias noticia1 = new Noticias();
			daoNoticia = new NoticiasDao();
			noticia1 = daoNoticia.obtenerUltimaNoticia();
			
			request.setAttribute("evento", evento);
			request.setAttribute("noticia", noticia1);
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
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
		    InputStream inputStream1 = filePart.getInputStream();
		    byte[] bytes1 = inputStream1.readAllBytes();
		    String base64Image1 = Base64.getEncoder().encodeToString(bytes1);

		    // Subir a ImgBB
		    
		    String imageUrl1 = subirAImgBB(apiKey, base64Image1);

		    Noticias noticia = new Noticias();
		    noticia.setTitulo(titulo);
		    noticia.setFecha(fecha);
		    noticia.setAutor(autor);
		    noticia.setResumen(resumen);
		    noticia.setContenidoCompleto(contenidoCompleto);
		    noticia.setImagen(imageUrl1); // URL de ImgBB);

		     daoNoticia = new NoticiasDao();
		    daoNoticia.guardarNoticias(noticia);    

		    request.getRequestDispatcher("Administrador/Admin.html").forward(request, response);
		    break;
		case "insertarEvento":
		    String tituloEvento = request.getParameter("tituloEvento");
		    String fechaStr1 = request.getParameter("fechaEvento");
		    LocalDate localdate1 = LocalDate.parse(fechaStr1, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		    Date fechaEvento = java.sql.Date.valueOf(localdate1);
		    String Lugar = request.getParameter("lugarEvento");
		    String resumenEvento = request.getParameter("resumenEvento");
		    String DescripcionCompleta = request.getParameter("descripcionCompletaEvento");

		    // Leer la imagen del formulario
		    Part filePart1 = request.getPart("imagenEvento");
		    InputStream inputStream = filePart1.getInputStream();
		    byte[] bytes = inputStream.readAllBytes();
		    String base64Image = Base64.getEncoder().encodeToString(bytes);

		    // Subir a ImgBB
		   
		    String imageUrl = subirAImgBB(apiKey, base64Image);

		    // Guardar en la base de datos
		     evento = new Eventos();
		    evento.setTitulo(tituloEvento);
		    evento.setFecha(fechaEvento);
		    evento.setLugar(Lugar);
		    evento.setResumen(resumenEvento);
		    evento.setDescripcionCompleta(DescripcionCompleta);
		    evento.setImagen(imageUrl); // URL de ImgBB

		    DaoEventos daoEvento = new DaoEventos();
		    daoEvento.guardarEventoss(evento);

		    request.getRequestDispatcher("Administrador/Admin.html").forward(request, response);
		    break;

		



		case "listarEventos":
		     daoEventos = new DaoEventos();
		    
		    pageParam = request.getParameter("page");
		    if (pageParam != null) {
		        try {
		            page = Integer.parseInt(pageParam);
		            if (page < 1) page = 1;
		        } catch (NumberFormatException e) {
		            page = 1;
		        }
		    }

		    List<Eventos> todosEventos = daoEventos.obtenerTodosLosEventoss();
		    int totalRecords = todosEventos.size();
		    int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

		    // Calcular índices de paginación
		    int startIndex = (page - 1) * recordsPerPage;
		    int endIndex = Math.min(startIndex + recordsPerPage, totalRecords);

		    List<Eventos> eventosPagina = todosEventos.subList(startIndex, endIndex);

		    request.setAttribute("ListaEvento", eventosPagina);
		    request.setAttribute("paginaActual", page);
		    request.setAttribute("totalPaginas", totalPages);

		    request.getRequestDispatcher("informacion/Eventos.jsp").forward(request, response);
		    break;
		
		case "listaNoticias":
		    NoticiasDao daoNoticias = new NoticiasDao();


		    pageParam = request.getParameter("page");
		    if (pageParam != null) {
		        try {
		            page = Integer.parseInt(pageParam);
		            if (page < 1) page = 1;
		        } catch (NumberFormatException e) {
		            page = 1;
		        }
		    }

		    // Obtener todas las noticias (mejor paginar con SQL en producción)
		    List<Noticias> todasNoticias = daoNoticias.obtenerTodasLasNoticiass();

		    int totalRecords1 = todasNoticias.size();
		    int totalPages1 = (int) Math.ceil((double) totalRecords1 / recordsPerPage);

		    int startIndex1 = (page - 1) * recordsPerPage;
		    int endIndex1 = Math.min(startIndex1 + recordsPerPage, totalRecords1);

		    // Validar índices para evitar errores
		    if (startIndex1 > endIndex1) {
		        startIndex = 0;
		        page = 1;
		    }

		    List<Noticias> noticiasPagina = todasNoticias.subList(startIndex1, endIndex1);

		    request.setAttribute("ListaNoticias", noticiasPagina);
		    request.setAttribute("paginaActual", page);
		    request.setAttribute("totalPaginas", totalPages1);

		    request.getRequestDispatcher("informacion/noticias.jsp").forward(request, response);
		    break;
		case "EventoSeleccionado":
			int idEvento = Integer.parseInt(request.getParameter("id"));
			DaoEventos daoEventos1 = new DaoEventos();
			Eventos eventoSeleccionado = daoEventos1.obtenerEventosPorId(idEvento);
			request.setAttribute("eventoSeleccionado", eventoSeleccionado);
			request.getRequestDispatcher("informacion/Evento.jsp").forward(request, response);
			break;
		case "noticiaseleccionada":
			int idNoticia = Integer.parseInt(request.getParameter("id"));
			NoticiasDao daoNoticia1 = new NoticiasDao();
			Noticias noticiaSeleccionada = daoNoticia1.obtenerNoticiasPorId(idNoticia);
			request.setAttribute("noticiaSeleccionada", noticiaSeleccionada);
			request.getRequestDispatcher("informacion/noticia.jsp").forward(request, response);
			break;
		case "login1":
		    String usuarioNombre = request.getParameter("usuario");
		    String password = request.getParameter("contrasena");

		    DaoUsuario daoUsuario = new DaoUsuario();
		    Usuario usuarioEncontrado = daoUsuario.obtenerUsuarioPorNombre(usuarioNombre);

		    response.setContentType("application/json");
		    PrintWriter out = response.getWriter();

		    if (usuarioEncontrado != null && usuarioEncontrado.getPassword().equals(password)) {
		        out.print("{");
		        out.print("\"success\": true,");
		        out.print("\"rol\": \"" + "admin" + "\",");
		        out.print("\"nombre\": \"" + usuarioEncontrado.getNombre() + "\"");
		        out.print("}");
		    } else {
		        out.print("{");
		        out.print("\"success\": false,");
		        out.print("\"message\": \"Usuario o contraseña incorrectos.\"");
		        out.print("}");
		    }
		    out.flush();
		    break;
		 case "EliminarNoticia":
			 // Obtener el ID de la noticia a eliminar desde la solicitud
				int idNoticiaEliminar = Integer.parseInt(request.getParameter("id"));
				System.out.println("el id es"+idNoticiaEliminar);
				NoticiasDao daNoticia = new NoticiasDao();
				daNoticia.eliminarNoticias(idNoticiaEliminar);
				
				break;
		 case "EliminarEvento":
			    int idEventoEliminar1 = Integer.parseInt(request.getParameter("id"));
			    DaoEventos daEventos = new DaoEventos();
			    daEventos.eliminarEventos(idEventoEliminar1);
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
	
		

	private String subirAImgBB(String apiKey, String base64Image) {
	    try {
	        URL url = new URL("https://api.imgbb.com/1/upload");
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setDoOutput(true);
	        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

	        // Construye el cuerpo de la petición con URL encoding
	        String data = "key=" + URLEncoder.encode(apiKey, "UTF-8") +
	                      "&image=" + URLEncoder.encode(base64Image, "UTF-8");

	        try (OutputStream os = conn.getOutputStream()) {
	            os.write(data.getBytes());
	        }

	        int responseCode = conn.getResponseCode();

	        InputStream responseStream = responseCode == 200 ?
	            conn.getInputStream() : conn.getErrorStream();

	        Scanner scanner = new Scanner(responseStream);
	        StringBuilder responseBody = new StringBuilder();
	        while (scanner.hasNext()) {
	            responseBody.append(scanner.nextLine());
	        }
	        scanner.close();

	        String json = responseBody.toString();

	        // Aquí parseamos la URL con una búsqueda simple, para producción usa librería JSON
	        int start = json.indexOf("\"url\":\"") + 7;
	        int end = json.indexOf("\"", start);
	        if (start < 7 || end < 0) {
	            System.err.println("No se encontró URL en la respuesta: " + json);
	            return null;
	        }
	        return json.substring(start, end).replace("\\/", "/");

	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}



}
