package model;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.Date;


/**
 * The persistent class for the eventos database table.
 * 
 */
@Entity
@NamedQuery(name="Eventos.findAll", query="SELECT e FROM Eventos e")
public class Eventos implements Serializable {
	private static final long serialVersionUID = 1L;

	@Lob
	private String descripcionCompleta;

	@Temporal(TemporalType.DATE)
	private Date fecha;

	private int id;

	@Lob
	private String imagen;

	private String lugar;

	@Lob
	private String resumen;

	private String titulo;

	public Eventos() {
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

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
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