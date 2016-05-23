import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class EligeMaterial extends HttpServlet{
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

			String idMat = request.getParameter("Elegido");

			String usuarioB = getServletContext().getInitParameter("usuario");
			String passB = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuarioB,passB);

			Statement stat = con.createStatement();

			ResultSet rs = stat.executeQuery("SELECT * FROM material WHERE ID=\"" + idMat + "\";");

			if(rs.next()){
				request.setAttribute("nombre", rs.getString("NombreMaterial"));
				request.setAttribute("exisA", rs.getString("ExistenciaActual"));
				request.setAttribute("exisM", rs.getString("ExistenciaMinima"));
				request.setAttribute("fechaU", rs.getString("FechaUltimoAbastecimiento"));
				request.setAttribute("fechaP", rs.getString("FechaProximoAbastecimiento"));
			}

			sesion.setAttribute("id_Mat", idMat);
			sesion.setAttribute("buscado2", "true");

			stat.close();
			con.close();

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/material.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}