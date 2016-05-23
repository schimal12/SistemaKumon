import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BorrarSesion extends HttpServlet{
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

			int id = (int) sesion.getAttribute("idSesAlu");
			String fecha = (String) sesion.getAttribute("fechaSes");

			String resultado = "";

			String usuario = getServletContext().getInitParameter("usuario");
			String pass = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuario,pass);

			Statement stat = con.createStatement();
			stat.executeUpdate("DELETE FROM sesion WHERE  ID_Alumno=\"" + id + "\" AND FechaSesion=\"" + fecha + "\";");
			resultado = "El registro ha sido eliminado.";

			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);

			sesion.setAttribute("idSesAlu", 0);
			sesion.setAttribute("fechaSes", "");
			sesion.setAttribute("buscado", "");
			sesion.setAttribute("buscado2", "");

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/sesion.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}