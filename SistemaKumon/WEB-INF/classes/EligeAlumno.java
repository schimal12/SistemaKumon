import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class EligeAlumno extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			String logged = (String) getServletContext().getAttribute("logged");
			if(logged != null){
				if(logged.equals("false")){
					RequestDispatcher dips = getServletContext().getRequestDispatcher("/alumno.jsp");

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

				RequestDispatcher dips = getServletContext().getRequestDispatcher("/alumno.jsp");

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

			String idAl = request.getParameter("Elegido");
			String NombreTutor = "";

			String usuarioB = getServletContext().getInitParameter("usuario");
			String passB = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuarioB,passB);

			Statement stat = con.createStatement();
			Statement stat1 = con.createStatement();

			ResultSet rs = stat.executeQuery("SELECT * FROM alumno WHERE ID=\"" + idAl + "\";");

			if(rs.next()){
				int IDTutor = rs.getInt("ID_Tutor");

				ResultSet rj = stat1.executeQuery("Select * From tutor WHERE ID =\"" + IDTutor + "\";");

				if(rj.next()){
					NombreTutor = rj.getString("Nombre");
				}

				request.setAttribute("idTutor", NombreTutor);
				request.setAttribute("nombre", rs.getString("Nombre"));
				request.setAttribute("direccion", rs.getString("Direccion"));
				request.setAttribute("telefono", rs.getString("Telefono"));
				request.setAttribute("grado", rs.getString("Grado"));
				request.setAttribute("nivel", rs.getString("Nivel"));
				request.setAttribute("fechaNac", rs.getString("FechaNacimiento"));
				request.setAttribute("fechaIns", rs.getString("FechaInscripcion"));

				boolean aux1 = rs.getBoolean("EstatusPago");
				boolean aux2 = rs.getBoolean("Becado");

				String aux_1;
				String aux_2;

				if(aux1){
					aux_1 = "Al corriente";
				}else{
					aux_1 = "Retrasado";
				}

				if(aux2){
					aux_2 = "Si";
				}else{
					aux_2 = "No";
				}

				request.setAttribute("estatus", aux_1);
				request.setAttribute("becado", aux_2);
			}

			sesion.setAttribute("id_Al", idAl);
			sesion.setAttribute("buscado2", "true");

			stat.close();
			con.close();

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/alumno.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}