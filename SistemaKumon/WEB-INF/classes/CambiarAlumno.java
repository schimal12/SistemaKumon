import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class CambiarAlumno extends HttpServlet{
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

			String idAl = (String) sesion.getAttribute("id_Al");

			String id_Tut = request.getParameter("ID_TutorC");
			String nombre = request.getParameter("NombreC");
			String direccion = request.getParameter("DireccionC");
			String grado = request.getParameter("GradoC");
			String nivel = request.getParameter("NivelC");
			String fNac = request.getParameter("FechaNacC");
			String fIns = request.getParameter("FechaInsC");
			String estatus = request.getParameter("EstatusC");
			String beca = request.getParameter("BecaC");
			String telefono = request.getParameter("TelefonoC");
			int IDTutorAux=0;
			String resultado = "";

			String usuario = getServletContext().getInitParameter("usuario");
			String pass = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuario,pass);

			Statement stat = con.createStatement();
			Statement stat1 = con.createStatement();
			if(!(telefono.equals(""))&&!(id_Tut.equals("")) && !(nombre.equals("")) && !(direccion.equals("")) && !(fNac.equals("")) && !(fIns.equals(""))){
			    ResultSet rj = stat1.executeQuery("SELECT * FROM tutor WHERE Nombre=\""+id_Tut+"\";");
				if(rj.next()){
				    IDTutorAux = rj.getInt("ID");
					stat.executeUpdate("UPDATE alumno SET ID_Tutor = \"" +IDTutorAux + "\", Nombre = \"" + nombre + "\", Direccion = \"" + direccion + "\", Grado = \"" + grado + "\", Nivel =\"" + nivel + "\", FechaNacimiento = \"" + fNac + "\", FechaInscripcion = \"" + fIns + "\", EstatusPago = " + estatus + ", Becado = " + beca +", Telefono=\""+telefono+"\"  WHERE ID = \"" + idAl + "\";");
					resultado = "El registro ha sido actualizado.";
				}else{
					resultado = "El tutor al cual se intenta referenciar no esta registrado en la base de datos.";
				}
			}else{
				resultado = "No ha llenado todos los campos para modificar el registro.";
			}
			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);

			sesion.setAttribute("buscado", "");
			sesion.setAttribute("id_Al", "");

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/alumno.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}