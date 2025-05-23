package Daos;
import java.util.List;

import jakarta.persistence.EntityManager;
import model.Evento;


public class DaoEventos {
	
	public List<Evento> obtenerTodosLosEventoss() {
		EntityManager em = BaseJPADao.getEntityManager();
		em.getTransaction().begin();
		List<Evento> eventos = em.createQuery("SELECT e FROM Evento e", Evento.class).getResultList();
		em.getTransaction().commit();
		em.close();
		return eventos;
	}

	public Evento obtenerEventosPorId(int id) {
		BaseJPADao dao = new BaseJPADao();
		Evento Eventos = dao.getEntityManager().find(Evento.class, id);
		dao.getEntityManager().close();
		return Eventos;
	}

	public void guardarEventoss(Evento evento) {
		EntityManager em = BaseJPADao.getEntityManager();
		em.getTransaction().begin();
		em.persist(evento);
		em.getTransaction().commit();
		em.close();
		
	}

	public void actualizarEventos(Evento evento) {
		BaseJPADao dao = new BaseJPADao();
		dao.getEntityManager().getTransaction().begin();
		dao.getEntityManager().merge(evento);
		dao.getEntityManager().getTransaction().commit();
		dao.getEntityManager().close();
	}

	public void eliminarEventos(int id) {
		EntityManager em = BaseJPADao.getEntityManager();
		em.getTransaction().begin();
		Evento evento = em.find(Evento.class, id);
		if (evento != null) {
			em.remove(evento);
		}
		em.getTransaction().commit();
		em.close();
		
	}
	

}
