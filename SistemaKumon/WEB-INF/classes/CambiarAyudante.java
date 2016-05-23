import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class CambiarAyudante extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			String logged = (String) getServletContext().getAttribute("logged");
			if(logged != null){
				if(logged.equals("false")){
					RequestDispatcher dips = getServletContext().getRequestDispatcher("/ayudante.jsp");

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

				RequestDispatcher dips = getServletContext().getRequestDispatcher("/ayudante.jsp");

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

			String nombre = (String) sesion.getAttribute("nombreAy");
			String usuarioA = (String) sesion.getAttribute("usuarioAy");
			String fecha = (String) sesion.getAttribute("fechaRegAy");
			String horaEnt = request.getParameter("HoraEntradaC");
			String horaSal = request.getParameter("HoraSalidaC");

			String resultado = "";

			String usuario = getServletContext().getInitParameter("usuario");
			String pass = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuario,pass);

			Statement stat = con.createStatement();

			if(!(horaEnt.equals("")) && !(horaSal.equals(""))){
				stat.executeUpdate("UPDATE ayudante SET HoraEntrada = \"" + horaEnt + "\", HoraSalida = \"" + horaSal + "\" WHERE  Nombre=\"" + nombre + "\" AND Usuario=\"" + usuarioA + "\" AND FechaR=\"" + fecha + "\";");
				resultado = "El registro ha sido actualizado.";
			}else{
				resultado = "No ha llenado todos los campos para modificar el registro.";
			}

			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);

			sesion.setAttribute("buscado", "");
			sesion.setAttribute("nombreAy", "");
			sesion.setAttribute("usuarioAy", "");
			sesion.setAttribute("fechaRegAy", "");

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/ayudante.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}