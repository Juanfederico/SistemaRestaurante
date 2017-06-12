package negocio;
import dao.ClienteDao;

import java.util.List;

import datos.Cliente;
import datos.TipoCliente;
public class ClienteABM {
	private ClienteDao dao = new ClienteDao();

	public int agregarCliente(long dni, String nombre, String apellido, TipoCliente tipoCliente){
		Cliente c = new Cliente (dni, nombre, apellido, tipoCliente);
		return dao.agregarCliente(c);
	}

	public void modificarCliente(Cliente cliente){
		dao.actualizarCliente(cliente);
	}

	public void eliminarCliente(long idCliente){
		Cliente c = dao.traerCliente(idCliente);
		dao.eliminarCliente(c);
	}

	public Cliente traerCliente(long idCliente){
		return dao.traerCliente(idCliente);
	}

	public List<Cliente> traerCliente(){
		return dao.traerCliente();
	}

	public Cliente traerClienteCompleto (long idCliente){
		return dao.traerClienteCompleto(idCliente);
	}

}
