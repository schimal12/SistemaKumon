import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BuscaUsuario extends HttpServlet{
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

			String idUsu = request.getParameter("BuscaID");
			String contAnt = request.getParameter("ContrasenaAnt");
			String malo = "";

			int idU = 0;

			String usuarioB = getServletContext().getInitParameter("usuario");
			String passB = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuarioB,passB);

			Statement stat = con.createStatement();

			if(!(idUsu.equals(""))){
				ResultSet rs = stat.executeQuery("SELECT * FROM usuario WHERE NombreUsuario=\"" + idUsu + "\";");

				if(rs.next()){
					sesion.setAttribute("buscado", "true");
					idU = rs.getInt("ID");

					request.setAttribute("usuario", rs.getString("NombreUsuario"));
				}else{
					sesion.setAttribute("buscado", "");
					malo = "No hay un usuario registrado con ese nombre.";
				}
			}else{
				sesion.setAttribute("buscado", "");
				malo = "No ha indicado un nombre a buscar.";
			}

			sesion.setAttribute("id_Usu", idU);

			stat.close();
			con.close();

			request.setAttribute("malo", malo);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/usuario.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}