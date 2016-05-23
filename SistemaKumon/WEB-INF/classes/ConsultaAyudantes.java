import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ConsultaAyudantes extends HttpServlet{
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
	    ResultSet rs = stat.executeQuery("SELECT Nombre, Usuario, SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(HoraSalida, HoraEntrada)))) FROM ayudante WHERE DATE_SUB(CURDATE(),INTERVAL 15 DAY) <= FechaR GROUP BY Nombre, Usuario;");
	    while(rs.next()){
		datos.add(rs.getString("Nombre"));
		datos.add(rs.getString("Usuario"));
		datos.add(rs.getTime("SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(HoraSalida, HoraEntrada))))"));
	    }
	    stat.close();
	    con.close();
	    request.setAttribute("datos",datos);
	    RequestDispatcher disp = getServletContext().getRequestDispatcher("/ayudanteConsulta.jsp");
	    if(disp != null){
		disp.forward(request,response);
	    }
	}catch(Exception e){
	    e.printStackTrace();
	}
    }
}