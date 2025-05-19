package Daos; 
import model.Usuario;

public class DaoUsuario {
	public Usuario obtenerUsuarioPorNombre(String nombre) {
		BaseJPADao dao = new BaseJPADao();
		Usuario usuario = dao.getEntityManager()
				.createQuery("SELECT u FROM Usuario u WHERE u.usuario = :nombre", Usuario.class)
				.setParameter("nombre", nombre).getSingleResult();
		dao.getEntityManager().close();
		return usuario;
	}

}
