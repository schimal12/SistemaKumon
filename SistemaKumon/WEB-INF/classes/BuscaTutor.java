import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BuscaTutor extends HttpServlet{
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
			HttpSession sesion = request.getSession(true);

			String idTut = request.getParameter("BuscaID");
			String malo = "";

			String usuarioB = getServletContext().getInitParameter("usuario");
			String passB = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuarioB,passB);

			Statement stat = con.createStatement();
			Statement stat1 = con.createStatement();

			List tutores = new ArrayList();

			if(!(idTut.equals(""))){
				ResultSet rs = stat.executeQuery("SELECT * FROM tutor WHERE Nombre LIKE \"%" + idTut + "%\";");

				while(rs.next()){
					String aux = rs.getString("ID");
					tutores.add(aux);
					tutores.add(aux);
					tutores.add(rs.getString("Nombre"));
				}

				if(!(tutores.isEmpty())){
					if(tutores.size() > 3){
						sesion.setAttribute("buscado", "true");
					}else{
						Statement stat2 = con.createStatement();

						ResultSet rs1 = stat1.executeQuery("SELECT * FROM tutor WHERE ID=\"" + tutores.get(0) + "\";");
						rs1.next();

						request.setAttribute("nombre", rs1.getString("Nombre"));
						request.setAttribute("direccion", rs1.getString("Direccion"));
						request.setAttribute("telefono", rs1.getString("Telefono"));

						sesion.setAttribute("id_Tut", tutores.get(0));
						sesion.setAttribute("buscado2", "true");

						stat2.close();
					}
				}else{
					sesion.setAttribute("buscado", "");
					malo = "No hay un tutor registrado con ese nombre.";
				}
			}else{
				sesion.setAttribute("buscado", "");
				malo = "No ha indicado un nombre a buscar.";
			}

			stat1.close();
			stat.close();
			con.close();

			request.setAttribute("tutores", tutores);
			request.setAttribute("malo", malo);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/tutor.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}