import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BuscaMaterial extends HttpServlet{
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
			HttpSession sesion = request.getSession(true);

			String idMat = request.getParameter("BuscaID");
			String malo = "";

			String usuarioB = getServletContext().getInitParameter("usuario");
			String passB = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuarioB,passB);

			Statement stat = con.createStatement();
			Statement stat1 = con.createStatement();

			List materiales = new ArrayList();

			if(!(idMat.equals(""))){
				ResultSet rs = stat.executeQuery("SELECT * FROM material WHERE NombreMaterial LIKE \"%" + idMat + "%\";");

				while(rs.next()){
					String aux = rs.getString("ID");
					materiales.add(aux);
					materiales.add(aux);
					materiales.add(rs.getString("NombreMaterial"));
				}

				if(!(materiales.isEmpty())){
					if(materiales.size() > 3){
						sesion.setAttribute("buscado", "true");
					}else{
						Statement stat2 = con.createStatement();

						ResultSet rs1 = stat1.executeQuery("SELECT * FROM material WHERE ID=\"" + materiales.get(0) + "\";");
						rs1.next();

						request.setAttribute("nombre", rs1.getString("NombreMaterial"));
						request.setAttribute("exisA", rs1.getString("ExistenciaActual"));
						request.setAttribute("exisM", rs1.getString("ExistenciaMinima"));
						request.setAttribute("fechaU", rs1.getString("FechaUltimoAbastecimiento"));
						request.setAttribute("fechaP", rs1.getString("FechaProximoAbastecimiento"));

						sesion.setAttribute("id_Mat", materiales.get(0));
						sesion.setAttribute("buscado2", "true");

						stat2.close();
					}
				}else{
					sesion.setAttribute("buscado", "");
					malo = "No hay un material registrado con ese nombre.";
				}
			}else{
				sesion.setAttribute("buscado", "");
				malo = "No ha indicado un nombre a buscar.";
			}

			stat1.close();
			stat.close();
			con.close();

			request.setAttribute("materiales", materiales);
			request.setAttribute("malo", malo);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/material.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}