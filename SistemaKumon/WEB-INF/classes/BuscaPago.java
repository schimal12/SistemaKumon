import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BuscaPago  extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			String logged = (String) getServletContext().getAttribute("logged");
			if(logged != null){
				if(logged.equals("false")){
					RequestDispatcher dips = getServletContext().getRequestDispatcher("/pago.jsp");

					if(dips != null){
						dips.forward(request,response);
					}
				}else{
					RequestDispatcher dips = getServletContext().getRequestDispatcher("/error.jsp");

					if(dips != null){
						dips.forward(request,response);
					}
				}
			}else{
				logged = "false";
				getServletContext().setAttribute("logged",logged);

				RequestDispatcher dips = getServletContext().getRequestDispatcher("/pago.jsp");

				if(dips != null){
					dips.forward(request,response);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response){
		try{
			HttpSession sesion = request.getSession(true);

			String nombre = request.getParameter("BuscaNombre");
			String idAl = request.getParameter("ID_Al2");
			String usuario = request.getParameter("BuscaUsuario");
			String fecha = request.getParameter("BuscaAno") + "/" + request.getParameter("BuscaMes")+ "/" + request.getParameter("BuscaDia");

			String malo = "";

			int idAlu = 0;
			int idUsu = 0;

			String usuarioB = getServletContext().getInitParameter("usuario");
			String passB = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuarioB,passB);

			Statement stat = con.createStatement();

			Statement stat1 = con.createStatement();

			Statement stat2 = con.createStatement();

			List<String> alumnos = new ArrayList<String>();

			if(nombre != null){
				if(!(nombre.equals("")) && !(usuario.equals("")) && !(request.getParameter("BuscaAno").equals(""))){
					ResultSet rs2 = stat2.executeQuery("SELECT * FROM alumno WHERE Nombre=\"" + nombre + "\";");
					ResultSet rs1 = stat1.executeQuery("SELECT * FROM usuario WHERE NombreUsuario=\"" + usuario + "\";");

					while(rs2.next()){
						String aux = rs2.getString("ID");
						alumnos.add(aux);
						alumnos.add(aux);
						alumnos.add(rs2.getString("Nombre"));
					}

					if(rs1.next()){
						idUsu = rs1.getInt("ID");

						if(!(alumnos.isEmpty())){
							if(alumnos.size() > 3){
								request.setAttribute("alumnos", alumnos);
								sesion.setAttribute("buscado", "true");
								malo = "Hay más de un alumno con ese nombre, por favor especifíque seleccionandolo de la lista";
							}else{
								rs2.previous();
								idAlu = rs2.getInt("ID");
								ResultSet rs = stat.executeQuery("SELECT * FROM pago WHERE ID_Alumno=\"" + idAlu + "\" AND ID_Usuario=\"" + idUsu + "\" AND FechaPago=\"" + fecha + "\";");

								if(rs.next()){
									sesion.setAttribute("buscado2", "true");
									request.setAttribute("nombre", nombre);
									request.setAttribute("usuario", usuario);
									request.setAttribute("fechaP", fecha);
									request.setAttribute("monto", rs.getString("Monto"));
									request.setAttribute("periodoP", rs.getString("PeriodoAPagar"));
									request.setAttribute("tipoP", rs.getString("TipoPago"));
									request.setAttribute("fechaR", rs.getString("FechaRegistro"));
								}else{
									sesion.setAttribute("buscado2", "");
									malo = "No hay un registro de pago con esos datos.";
								}
							}
						}else{
							sesion.setAttribute("buscado2", "");
							malo = "No hay un alumno registrado bajo esos datos.";
						}
					}else{
						sesion.setAttribute("buscado2", "");
						malo = "Intenta buscar un usuario que no esta en la base de datos.";
					}
				}else{
					sesion.setAttribute("buscado2", "");
					malo = "No ha indicado suficiente informacion para realizar la busqueda.";
				}
			}else{
				if(!(usuario.equals("")) && !(request.getParameter("BuscaAno").equals(""))){
					ResultSet rs1 = stat1.executeQuery("SELECT * FROM usuario WHERE NombreUsuario=\"" + usuario + "\";");

					if(rs1.next()){
						idUsu = rs1.getInt("ID");
						ResultSet rs = stat.executeQuery("SELECT * FROM pago WHERE ID_Alumno=\"" + idAl + "\" AND ID_Usuario=\"" + idUsu + "\" AND FechaPago=\"" + fecha + "\";");

						ResultSet rs2 = stat2.executeQuery("SELECT * FROM alumno WHERE ID=\"" + idAl + "\";");
						rs2.next();

						if(rs.next()){
							idAlu = rs2.getInt("ID");
							sesion.setAttribute("buscado2", "true");
							request.setAttribute("nombre", rs2.getString("Nombre"));
							request.setAttribute("usuario", usuario);
							request.setAttribute("fechaP", fecha);
							request.setAttribute("monto", rs.getString("Monto"));
							request.setAttribute("periodoP", rs.getString("PeriodoAPagar"));
							request.setAttribute("tipoP", rs.getString("TipoPago"));
							request.setAttribute("fechaR", rs.getString("FechaRegistro"));
						}else{
							sesion.setAttribute("buscado2", "");
							malo = "No hay un registro de pago con esos datos.";
						}
					}else{
						sesion.setAttribute("buscado2", "");
						malo = "Intenta buscar un usuario que no esta en la base de datos.";
					}
				}else{
					sesion.setAttribute("buscado2", "");
					malo = "No ha indicado suficiente informacion para realizar la busqueda.";
				}
			}

			sesion.setAttribute("idAluPag", idAlu);
			sesion.setAttribute("idUsuPag", idUsu);
			sesion.setAttribute("fechaPag", fecha);

			stat2.close();
			stat1.close();
			stat.close();
			con.close();

			request.setAttribute("malo", malo);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/pago.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}