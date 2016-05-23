import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Ingreso extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			String logged = (String) getServletContext().getAttribute("logged");
			if(logged != null){
				if(logged.equals("false")){
					RequestDispatcher dips = getServletContext().getRequestDispatcher("/index2.jsp");

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

				RequestDispatcher dips = getServletContext().getRequestDispatcher("/index2.jsp");

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
			String usuario = request.getParameter("Usuario");
			String contra = request.getParameter("Contrasena");

			boolean act;
			String ingreso = "";

			String usuarioB = getServletContext().getInitParameter("usuario");
			String passB = getServletContext().getInitParameter("pass");
			String logged = "false";

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuarioB,passB);

			Statement stat = con.createStatement();

			if(!(usuario.equals("")) && !(contra.equals(""))){
				ResultSet rs = stat.executeQuery("SELECT * FROM usuario WHERE NombreUsuario=\"" + usuario + "\";");

				if(rs.next()){
					String user = rs.getString("NombreUsuario");
					String pass = rs.getString("Contrasena");

					if(user.equals(usuario) && pass.equals(contra)){
						act = true;
						logged = "true";
						ingreso = "";
					}else{
						act = false;
						ingreso = "La combinación usuario/contraseña es incorrecta.";
					}

				}else{
					act = false;
					ingreso = "Usuario inexistente.";
				}
			}else{
				act = false;
				ingreso = "No ha llenado todos los campos necesarios para ingresar al sistema.";
			}

			stat.close();
			con.close();

			HttpSession sesion = request.getSession(true);
			sesion.setAttribute("elegido", "alta");

			getServletContext().setAttribute("logged", logged);

			request.setAttribute("ingreso", ingreso);

			if(act){
				RequestDispatcher disp = getServletContext().getRequestDispatcher("/index2.jsp");

				if(disp != null){
					disp.forward(request,response);
				}
			}else{
				RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");

				if(disp != null){
					disp.forward(request,response);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}