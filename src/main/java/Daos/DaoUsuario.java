package Daos; 
import java.util.List;

import jakarta.persistence.EntityManager;
import model.Usuario;

public class DaoUsuario {
	public Usuario obtenerUsuarioPorNombre(String nombre) {
	    EntityManager em = BaseJPADao.getEntityManager();
	    List<Usuario> lista = em.createQuery(
	            "SELECT u FROM Usuario u WHERE u.nombre = :nombre", Usuario.class)
	            .setParameter("nombre", nombre)
	            .getResultList();
	    em.close();

	    if (!lista.isEmpty()) {
	        return lista.get(0);
	    } else {
	        return null;
	    }
	}




}
