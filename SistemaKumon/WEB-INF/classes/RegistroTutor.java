import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegistroTutor extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			String logged = (String) getServletContext().getAttribute("logged");
			if(logged != null){
				if(logged.equals("false")){
					RequestDispatcher dips = getServletContext().getRequestDispatcher("/tutor.jsp");

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

				RequestDispatcher dips = getServletContext().getRequestDispatcher("/tutor.jsp");

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
			String direccion = request.getParameter("Direccion");
			String telefono = request.getParameter("Telefono");

			boolean act = true;
			String resultado = "";

			String usuario = getServletContext().getInitParameter("usuario");
			String pass = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuario,pass);

			Statement stat = con.createStatement();

			if(!(nombre.equals("")) && !(direccion.equals("")) && !(telefono.equals(""))){
				ResultSet rs = stat.executeQuery("SELECT * FROM tutor WHERE Nombre=\"" + nombre + "\";");
				while(rs.next()){
					String dir = rs.getString("Direccion");
					String tel = rs.getString("Telefono");

					if(dir.equals(direccion) && tel.equals(telefono)){
						act = false;
						resultado = "Ya hay un registro guardado con los datos que intenta ingresar.";
					}
				}

				if(act){
					stat.executeUpdate("INSERT INTO tutor(Nombre, Direccion, Telefono) VALUES (\"" + nombre + "\",\"" + direccion + "\",\"" + telefono + "\");");
					resultado = "El registro se guardó.";
				}
			}else{
				resultado = "No ha llenado todos los campos para completar el registro.";
			}

			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/tutor.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}