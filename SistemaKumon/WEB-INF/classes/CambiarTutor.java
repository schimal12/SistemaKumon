import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class CambiarTutor extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			String logged = (String) getServletContext().getAttribute("logged");
			if(logged != null){
				if(logged.equals("false")){
					RequestDispatcher dips = getServletContext().getRequestDispatcher("/tutor.jsp");

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

				RequestDispatcher dips = getServletContext().getRequestDispatcher("/tutor.jsp");

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

			String id_Tut = (String) sesion.getAttribute("id_Tut");
			String nombre = request.getParameter("NombreC");
			String direccion = request.getParameter("DireccionC");
			String telefono = request.getParameter("TelefonoC");

			String resultado = "";

			String usuarioB = getServletContext().getInitParameter("usuario");
			String passB = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url, usuarioB, passB);

			Statement stat = con.createStatement();

			if(!(nombre.equals("")) && !(direccion.equals("")) && !(telefono.equals(""))){
				stat.executeUpdate("UPDATE tutor SET Nombre = \"" + nombre + "\", Direccion = \"" + direccion + "\", Telefono = \"" + telefono + "\" WHERE ID = \"" + id_Tut + "\";");
				resultado = "El registro ha sido actualizado.";
			}else{
				resultado = "No ha llenado todos los campos para modificar el registro.";
			}

			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);

			sesion.setAttribute("buscado", "");
			sesion.setAttribute("id_Tut", 0);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/tutor.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}