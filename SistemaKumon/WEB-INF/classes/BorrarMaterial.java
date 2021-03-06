import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BorrarMaterial extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			String logged = (String) getServletContext().getAttribute("logged");
			if(logged != null){
				if(logged.equals("false")){
					RequestDispatcher dips = getServletContext().getRequestDispatcher("/material.jsp");

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

				RequestDispatcher dips = getServletContext().getRequestDispatcher("/material.jsp");

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

			String id_Mat = (String) sesion.getAttribute("id_Mat");

			String resultado = "";

			String usuarioB = getServletContext().getInitParameter("usuario");
			String passB = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuarioB,passB);

			Statement stat = con.createStatement();
			stat.executeUpdate("DELETE FROM material WHERE ID = \"" + id_Mat + "\";");
			resultado = "El registro ha sido eliminado.";

			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);

			sesion.setAttribute("id_Mat", 0);
			sesion.setAttribute("buscado", "");
			sesion.setAttribute("buscado2", "");

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/material.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}