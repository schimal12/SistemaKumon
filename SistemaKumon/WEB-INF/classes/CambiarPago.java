import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class CambiarPago extends HttpServlet{
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

			String monto = request.getParameter("MontoC");
			String periodo = request.getParameter("PeriodoC");
			String tipo = request.getParameter("TipoC");
			String fechaR = request.getParameter("AnoRC") + "/" + request.getParameter("MesRC")+ "/" + request.getParameter("DiaRC");

			String resultado = "";

			String usuario = getServletContext().getInitParameter("usuario");
			String pass = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuario,pass);

			Statement stat = con.createStatement();

			if(!(monto.equals("")) && !(periodo.equals("")) && !(tipo.equals("")) && !(request.getParameter("AnoRC").equals(""))){
				stat.executeUpdate("UPDATE pago SET Monto = \"" + monto + "\", PeriodoAPagar = \"" + periodo + "\", TipoPago = \"" + tipo + "\", FechaRegistro = \"" + fechaR + "\" WHERE  ID_Alumno=\"" + idAl + "\" AND ID_Usuario=\"" + idUs + "\" AND FechaPago=\"" + fecha + "\";");
				resultado = "El registro ha sido actualizado.";
			}else{
				resultado = "No ha llenado todos los campos para modificar el registro.";
			}

			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);

			sesion.setAttribute("buscado", "");
			sesion.setAttribute("idAluPag", 0);
			sesion.setAttribute("idUsuPag", 0);
			sesion.setAttribute("fechaPag", "");

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/pago.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}