package Daos;
import java.util.List;

import jakarta.persistence.EntityManager;
import model.Noticias;

public class NoticiasDao {
	
	public List<Noticias> obtenerTodasLasNoticiass() {
	EntityManager em = BaseJPADao.getEntityManager();
	em.getTransaction().begin();
	List<Noticias> noticias = em.createQuery("SELECT n FROM Noticias n", Noticias.class).getResultList();
	em.getTransaction().commit();
	
	
	 em.close();
	return noticias;
    }
	
	public Noticias obtenerNoticiasPorId(int id) {
		EntityManager em = BaseJPADao.getEntityManager();
        em.getTransaction().begin();
        Noticias noticia = em.find(Noticias.class, id);
        em.getTransaction().commit();
        em.close();
        return noticia;
    }
	
	public Noticias obtenerUltimaNoticia() {
	    EntityManager em = BaseJPADao.getEntityManager();
	    Noticias noticia = null;

	    try {
	        em.getTransaction().begin();

	        List<Noticias> resultados = em.createQuery(
	            "SELECT n FROM Noticias n ORDER BY n.id DESC", Noticias.class)
	            .setMaxResults(1)
	            .getResultList();

	        if (!resultados.isEmpty()) {
	            noticia = resultados.get(0);
	        }

	        em.getTransaction().commit();
	    } catch (Exception e) {
	        if (em.getTransaction().isActive()) {
	            em.getTransaction().rollback();
	        }
	        e.printStackTrace(); // Puedes usar logger aquí en producción
	    } finally {
	        em.close();
	    }

	    return noticia;
	}

	public void guardarNoticias(Noticias Noticias) {
		EntityManager em = BaseJPADao.getEntityManager();
        em.getTransaction().begin();
        em.persist(Noticias);
        em.getTransaction().commit();
        em.close();
    }
	public void actualizarNoticias(Noticias Noticias) {
		EntityManager em = BaseJPADao.getEntityManager();
        em.getTransaction().begin();
        em.merge(Noticias);
        em.getTransaction().commit();
        em.close();
    }
	public void eliminarNoticias(int id) {
		EntityManager em = BaseJPADao.getEntityManager();
		em.getTransaction().begin();
		Noticias Noticias = em.find(Noticias.class, id);
		if (Noticias != null) {
			em.remove(Noticias);
		}
		em.getTransaction().commit();
		em.close();
	}

}
