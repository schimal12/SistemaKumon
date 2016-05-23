import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class CambiarMaterial extends HttpServlet{
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

			String id_Mat = (String) sesion.getAttribute("id_Mat");
			String nombre = request.getParameter("NombreC");
			String exisA = request.getParameter("ExistenciaAC");
			String exisM = request.getParameter("ExistenciaMC");
			String fUlt = request.getParameter("FechaUC");
			String fProx = request.getParameter("FechaPC");

			String resultado = "";

			String usuarioB = getServletContext().getInitParameter("usuario");
			String passB = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url, usuarioB, passB);

			Statement stat = con.createStatement();

			if(!(nombre.equals("")) && !(exisA.equals("")) && !(exisM.equals("")) && !(fUlt.equals("")) && !(fProx.equals(""))){
				stat.executeUpdate("UPDATE material SET NombreMaterial = \"" + nombre + "\", ExistenciaActual = \"" + exisA + "\", ExistenciaMinima = \"" + exisM + "\", FechaUltimoAbastecimiento = \"" + fUlt + "\", FechaProximoAbastecimiento = \"" + fProx + "\" WHERE ID = \"" + id_Mat + "\";");
				resultado = "El registro ha sido actualizado.";
			}else{
				resultado = "No ha llenado todos los campos para modificar el registro.";
			}

			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);

			sesion.setAttribute("buscado", "");
			sesion.setAttribute("id_Mat", 0);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/material.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}