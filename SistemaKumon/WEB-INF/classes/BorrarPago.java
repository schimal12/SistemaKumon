import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BorrarPago extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			String logged = (String) getServletContext().getAttribute("logged");
			if(logged != null){
				if(logged.equals("false")){
					RequestDispatcher dips = getServletContext().getRequestDispatcher("/pago.jsp");

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

				RequestDispatcher dips = getServletContext().getRequestDispatcher("/pago.jsp");

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

			int idAl = (int) sesion.getAttribute("idAluPag");
			int idUs = (int) sesion.getAttribute("idUsuPag");
			String fecha = (String) sesion.getAttribute("fechaPag");

			String resultado = "";

			String usuario = getServletContext().getInitParameter("usuario");
			String pass = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuario,pass);

			Statement stat = con.createStatement();
			stat.executeUpdate("DELETE FROM pago WHERE  ID_Alumno=\"" + idAl + "\" AND ID_Usuario=\"" + idUs + "\" AND FechaPago=\"" + fecha + "\";");
			resultado = "El registro ha sido eliminado.";

			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);

			sesion.setAttribute("idAluPag", 0);
			sesion.setAttribute("idUsuPag", 0);
			sesion.setAttribute("fechaPag", "");
			sesion.setAttribute("buscado", "");
			sesion.setAttribute("buscado2", "");

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/pago.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}