import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BuscaSesion extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			String logged = (String) getServletContext().getAttribute("logged");
			if(logged != null){
				if(logged.equals("false")){
					RequestDispatcher dips = getServletContext().getRequestDispatcher("/sesion.jsp");

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

				RequestDispatcher dips = getServletContext().getRequestDispatcher("/sesion.jsp");

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
			String fecha = request.getParameter("BuscaAno") + "/" + request.getParameter("BuscaMes")+ "/" + request.getParameter("BuscaDia");
			int idA = 0;
			String malo = "";

			String usuarioB = getServletContext().getInitParameter("usuario");
			String passB = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuarioB,passB);

			Statement stat = con.createStatement();

			Statement stat1 = con.createStatement();

			List<String> alumnos = new ArrayList<String>();

			if(nombre != null){
				if(!(nombre.equals("")) && !(request.getParameter("BuscaAno").equals(""))){
					ResultSet rs1 = stat1.executeQuery("SELECT * FROM alumno WHERE Nombre=\"" + nombre + "\";");

					while(rs1.next()){
						String aux = rs1.getString("ID");
						alumnos.add(aux);
						alumnos.add(aux);
						alumnos.add(rs1.getString("Nombre"));
					}

					if(!(alumnos.isEmpty())){
						if(alumnos.size() > 3){
							request.setAttribute("alumnos", alumnos);
							sesion.setAttribute("buscado", "true");
							malo = "Hay más de un alumno con ese nombre, por favor especifíque seleccionandolo de la lista";
						}else{
							rs1.previous();
							idA = rs1.getInt("ID");
							ResultSet rs = stat.executeQuery("SELECT * FROM sesion WHERE ID_Alumno=\"" + idA + "\" AND FechaSesion=\"" + fecha + "\";");

							if(rs.next()){
								sesion.setAttribute("buscado2", "true");
								request.setAttribute("nombre", nombre);
								request.setAttribute("duracion", rs.getString("Duracion"));
								request.setAttribute("fechaS", rs.getString("FechaSesion"));
								request.setAttribute("avance", rs.getString("Avance"));
								request.setAttribute("cali", rs.getString("Calificacion"));
							}else{
								sesion.setAttribute("buscado2", "");
								malo = "No hay un registro de sesion con esos datos.";
							}
						}
					}else{
						sesion.setAttribute("buscado2", "");
						malo = "No hay un alumno registrado bajo ese nombre.";
					}
				}else{
					sesion.setAttribute("buscado2", "");
					malo = "No ha indicado suficiente informacion para realizar la busqueda.";
				}
			}else{
				if(!(request.getParameter("BuscaAno").equals(""))){
					ResultSet rs = stat.executeQuery("SELECT * FROM sesion WHERE ID_Alumno=\"" + idAl + "\" AND FechaSesion=\"" + fecha + "\";");
					ResultSet rs1 = stat1.executeQuery("SELECT * FROM alumno WHERE ID=\"" + idAl + "\";");
					rs1.next();

					idA = rs1.getInt("ID");
					if(rs.next()){
						sesion.setAttribute("buscado2", "true");
						request.setAttribute("nombre", rs1.getString("Nombre"));
						request.setAttribute("duracion", rs.getString("Duracion"));
						request.setAttribute("fechaS", rs.getString("FechaSesion"));
						request.setAttribute("avance", rs.getString("Avance"));
						request.setAttribute("cali", rs.getString("Calificacion"));
					}else{
						sesion.setAttribute("buscado2", "");
						malo = "No hay un registro de sesion con esos datos.";
					}
				}else{
					sesion.setAttribute("buscado2", "");
					malo = "No ha indicado suficiente informacion para realizar la busqueda.";
				}
			}

			sesion.setAttribute("idSesAlu", idA);
			sesion.setAttribute("fechaSes", fecha);

			stat1.close();
			stat.close();
			con.close();

			request.setAttribute("malo", malo);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/sesion.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}