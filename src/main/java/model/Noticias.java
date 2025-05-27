package model;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.Date;


/**
 * The persistent class for the "Noticias" database table.
 * 
 */
@Entity
@Table(name="\"Noticias\"")
@NamedQuery(name="Noticias.findAll", query="SELECT n FROM Noticias n")
public class Noticias implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id") // sin mayúsculas en Java, pero respeta el nombre en DB
    private Integer id;

	private String autor;

	@Column(name="\"contenidoCompleto\"")
	private String contenidoCompleto;

	@Temporal(TemporalType.DATE)
	private Date fecha;

	private String imagen;

	private String resumen;

	private String titulo;

	public Noticias() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAutor() {
		return this.autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public String getContenidoCompleto() {
		return this.contenidoCompleto;
	}

	public void setContenidoCompleto(String contenidoCompleto) {
		this.contenidoCompleto = contenidoCompleto;
	}

	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getImagen() {
		return this.imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public String getResumen() {
		return this.resumen;
	}

	public void setResumen(String resumen) {
		this.resumen = resumen;
	}

	public String getTitulo() {
		return this.titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

}