import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class EligeTutor extends HttpServlet{
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

			String idTut = request.getParameter("Elegido");

			String usuarioB = getServletContext().getInitParameter("usuario");
			String passB = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuarioB,passB);

			Statement stat = con.createStatement();

			ResultSet rs = stat.executeQuery("SELECT * FROM tutor WHERE ID=\"" + idTut + "\";");

			if(rs.next()){
				request.setAttribute("nombre", rs.getString("Nombre"));
				request.setAttribute("direccion", rs.getString("Direccion"));
				request.setAttribute("telefono", rs.getString("Telefono"));
			}

			sesion.setAttribute("id_Tut", idTut);
			sesion.setAttribute("buscado2", "true");

			stat.close();
			con.close();

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/tutor.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}