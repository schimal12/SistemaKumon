import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BuscaAyudante extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			String logged = (String) getServletContext().getAttribute("logged");
			if(logged != null){
				if(logged.equals("false")){
					RequestDispatcher dips = getServletContext().getRequestDispatcher("/ayudante.jsp");

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

				RequestDispatcher dips = getServletContext().getRequestDispatcher("/ayudante.jsp");

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
			String usuario = request.getParameter("BuscaUsuario");
			String fecha = request.getParameter("BuscaAno") + "/" + request.getParameter("BuscaMes")+ "/" + request.getParameter("BuscaDia");
			String malo = "";

			String usuarioB = getServletContext().getInitParameter("usuario");
			String passB = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuarioB,passB);

			Statement stat = con.createStatement();

			if(!(nombre.equals("")) && !(usuario.equals("")) && !(request.getParameter("BuscaAno").equals(""))){
				ResultSet rs = stat.executeQuery("SELECT * FROM ayudante WHERE Nombre=\"" + nombre + "\" AND Usuario=\"" + usuario + "\" AND FechaR=\"" + fecha + "\";");

				if(rs.next()){
					sesion.setAttribute("buscado", "true");
					request.setAttribute("nombre", rs.getString("Nombre"));
					request.setAttribute("usuario", rs.getString("Usuario"));
					request.setAttribute("fechaR", rs.getString("FechaR"));
					request.setAttribute("horaEnt", rs.getString("HoraEntrada"));
					request.setAttribute("horaSal", rs.getString("HoraSalida"));
				}else{
					sesion.setAttribute("buscado", "");
					malo = "No hay un registro de ayudante con esos datos.";
				}
			}else{
				sesion.setAttribute("buscado", "");
				malo = "No ha indicado suficiente informacion para realizar la busqueda.";
			}

			sesion.setAttribute("nombreAy", nombre);
			sesion.setAttribute("usuarioAy", usuario);
			sesion.setAttribute("fechaRegAy", fecha);

			stat.close();
			con.close();

			request.setAttribute("malo", malo);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/ayudante.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}