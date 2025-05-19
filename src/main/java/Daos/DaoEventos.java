package Daos;
import java.util.List;

import model.Eventos;

public class DaoEventos {
	
	public List<Eventos> obtenerTodosLosEventoss() {
		BaseJPADao dao = new BaseJPADao();
		List<Eventos> eventos = dao.getEntityManager().createQuery("SELECT e FROM Eventos e", Eventos.class).getResultList();
				
		dao.getEntityManager().close();
		return eventos;
	}

	public Eventos obtenerEventosPorId(int id) {
		BaseJPADao dao = new BaseJPADao();
		Eventos Eventos = dao.getEntityManager().find(Eventos.class, id);
		dao.getEntityManager().close();
		return Eventos;
	}

	public void guardarEventoss(Eventos evento) {
		BaseJPADao dao = new BaseJPADao();
		dao.getEntityManager().persist(evento);
		dao.getEntityManager().close();
	}

	public void actualizarEventos(Eventos evento) {
		BaseJPADao dao = new BaseJPADao();
		dao.getEntityManager().merge(evento);
		dao.getEntityManager().close();
	}

	public void eliminarEventos(int id) {
		BaseJPADao dao = new BaseJPADao();
		Eventos evento = dao.getEntityManager().find(Eventos.class, id);
		if (evento != null) {
			dao.getEntityManager().remove(evento);
		}
		dao.getEntityManager().close();
	}
	

}
