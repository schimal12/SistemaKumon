import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BuscaAlumno extends HttpServlet{
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

			String idAl = request.getParameter("BuscaID");
			String malo = "";
			String NombreTutor = "";

			String usuarioB = getServletContext().getInitParameter("usuario");
			String passB = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuarioB,passB);

			Statement stat = con.createStatement();
			Statement stat1 = con.createStatement();

			List alumnos = new ArrayList();

			if(!(idAl.equals(""))){
				ResultSet rs = stat.executeQuery("SELECT * FROM alumno WHERE Nombre LIKE \"%" + idAl + "%\";");

				while(rs.next()){
					String aux = rs.getString("ID");
					alumnos.add(aux);
					alumnos.add(aux);
					alumnos.add(rs.getString("Nombre"));
				}

				if(!(alumnos.isEmpty())){
					if(alumnos.size() > 3){
						sesion.setAttribute("buscado", "true");
					}else{
						Statement stat2 = con.createStatement();

						ResultSet rs1 = stat1.executeQuery("SELECT * FROM alumno WHERE ID=\"" + alumnos.get(0) + "\";");
						rs1.next();

						int IDTutor = rs1.getInt("ID_Tutor");

						ResultSet rj = stat2.executeQuery("Select * From tutor WHERE ID =\"" + IDTutor + "\";");

						if(rj.next()){
							NombreTutor = rj.getString("Nombre");
						}

						request.setAttribute("idTutor", NombreTutor);
						request.setAttribute("nombre", rs1.getString("Nombre"));
						request.setAttribute("direccion", rs1.getString("Direccion"));
						request.setAttribute("telefono", rs1.getString("Telefono"));
						request.setAttribute("grado", rs1.getString("Grado"));
						request.setAttribute("nivel", rs1.getString("Nivel"));
						request.setAttribute("fechaNac", rs1.getString("FechaNacimiento"));
						request.setAttribute("fechaIns", rs1.getString("FechaInscripcion"));

						boolean aux1 = rs1.getBoolean("EstatusPago");
						boolean aux2 = rs1.getBoolean("Becado");

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

						sesion.setAttribute("id_Al", alumnos.get(0));
						sesion.setAttribute("buscado2", "true");

						stat2.close();
					}
				}else{
					sesion.setAttribute("buscado", "");
					malo = "No hay un alumno registrado con ese nombre.";
				}
			}else{
				sesion.setAttribute("buscado", "");
				malo = "No ha indicado un nombre a buscar.";
			}

			stat1.close();
			stat.close();
			con.close();

			request.setAttribute("alumnos", alumnos);
			request.setAttribute("malo", malo);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/alumno.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}