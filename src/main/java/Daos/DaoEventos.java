package Daos;
import java.util.List;

import jakarta.persistence.EntityManager;
import model.Eventos;

public class DaoEventos {
	
	public List<Eventos> obtenerTodosLosEventoss() {
		EntityManager em = BaseJPADao.getEntityManager();
		em.getTransaction().begin();
		List<Eventos> eventos = em.createQuery("SELECT e FROM Eventos e", Eventos.class).getResultList();
		em.getTransaction().commit();
		em.close();
		return eventos;
	}

	public Eventos obtenerEventosPorId(int id) {
		BaseJPADao dao = new BaseJPADao();
		Eventos Eventos = dao.getEntityManager().find(Eventos.class, id);
		dao.getEntityManager().close();
		return Eventos;
	}

	public Eventos obtenerUltimoEvento() {
	    EntityManager em = BaseJPADao.getEntityManager();
	    Eventos evento = null;

	    try {
	        em.getTransaction().begin();

	        List<Eventos> resultados = em.createQuery(
	            "SELECT e FROM Eventos e ORDER BY e.id DESC", Eventos.class)
	            .setMaxResults(1)
	            .getResultList();

	        if (!resultados.isEmpty()) {
	            evento = resultados.get(0);
	        }

	        em.getTransaction().commit();
	    } catch (Exception e) {
	        if (em.getTransaction().isActive()) {
	            em.getTransaction().rollback();
	        }
	        e.printStackTrace(); // o usa logs
	    } finally {
	        em.close();
	    }

	    return evento;
	}


	public void guardarEventoss(Eventos evento) {
		EntityManager em = BaseJPADao.getEntityManager();
		em.getTransaction().begin();
		em.persist(evento);
		em.getTransaction().commit();
		em.close();
		
	}

	public void actualizarEventos(Eventos evento) {
		BaseJPADao dao = new BaseJPADao();
		dao.getEntityManager().getTransaction().begin();
		dao.getEntityManager().merge(evento);
		dao.getEntityManager().getTransaction().commit();
		dao.getEntityManager().close();
	}
	

	public void eliminarEventos(int id) {
		EntityManager em = BaseJPADao.getEntityManager();
		em.getTransaction().begin();
		Eventos evento = em.find(Eventos.class, id);
		if (evento != null) {
			em.remove(evento);
		}
		em.getTransaction().commit();
		em.close();
		
	}
	

}
