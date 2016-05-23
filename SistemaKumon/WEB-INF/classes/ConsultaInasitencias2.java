import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ConsultaInasitencias2 extends HttpServlet{
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
	    ResultSet rs = stat.executeQuery("SELECT a.ID, a.Nombre, COUNT(a.ID) FROM alumno AS a, sesion WHERE a.ID = ID_Alumno AND DATE_SUB(CURDATE(),INTERVAL 31 DAY) <= FechaSesion GROUP BY a.ID;");

	    Statement stat1 = con.createStatement();
	    ResultSet rs1 = stat1.executeQuery("SELECT * FROM alumno");

	    while(rs1.next()){
			int idAux = 0;
			if(rs.next()){
				idAux = rs.getInt("ID");
			}
			if(rs1.getInt("ID") == idAux){
				datos.add(rs.getInt("ID"));
				datos.add(rs.getString("Nombre"));
				int auxiliar = 31 - rs.getInt("Count(a.ID)");
				datos.add(auxiliar);
			}else{
				rs.previous();
				datos.add(rs1.getInt("ID"));
				datos.add(rs1.getString("Nombre"));
				datos.add("31");
			}
	    }
	    stat1.close();
	    stat.close();
	    con.close();
	    request.setAttribute("datos",datos);
	    RequestDispatcher disp = getServletContext().getRequestDispatcher("/inasistenciasConsulta.jsp");
	    if(disp != null){
		disp.forward(request,response);
	    }
	}catch(Exception e){
	    e.printStackTrace();
	}
    }
}