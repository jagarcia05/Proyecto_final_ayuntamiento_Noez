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
import java.util.Comparator;

import Daos.DaoEventos;
import Daos.DaoUsuario;
import Daos.NoticiasDao;
import Util.Hash;

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
		String orden = null;
		int totalEventos =0;
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
		    try {
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
		        noticia.setImagen(imageUrl1);

		        daoNoticia = new NoticiasDao();
		        daoNoticia.guardarNoticias(noticia);

		        responderJson(response, true);
		        return;
		    } catch (Exception e) {
		        e.printStackTrace();
		        responderJson(response, false);
		        return;
		    }
		   

		case "insertarEvento":
		    try {
		        String tituloEvento = request.getParameter("tituloEvento");
		        String fechaStr1 = request.getParameter("fechaEvento");
		        LocalDate localdate1 = LocalDate.parse(fechaStr1, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		        Date fechaEvento = java.sql.Date.valueOf(localdate1);
		        String lugar = request.getParameter("lugarEvento");
		        String resumenEvento = request.getParameter("resumenEvento");
		        String descripcionCompleta = request.getParameter("descripcionCompletaEvento");

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
		        evento.setLugar(lugar);
		        evento.setResumen(resumenEvento);
		        evento.setDescripcionCompleta(descripcionCompleta);
		        evento.setImagen(imageUrl);

		        DaoEventos daoEvento = new DaoEventos();
		        daoEvento.guardarEventoss(evento);

		        responderJson(response, true);
		        return;
		    } catch (Exception e) {
		        e.printStackTrace();
		        responderJson(response, false);
		        return;
		    }
		case "listarEventos":
		    daoEventos = new DaoEventos();
			 orden = request.getParameter("orden");
			if (orden == null) {
			    orden = "fecha"; // valor por defecto
			}

		    pageParam = request.getParameter("page");
		    if (pageParam != null) {
		        try {
		            page = Integer.parseInt(pageParam);
		            if (page < 1) page = 1;
		        } catch (NumberFormatException e) {
		            page = 1;
		        }
		    } else {
		        page = 1;
		    }
		     totalEventos = daoEventos.contarTotalEventos();
		    List<Eventos> todosEventos = daoEventos.obtenerTodosLosEventoss();
			switch (orden) {
			    case "titulo":
			        todosEventos.sort(Comparator.comparing(Eventos::getTitulo, String.CASE_INSENSITIVE_ORDER));
			        break;
			    case "lugar":
			        todosEventos.sort(Comparator.comparing(Eventos::getLugar, String.CASE_INSENSITIVE_ORDER));
			        break;
			    case "fecha":
			    default:
			        todosEventos.sort(Comparator.comparing(Eventos::getFecha).reversed());
			        break;
			}
		
		    int totalRecords = todosEventos.size();
		    int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

		    // Si la página pedida es mayor que la última disponible, redirigir a la última válida
		    if (page > totalPages) {
		        page = Math.max(totalPages, 1); // mínimo 1
		    }

		    // Calcular índices de paginación
		    int startIndex = (page - 1) * recordsPerPage;
		    int endIndex = Math.min(startIndex + recordsPerPage, totalRecords);
		    if (startIndex > endIndex) {
		    	startIndex = 0;
		    	endIndex = Math.min(recordsPerPage, totalRecords);
		        page = 1;
		    }


		    // Evitar subList fuera de rango
		    List<Eventos> eventosPagina = todosEventos.subList(startIndex, endIndex);
		    
		    request.setAttribute("totalEventos", totalEventos);
		      
		    request.setAttribute("ListaEvento", eventosPagina);
		    request.setAttribute("paginaActual", page);
		    request.setAttribute("totalPaginas", totalPages);
			request.setAttribute("orden", orden);	
		    request.getRequestDispatcher("informacion/Eventos.jsp").forward(request, response);
		    break;

		case "listaNoticias":
		    NoticiasDao daoNoticias = new NoticiasDao();
		     orden = request.getParameter("orden");
			if (orden == null) {
			    orden = "fecha"; // valor por defecto
			}
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
		    switch (orden) {
		    case "titulo":
		    	todasNoticias.sort(Comparator.comparing(Noticias::getTitulo, String.CASE_INSENSITIVE_ORDER));
		        break;
		    case "autor":
		    	todasNoticias.sort(Comparator.comparing(Noticias::getAutor, String.CASE_INSENSITIVE_ORDER));
		        break;
		    case "fecha":
		    default:
		    	todasNoticias.sort(Comparator.comparing(Noticias::getFecha).reversed());

		        break;
		}
		    int totalRecords1 = todasNoticias.size();
		    int totalPages1 = (int) Math.ceil((double) totalRecords1 / recordsPerPage);
		    int totalnoticias = daoNoticia.contartotalNoticias();
		    // Si totalPages1 es 0 (no hay noticias), establecemos mínimo 1 para evitar errores
		    if (totalPages1 < 1) totalPages1 = 1;

		    // Validar que la página solicitada no supere el total de páginas
		    if (page > totalPages1) {
		        page = totalPages1;
		    }

		    int startIndex1 = (page - 1) * recordsPerPage;
		    int endIndex1 = Math.min(startIndex1 + recordsPerPage, totalRecords1);

		    // Validar índices para evitar errores
		    if (startIndex1 > endIndex1) {
		        startIndex1 = 0;
		        endIndex1 = Math.min(recordsPerPage, totalRecords1);
		        page = 1;
		    }

		    List<Noticias> noticiasPagina = todasNoticias.subList(startIndex1, endIndex1);
		    request.setAttribute("orden", orden);	
		    request.setAttribute("ListaNoticias", noticiasPagina);
		    request.setAttribute("paginaActual", page);
		    request.setAttribute("totalPaginas", totalPages1);
		    request.setAttribute("totalNoticias", totalnoticias);

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
		    Usuario usuario = daoUsuario.obtenerUsuarioPorNombre(usuarioNombre);

		    response.setContentType("application/json");
		    PrintWriter out = response.getWriter();
		    
		    try {
		        if (usuario != null && usuario.getPassword().equals(Hash.getSha256(password))) {
		            request.getSession().setAttribute("usuario", usuario);
		            
		            out.print("{");
		            out.print("\"success\": true,");
		            out.print("\"rol\": \"" + "admin" + "\",");
		            out.print("\"nombre\": \"" + usuario.getNombre() + "\"");
		            out.print("}");
		        } else {
		            request.getSession().removeAttribute("usuario");

		            out.print("{");
		            out.print("\"success\": false,");
		            out.print("\"message\": \"Usuario o contraseña incorrectos.\"");
		            out.print("}");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        out.print("{");
		        out.print("\"success\": false,");
		        out.print("\"message\": \"Error interno del servidor.\"");
		        out.print("}");
		    }

		    out.flush();
		    break;

		case "EliminarNoticia":
		    try {
		        int idNoticiaEliminar = Integer.parseInt(request.getParameter("id"));
		        int paginaActual = Integer.parseInt(request.getParameter("page"));

		        NoticiasDao daNoticia = new NoticiasDao();
		        daNoticia.eliminarNoticias(idNoticiaEliminar);

		        int totalNoticias = daNoticia.contartotalNoticias();
		        int noticiasPorPagina = 5;
		        int totalPaginas = (int) Math.ceil((double) totalNoticias / noticiasPorPagina);

		        // Validar que totalPaginas nunca sea 0 para evitar errores
		        if (totalPaginas < 1) totalPaginas = 1;

		        // Si la página actual es mayor que el total de páginas tras eliminar, bajamos una página
		        int paginaRedirigir = paginaActual > totalPaginas ? totalPaginas : paginaActual;
		        if (paginaRedirigir < 1) paginaRedirigir = 1;

		        System.out.println("[EliminarNoticia] Página actual: " + paginaActual);
		        System.out.println("[EliminarNoticia] Total noticias: " + totalNoticias);
		        System.out.println("[EliminarNoticia] Total páginas: " + totalPaginas);
		        System.out.println("[EliminarNoticia] Página a redirigir: " + paginaRedirigir);

		        String json = "{\"exito\": true, \"redirigirPagina\": " + paginaRedirigir + "}";
		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        response.getWriter().write(json);

		    } catch (Exception e) {
		        e.printStackTrace();
		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        response.getWriter().write("{\"exito\": false}");
		    }
		    break;

		case "EliminarEvento":
		    try {
		        int idEventoEliminar = Integer.parseInt(request.getParameter("id"));
		        int paginaActual = Integer.parseInt(request.getParameter("page"));

		        daoEventos = new DaoEventos();
		        daoEventos.eliminarEventos(idEventoEliminar);

		         totalEventos = daoEventos.contarTotalEventos();
		        int eventosPorPagina = 5; // O usa la variable global recordsPerPage si tienes
		        int totalPaginas = (int) Math.ceil((double) totalEventos / eventosPorPagina);

		        // Evitar que totalPaginas sea 0 para evitar errores
		        if (totalPaginas < 1) totalPaginas = 1;

		        // Ajustar la página a redirigir para que no sea mayor que el total de páginas
		        int paginaRedirigir = paginaActual > totalPaginas ? totalPaginas : paginaActual;
		        if (paginaRedirigir < 1) paginaRedirigir = 1;

		        // Logs para depurar
		        System.out.println("[EliminarEvento] Página actual: " + paginaActual);
		        System.out.println("[EliminarEvento] Total eventos: " + totalEventos);
		        System.out.println("[EliminarEvento] Total páginas: " + totalPaginas);
		        System.out.println("[EliminarEvento] Página a redirigir: " + paginaRedirigir);

		        String json = "{\"exito\": true, \"redirigirPagina\": " + paginaRedirigir + "}";
		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        response.getWriter().write(json);

		    } catch (Exception e) {
		        e.printStackTrace();
		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        response.getWriter().write("{\"exito\": false}");
		    }
		    break;

		case "ActualizarEventoPagina":
			int idEventoActualizar = Integer.parseInt(request.getParameter("id"));
			Eventos eventoActualizar = daoEventos.obtenerEventosPorId(idEventoActualizar);
			request.setAttribute("eventoActualizar", eventoActualizar);
			request.getRequestDispatcher("Administrador/ActualizarEvento.jsp").forward(request, response);
			break;
		case "ActualizarNoticiaPagina":
			int idNoticiaActualizar = Integer.parseInt(request.getParameter("id"));
			Noticias noticiaActualizar = daoNoticia.obtenerNoticiasPorId(idNoticiaActualizar);
			request.setAttribute("noticiaActualizar", noticiaActualizar);
			request.getRequestDispatcher("Administrador/ActualizarNoticia.jsp").forward(request, response);
			break;
		case "actualizarEvento":
			
				int idEvento1 = Integer.parseInt(request.getParameter("id"));
				String tituloEvento = request.getParameter("titulo");
				String fechaStr2 = request.getParameter("fecha");
				LocalDate localdate2 = LocalDate.parse(fechaStr2, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				Date fechaEvento = java.sql.Date.valueOf(localdate2);
				String lugarEvento = request.getParameter("lugar");
				String resumenEvento = request.getParameter("resumenEvento");
				String descripcionCompletaEvento = request.getParameter("descripcionCompleta");
				Part filePart13 = request.getPart("imagen");
				if (filePart13.getSize() == 0|| filePart13.equals("null")) {
					// Si no se subió una nueva imagen, obtenemos la imagen actual del evento
					Eventos eventoActual = daoEventos.obtenerEventosPorId(idEvento1);
					if (eventoActual != null) {
						evento.setImagen(eventoActual.getImagen());
					} else {
						request.setAttribute("mensaje", "Evento no encontrado.");
						request.getRequestDispatcher("Administrador/ActualizarEvento.jsp").forward(request, response);
						return;
					}
				}else {
					InputStream inputStream = filePart13.getInputStream();
			        byte[] bytes = inputStream.readAllBytes();
			        String base64Image = Base64.getEncoder().encodeToString(bytes);

			        // Subir a ImgBB
			        String imageUrl3 = subirAImgBB(apiKey, base64Image);
			        evento.setImagen(imageUrl3);
				}
		        

				

				evento.setId(idEvento1);
				evento.setTitulo(tituloEvento);
				evento.setFecha(fechaEvento);
				evento.setLugar(lugarEvento);
				evento.setResumen(resumenEvento);
				evento.setDescripcionCompleta(descripcionCompletaEvento);
				

				daoEventos.actualizarEventos(evento);
				request.setAttribute("mensaje", "Evento actualizado correctamente.");
				request.getRequestDispatcher("Administrador/ActualizarEvento.jsp").forward(request, response);
			break;
		case "actualizarNoticia":
			Noticias noticiaActualizar1 = new Noticias();
				int idNoticia1 = Integer.parseInt(request.getParameter("id"));
				String tituloNoticia = request.getParameter("titulo");
				String fechaStr3 = request.getParameter("fecha");
				LocalDate localdate3 = LocalDate.parse(fechaStr3, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				Date fechaNoticia = java.sql.Date.valueOf(localdate3);
				String autorNoticia = request.getParameter("autor");
				String resumenNoticia = request.getParameter("resumen");
				String contenidoCompletoNoticia = request.getParameter("contenidoCompleto");
				Part filePart2 = request.getPart("imagen");
				if (filePart2.equals("null") || filePart2.getSize() == 0) {
					
					Noticias noticiaActual = daoNoticia.obtenerNoticiasPorId(idNoticia1);
					if (noticiaActual != null) {
						noticiaActualizar1.setImagen(noticiaActual.getImagen());
					} else {
						request.setAttribute("mensaje", "Noticia no encontrada.");
						request.getRequestDispatcher("Administrador/ActualizarNoticia.jsp").forward(request, response);
						return;
					}
				}else {
					InputStream inputStream1 = filePart2.getInputStream();
					byte[] bytes1 = inputStream1.readAllBytes();
					String base64Image1 = Base64.getEncoder().encodeToString(bytes1);

					// Subir a ImgBB
					String imageUrl1 = subirAImgBB(apiKey, base64Image1);
					noticiaActualizar1.setImagen(imageUrl1);
				}
				

				
				noticiaActualizar1.setId(idNoticia1);
				noticiaActualizar1.setTitulo(tituloNoticia);
				noticiaActualizar1.setFecha(fechaNoticia);
				noticiaActualizar1.setAutor(autorNoticia);
				noticiaActualizar1.setResumen(resumenNoticia);
				noticiaActualizar1.setContenidoCompleto(contenidoCompletoNoticia);
				

				daoNoticia.actualizarNoticias(noticiaActualizar1);
				request.setAttribute("mensaje", "Noticia actualizada correctamente.");

				request.getRequestDispatcher("Administrador/ActualizarNoticia.jsp").forward(request, response);
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
	private void responderJson(HttpServletResponse response, boolean exito) throws IOException {
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.setStatus(HttpServletResponse.SC_OK);  // Código 200 OK
	    String json = "{\"exito\": " + exito + "}";
	    response.getWriter().write(json);
	    response.getWriter().flush();
	    // No cerrar el writer manualmente
	}





}
