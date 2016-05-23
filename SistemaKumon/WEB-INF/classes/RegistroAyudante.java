import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegistroAyudante extends HttpServlet{
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
			String nombre = request.getParameter("Nombre");
			String usuario = request.getParameter("Usuario");
			String fechaR = request.getParameter("AnoReg") + "/" + request.getParameter("MesReg")+ "/" + request.getParameter("DiaReg");
			String horaEnt = request.getParameter("HoraEntrada");
			String horaSal = request.getParameter("HoraSalida");

			String resultado = "";

			String user = getServletContext().getInitParameter("usuario");
			String pass = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,user,pass);

			Statement stat = con.createStatement();

			if(!(nombre.equals("")) && !(usuario.equals("")) && !(horaEnt.equals("")) && !(horaSal.equals("")) && !(request.getParameter("AnoReg").equals(""))){
				ResultSet rs = stat.executeQuery("SELECT * FROM ayudante WHERE Nombre=\"" + nombre + "\" AND Usuario=\"" + usuario + "\" AND FechaR=\"" + fechaR + "\";");

				if(rs.next()){
					resultado = "Ya hay un registro guardado con los datos que intenta ingresar.";
				}else{
					stat.executeUpdate("INSERT INTO ayudante VALUES (\"" + nombre + "\",\"" + usuario + "\",\"" + fechaR + "\",\"" + horaEnt + "\",\"" + horaSal + "\");");
					resultado = "El registro se guardó.";
				}
			}else{
				resultado = "No ha llenado todos los campos para completar el registro.";
			}

			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/ayudante.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}