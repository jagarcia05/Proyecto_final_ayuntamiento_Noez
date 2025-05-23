package Daos;
import java.util.List;

import jakarta.persistence.EntityManager;
import model.Noticia;


public class NoticiasDao {
	
	public List<Noticia> obtenerTodasLasNoticiass() {
	EntityManager em = BaseJPADao.getEntityManager();
	em.getTransaction().begin();
	List<Noticia> noticias = em.createQuery("SELECT n FROM Noticia n", Noticia.class).getResultList();
	em.getTransaction().commit();
	
	
	 em.close();
	return noticias;
    }
	
	public Noticia obtenerNoticiasPorId(int id) {
		EntityManager em = BaseJPADao.getEntityManager();
        em.getTransaction().begin();
        Noticia noticia = em.find(Noticia.class, id);
        em.getTransaction().commit();
        em.close();
        return noticia;
    }
	public void guardarNoticias(Noticia Noticias) {
		EntityManager em = BaseJPADao.getEntityManager();
        em.getTransaction().begin();
        em.persist(Noticias);
        em.getTransaction().commit();
        em.close();
    }
	public void actualizarNoticias(Noticia Noticias) {
		EntityManager em = BaseJPADao.getEntityManager();
        em.getTransaction().begin();
        em.merge(Noticias);
        em.getTransaction().commit();
        em.close();
    }
	public void eliminarNoticias(int id) {
		EntityManager em = BaseJPADao.getEntityManager();
		em.getTransaction().begin();
		Noticia Noticias = em.find(Noticia.class, id);
		if (Noticias != null) {
			em.remove(Noticias);
		}
		em.getTransaction().commit();
		em.close();
	}

}
