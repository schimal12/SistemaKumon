import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegistroSesion extends HttpServlet{
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

			String id = request.getParameter("ID_Al");
			String id2 = request.getParameter("ID_Al2");
			String duracion = request.getParameter("Duracion");
			String fechaS = request.getParameter("AnoS") + "/" + request.getParameter("MesS")+ "/" + request.getParameter("DiaS");
			String avance = request.getParameter("Avance");
			String calificacion = request.getParameter("Calificacion");

			String resultado = "";

			String usuario = getServletContext().getInitParameter("usuario");
			String pass = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuario,pass);

			Statement stat = con.createStatement();

			Statement stat1 = con.createStatement();

			List<String> alumnos = new ArrayList<String>();

			if(id != null){
				if(!(id.equals("")) && !(duracion.equals("")) && !(avance.equals("")) && !(calificacion.equals("")) && !(request.getParameter("AnoS").equals(""))){
					ResultSet rs1 = stat1.executeQuery("SELECT * FROM alumno WHERE Nombre=\"" + id + "\";");

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
							resultado = "Hay más de un alumno registrado con ese nombre, por favor seleccione uno de la lista y vuelva a ingresar los datos.";
						}else{
							String idA = alumnos.get(0);

							ResultSet rs = stat.executeQuery("SELECT * FROM sesion WHERE ID_Alumno=\"" + idA + "\" AND FechaSesion=\"" + fechaS + "\";");

							if(rs.next()){
								resultado = "Ya hay un registro guardado con los valores fecha/alumno que intenta ingresar.";
							}else{
								stat.executeUpdate("INSERT INTO sesion VALUES (\"" + idA + "\",\"" + duracion + "\",\"" + fechaS + "\",\"" + avance + "\",\"" + calificacion + "\");");
								resultado = "El registro se guardó.";
							}
						}
					}else{
						resultado = "No hay un alumno registrado bajo ese nombre.";
					}
				}else{
					resultado = "No ha llenado todos los campos para completar el registro.";
				}
			}else{
				if(!(duracion.equals("")) && !(avance.equals("")) && !(calificacion.equals("")) && !(request.getParameter("AnoS").equals(""))){
					ResultSet rs = stat.executeQuery("SELECT * FROM sesion WHERE ID_Alumno=\"" + id2 + "\" AND FechaSesion=\"" + fechaS + "\";");

					if(rs.next()){
						resultado = "Ya hay un registro guardado con los valores fecha/alumno que intenta ingresar.";
					}else{
						stat.executeUpdate("INSERT INTO sesion VALUES (\"" + id2 + "\",\"" + duracion + "\",\"" + fechaS + "\",\"" + avance + "\",\"" + calificacion + "\");");
						resultado = "El registro se guardó.";
						sesion.setAttribute("buscado", "");
					}
				}else{
					resultado = "No ha llenado todos los campos para completar el registro.";
				}
			}

			stat1.close();
			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/sesion.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}