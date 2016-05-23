import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegistroMaterial extends HttpServlet{
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
			String nombre = request.getParameter("Nombre");
			String exisA = request.getParameter("ExistenciaA");
			String exisM = request.getParameter("ExistenciaM");
			String fechaU = request.getParameter("AnoU") + "-" + request.getParameter("MesU")+ "-" + request.getParameter("DiaU");
			String fechaP = request.getParameter("AnoP") + "-" + request.getParameter("MesP")+ "-" + request.getParameter("DiaP");

			String resultado = "";
			boolean act = true;

			String usuario = getServletContext().getInitParameter("usuario");
			String pass = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuario,pass);

			Statement stat = con.createStatement();

			if(!(nombre.equals("")) && !(exisA.equals("")) && !(exisM.equals("")) && !(request.getParameter("AnoU").equals("")) && !(request.getParameter("AnoP").equals(""))){
				ResultSet rs = stat.executeQuery("SELECT * FROM material WHERE NombreMaterial=\"" + nombre + "\";");
				while(rs.next()){
					String eA = rs.getString("ExistenciaActual");
					String eM = rs.getString("ExistenciaMinima");
					String fU = rs.getString("FechaUltimoAbastecimiento");
					String fP = rs.getString("FechaProximoAbastecimiento");

					if(eA.equals(exisA) && eM.equals(exisM) && fU.equals(fechaU) && fP.equals(fechaP)){
						act = false;
						resultado = "Ya hay un registro guardado con los datos que intenta ingresar.";
					}
				}

				if(act){
					stat.executeUpdate("INSERT INTO material(NombreMaterial, ExistenciaActual, ExistenciaMinima, FechaUltimoAbastecimiento, FechaProximoAbastecimiento) VALUES (\"" + nombre + "\",\"" + exisA + "\",\"" + exisM + "\",\"" + fechaU + "\",\"" + fechaP + "\");");
					resultado = "El registro se guardó.";
				}
			}else{
				resultado = "No ha llenado todos los campos para completar el registro.";
			}

			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);
			RequestDispatcher disp = getServletContext().getRequestDispatcher("/material.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}