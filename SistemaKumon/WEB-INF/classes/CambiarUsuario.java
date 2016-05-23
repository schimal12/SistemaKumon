import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class CambiarUsuario extends HttpServlet{
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

			int id_Usu = (int) sesion.getAttribute("id_Usu");

			String cAnt = request.getParameter("ContrasenaAnt");
			String cNueva = request.getParameter("ContrasenaC");
			String ccNueva = request.getParameter("ContrasenaConC");

			String resultado = "";

			String usuarioB = getServletContext().getInitParameter("usuario");
			String passB = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url, usuarioB, passB);

			Statement stat = con.createStatement();

			if(!(cAnt.equals("")) && !(cNueva.equals("")) && !(ccNueva.equals(""))){
				ResultSet rs = stat.executeQuery("SELECT * FROM usuario WHERE ID=\"" + id_Usu + "\";");
				rs.next();
				String cAux = rs.getString("Contrasena");

				if(cAux.equals(cAnt)){
					if(cNueva.equals(ccNueva)){
						stat.executeUpdate("UPDATE usuario SET Contrasena = \"" + cNueva + "\" WHERE ID = \"" + id_Usu + "\";");
						resultado = "El registro ha sido actualizado.";
					}else{
						resultado = "Las contraseñas no coinciden.";
					}
				}else{
					resultado = "La contraseña anterior no coincide con la registrada en la base de datos.";
				}
			}else{
				resultado = "No ha llenado todos los campos para modificar el registro.";
			}

			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);

			sesion.setAttribute("buscado", "");
			sesion.setAttribute("id_Usu", 0);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/usuario.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}