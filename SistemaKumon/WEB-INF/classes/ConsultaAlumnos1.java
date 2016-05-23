import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ConsultaAlumnos1 extends HttpServlet{
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
			String page = "/alumnoConsulta1.jsp";
			List datos = new ArrayList();
			Statement stat = con.createStatement();
			ResultSet rs = stat.executeQuery("Select * FROM alumno AS a WHERE a.EstatusPago = FALSE AND a.ID IN (SELECT al.ID FROM alumno AS al,sesion WHERE al.ID = ID_Alumno AND DATE_SUB(CURDATE(),INTERVAL 30 DAY)<= FechaSesion);");
			while(rs.next()){
			    datos.add(rs.getInt("ID"));
			    datos.add(rs.getString("Nombre"));
			    datos.add(rs.getString("Grado"));
			    datos.add(rs.getInt("EstatusPago"));
			}
			stat.close();
			con.close();
			request.setAttribute("datos",datos);
			RequestDispatcher disp = getServletContext().getRequestDispatcher("/alumnoConsulta1.jsp");
			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}