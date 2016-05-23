import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ConsultaMateriales extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			String logged = (String) getServletContext().getAttribute("logged");
			if(logged != null){
				if(logged.equals("false")){
					RequestDispatcher dips = getServletContext().getRequestDispatcher("/consulta.jsp");

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

				RequestDispatcher dips = getServletContext().getRequestDispatcher("/consulta.jsp");

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
	    String usuarioB = getServletContext().getInitParameter("usuario");
	    String passB = getServletContext().getInitParameter("pass");

	    HttpSession sesion = request.getSession(true);

	    Class.forName("com.mysql.jdbc.Driver");
	    String url = "jdbc:mysql://localhost/kumon";
	    Connection con = DriverManager.getConnection(url,usuarioB,passB);

	    List datos = new ArrayList();

	    Statement stat = con.createStatement();
	    ResultSet rs = stat.executeQuery("SELECT * FROM material WHERE CURDATE() > FechaProximoAbastecimiento OR ExistenciaActual < ExistenciaMinima;");

	    while(rs.next()){
			datos.add(rs.getString("NombreMaterial"));
			datos.add(rs.getString("ExistenciaActual"));
			datos.add(rs.getString("ExistenciaMinima"));
			datos.add(rs.getInt("FechaProximoAbastecimiento"));
	    }

	    stat.close();
	    con.close();
	    request.setAttribute("datos",datos);

	    RequestDispatcher disp = getServletContext().getRequestDispatcher("/materialConsulta.jsp");

	    if(disp != null){
			disp.forward(request,response);
	    }
	}catch(Exception e){
	    e.printStackTrace();
	}
    }
}