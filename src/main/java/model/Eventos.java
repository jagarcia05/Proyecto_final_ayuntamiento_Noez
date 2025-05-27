package model;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.Date;


/**
 * The persistent class for the "Eventos" database table.
 * 
 */
@Entity
@Table(name="\"Eventos\"")
@NamedQuery(name="Eventos.findAll", query="SELECT e FROM Eventos e")
public class Eventos implements Serializable {
	private static final long serialVersionUID = 1L;
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id") // sin mayúsculas en Java, pero respeta el nombre en DB
    private Integer id;

	@Column(name="\"DescripcionCompleta\"")
	private String descripcionCompleta;

	@Temporal(TemporalType.DATE)
	private Date fecha;

	private String imagen;

	@Column(name="\"Lugar\"")
	private String lugar;

	private String resumen;

	private String titulo;

	public Eventos() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescripcionCompleta() {
		return this.descripcionCompleta;
	}

	public void setDescripcionCompleta(String descripcionCompleta) {
		this.descripcionCompleta = descripcionCompleta;
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

	public String getLugar() {
		return this.lugar;
	}

	public void setLugar(String lugar) {
		this.lugar = lugar;
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