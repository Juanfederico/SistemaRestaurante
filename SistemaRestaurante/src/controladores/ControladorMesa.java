package controladores;

import java.io.IOException;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datos.Camarero;
import datos.Cliente;
import datos.Comanda;
import datos.ItemComanda;
import datos.Login;
import datos.Ticket;
import datos.Usuario;
import negocio.CamareroABM;
import negocio.ClienteABM;
import negocio.ComandaABM;
import negocio.ItemComandaABM;
import negocio.LoginABM;
import negocio.UsuarioABM;
import datos.Mesa;
import negocio.MesaABM;
import datos.Salon;
import negocio.SalonABM;
import datos.Producto;
import negocio.ProductoABM;

public class ControladorMesa extends HttpServlet {
	protected void doGet(HttpServletRequest request , HttpServletResponse response )
			throws ServletException, IOException {
		procesarPeticion(request, response );
	}
	protected void doPost(HttpServletRequest request , HttpServletResponse response )
			throws ServletException, IOException {
		procesarPeticion(request, response);
	}
	private void procesarPeticion(HttpServletRequest request , HttpServletResponse
			response ) throws ServletException, IOException {
		//NOTA: AC� ENTRAN TODOS LOS FORM RELACIONADOS A CUALQUIER MESA.
		//LOS TIPO HIDDEN QUE ENTRAN DEFINEN LA ACCION A REALIZAR:
		//-1 = Ocupar
		//-2 = Mover
		Mesa mesa = new Mesa();
		MesaABM mesaAbm = new MesaABM();
		//
		response.setContentType( "text/html;charset=UTF-8" );
		HttpSession session = request.getSession();
		//Mover mesa de sal�n
		if(request.getParameter("tipoAccion") != null && request.getParameter("tipoAccion").equalsIgnoreCase("-2")){
			try{
				Salon salon = new Salon();
				SalonABM salonAbm = new SalonABM();
				long idSalon = Integer.parseInt(request.getParameter("salon"));
				salon = salonAbm.traerSalon(idSalon);
				int numMesa = Integer.parseInt(request.getParameter("mesa"));
				mesa = mesaAbm.traerMesa(numMesa);
				if(mesa.getSalon().getIdSalon() != salon.getIdSalon()){ //Si no est� en ese salon
				mesa.setSalon(salon);
				mesaAbm.modificarMesa(mesa);
				}
				else session.setAttribute("errorSalon", "La mesa "+mesa.getNroMesa()+" ya se encuentra en ese salon");
				request.getRequestDispatcher("/pedidos.jsp").forward(request, response);
			}
			catch (Exception e ) {
				System.out.println(e.getMessage());
				response .sendError(500, "Error al cambiar la mesa de salon" );
			}
		}
		//Ocupar mesa por comensales (incluye primer pedido)
		else if(request.getParameter("tipoAccion") != null && request.getParameter("tipoAccion").equalsIgnoreCase("-1")){
			try{
				Producto producto = new Producto();
				ProductoABM productoAbm = new ProductoABM();
				Comanda comanda = new Comanda();
				ItemComanda itemComanda = null;
				Set<ItemComanda> itemComandas = new HashSet<ItemComanda>();
				comanda.setFecha(new GregorianCalendar());
				//Trayendo mesa
				mesa = mesaAbm.traerMesa(Integer.parseInt(request.getParameter("mesa")));
				comanda.setMesa(mesa);
				//Chequeando los pedidos de los comensales
				long idProducto;
				long cantidad;
				for(int i=1 ; i<6 ; i++){ //Recorriendo los selects para ver cuantos itemComanda hay
					if((request.getParameter("Producto"+i) != null) && (!request.getParameter("Producto"+i).equalsIgnoreCase("-1"))){
						idProducto = Integer.parseInt(request.getParameter("Producto"+i));
						producto = productoAbm.traerProducto(idProducto);
						cantidad = Integer.parseInt(request.getParameter("Cantidad"+i));
						itemComanda = new ItemComanda();
						itemComanda.setComanda(comanda);
						itemComanda.setProducto(producto);
						itemComanda.setCantidad(cantidad);
						itemComandas.add(itemComanda);
						itemComanda = null;
					}
				}
				comanda.setItemComandas(itemComandas); //Cargo la lista de �tems en comanda
				//Preparandose para insertar en la bd y cambiar estado:
				UsuarioABM usuarioAbm = new UsuarioABM();
				String stringUser = session.getAttribute("idUsuario").toString();
				long idUsuario = Integer.parseInt(stringUser);
				Usuario usuario = usuarioAbm.traerUsuario(idUsuario);
				mesa.ocuparMesa(usuario, comanda);
				//mesa.setEstadoMesa(2);
				mesaAbm.modificarMesa(mesa);
				request.getRequestDispatcher("/pedidos.jsp").forward(request, response);
			}
			catch (Exception e ) {
				System.out.println(e.getMessage());
				response .sendError(500, "Error al ocupar la mesa" );
			}
		}
		//Agregar Comanda
		else if(request.getParameter("tipoAccion") != null && request.getParameter("tipoAccion").equalsIgnoreCase("-3")){
			try{
				Producto producto = new Producto();
				ProductoABM productoAbm = new ProductoABM();
				Comanda comanda = new Comanda();
				ComandaABM comandaAbm = new ComandaABM();
				ItemComanda itemComanda = null;
				Set<ItemComanda> itemComandas = new HashSet<ItemComanda>();
				comanda.setFecha(new GregorianCalendar());
				//Trayendo mesa
				mesa = mesaAbm.traerMesa(Integer.parseInt(request.getParameter("mesa")));
				comanda.setMesa(mesa);
				//Chequeando los pedidos de los comensales
				long idProducto;
				long cantidad;
				for(int i=1 ; i<6 ; i++){ //Recorriendo los selects para ver cuantos itemComanda hay
					if((request.getParameter("Producto_"+i) != null) && (!request.getParameter("Producto_"+i).equalsIgnoreCase("-1"))){
						idProducto = Integer.parseInt(request.getParameter("Producto_"+i));
						producto = productoAbm.traerProducto(idProducto);
						cantidad = Integer.parseInt(request.getParameter("Cantidad_"+i));
						itemComanda = new ItemComanda();
						itemComanda.setComanda(comanda);
						itemComanda.setProducto(producto);
						itemComanda.setCantidad(cantidad);
						itemComandas.add(itemComanda);
						itemComanda = null;
					}
				}
				comanda.setItemComandas(itemComandas);
				//Preparandose para insertar en la bd y cambiar estado:
				ItemComandaABM itemComandaAbm = new ItemComandaABM();
				long idComandaAgregado = comandaAbm.agregarComanda(comanda.getFecha(), comanda.getMesa(), comanda.isActivo()); //activo en true
				comanda.setIdComanda(idComandaAgregado);
				for (ItemComanda itemComandaAgr : comanda.getItemComandas()) { //Recorriendo el HashSet
					itemComandaAbm.agregarItemComanda(itemComandaAgr.getComanda(), itemComandaAgr.getProducto(), itemComandaAgr.getCantidad());
				}
				request.getRequestDispatcher("/pedidos.jsp").forward(request, response);
			}
			catch (Exception e ) {
				System.out.println(e.getMessage());
				response .sendError(500, "Error al agregar la comanda" );
			}
		}
		//Finalizar mesa
		if(request.getParameter("tipoAccion") != null && request.getParameter("tipoAccion").equalsIgnoreCase("-4")){
			try{
				Cliente cliente = new Cliente();
				ClienteABM clienteAbm = new ClienteABM();
				Ticket ticket = new Ticket();
				Camarero camarero = new Camarero();
				CamareroABM camareroAbm = new CamareroABM();
				Usuario usuario;
				UsuarioABM usuarioAbm = new UsuarioABM();
				String error = "";
				camarero = camareroAbm.traerCamareroDNI(Integer.parseInt(request.getParameter("camareroDNI")));
				if(request.getParameter("clienteDNI") != null){
				cliente = clienteAbm.traerClienteDNI(Integer.parseInt(request.getParameter("clienteDNI")));
					error= "El dni de cliente ingresado es invalido";
					if(cliente==null) throw new Exception("El dni de cliente ingresado es invalido");
				}
				usuario = usuarioAbm.traerUsuario(Integer.parseInt(session.getAttribute("idUsuario").toString()));
				mesa = mesaAbm.traerMesa(Integer.parseInt(request.getParameter("mesa")));
				ticket = mesa.generarTicket(cliente, camarero, usuario);
				mesa.finalizarMesa(ticket);
				mesaAbm.modificarMesa(mesa);
				request.getRequestDispatcher("/pedidos.jsp").forward(request, response);
			}
			catch (Exception e ) {
				System.out.println(e.getMessage());
				response .sendError(500, "Error al finalizar la mesa." );
			}
		}
		//Liberar mesa
		else if(request.getParameter("tipoAccion") != null && request.getParameter("tipoAccion").equalsIgnoreCase("-5")){
			try{
				LoginABM loginAbm = new LoginABM();
				System.out.println(request.getParameter("user"));
				Login login = loginAbm.traerLogin(request.getParameter("user"), request.getParameter("pass"));
				if(login==null) throw new Exception("La contrase�a introducida es incorrecta");
				else{
					mesa = mesaAbm.traerMesa(Integer.parseInt(request.getParameter("mesa")));
					mesa.liberarMesa(mesa.getIdMesa());
					mesaAbm.modificarMesa(mesa);
				}
				request.getRequestDispatcher("/pedidos.jsp").forward(request, response);
			}
			catch (Exception e ) {
				System.out.println(e.getMessage());
				response .sendError(500, "Error al liberar la mesa." );
			}
		}
		else{
			try {
				int numMesa = Integer.parseInt(request.getParameter("mesa"));
				mesa = mesaAbm.traerMesa(numMesa);
				request.setAttribute("mesa", mesa);
				mesa.getSalon().getDescripcion();
				request.getRequestDispatcher("/detalleMesa.jsp").forward(request, response);
			}
			catch (Exception e ) {
			System.out.println(e.getMessage());
			response .sendError(500, "Error al traer la mesa" );
			}
			//session.setAttribute("usuario", request.getAttribute("usuario"));
		}
	}
}