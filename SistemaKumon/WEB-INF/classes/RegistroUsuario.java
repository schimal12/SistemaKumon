import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegistroUsuario extends HttpServlet{
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
			String nombre = request.getParameter("Nombre");
			String contrasena = request.getParameter("Contrasena");
			String contrasenaC = request.getParameter("ContrasenaCon");

			String resultado = "";

			String usuario = getServletContext().getInitParameter("usuario");
			String pass = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuario,pass);

			Statement stat = con.createStatement();

			if(!(nombre.equals("")) && !(contrasena.equals(""))){
				ResultSet rs = stat.executeQuery("SELECT * FROM usuario WHERE NombreUsuario=\"" + nombre + "\";");

				if(rs.next()){
					resultado = "Ya hay un registro guardado con el nombre de usuario que intenta ingresar.";
				}else{
					if(contrasena.equals(contrasenaC)){
						stat.executeUpdate("INSERT INTO usuario(NombreUsuario, Contrasena) VALUES (\"" + nombre + "\",\"" + contrasena + "\");");
						resultado = "El registro se guardó.";
					}else{
						resultado = "Las contraseñas no coinciden.";
					}
				}
			}else{
				resultado = "No ha llenado todos los campos para completar el registro.";
			}

			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/usuario.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}