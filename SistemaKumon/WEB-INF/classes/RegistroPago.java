import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegistroPago extends HttpServlet{
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

			String id = request.getParameter("ID_Al");
			String id2 = request.getParameter("ID_Al2");
			String usuario = request.getParameter("Usuario");
			String monto = request.getParameter("Monto");
			String fechaP = request.getParameter("AnoP") + "/" + request.getParameter("MesP")+ "/" + request.getParameter("DiaP");
			String periodo = request.getParameter("Periodo");
			String tipo = request.getParameter("Tipo");
			String fechaR = request.getParameter("AnoR") + "/" + request.getParameter("MesR")+ "/" + request.getParameter("DiaR");

			String resultado = "";

			String user = getServletContext().getInitParameter("usuario");
			String pass = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,user,pass);

			Statement stat = con.createStatement();

			Statement stat1 = con.createStatement();

			Statement stat2 = con.createStatement();

			List<String> alumnos = new ArrayList<String>();

			if(id != null){
				if(!(id.equals("")) && !(usuario.equals("")) && !(monto.equals("")) && !(periodo.equals("")) && !(tipo.equals("")) && !(request.getParameter("AnoR").equals("")) && !(request.getParameter("AnoP").equals(""))){
					ResultSet rs1 = stat1.executeQuery("SELECT * FROM alumno WHERE Nombre=\"" + id + "\";");

					ResultSet rs2 = stat2.executeQuery("SELECT * FROM usuario WHERE NombreUsuario=\"" + usuario + "\";");

					while(rs1.next()){
						String aux = rs1.getString("ID");
						alumnos.add(aux);
						alumnos.add(aux);
						alumnos.add(rs1.getString("Nombre"));
					}

					if(rs2.next()){
						int idU = rs2.getInt("ID");

						if(!(alumnos.isEmpty())){
							if(alumnos.size() > 3){
								request.setAttribute("alumnos", alumnos);
								sesion.setAttribute("buscado", "true");
								resultado = "Hay más de un alumno registrado con ese nombre, por favor seleccione uno de la lista y vuelva a ingresar los datos.";
							}else{
								String idA = alumnos.get(0);

								ResultSet rs = stat.executeQuery("SELECT * FROM pago WHERE ID_Alumno=\"" + idA + "\" AND ID_Usuario=\"" + idU + "\" AND FechaPago=\"" + fechaP + "\";");

								if(rs.next()){
									resultado = "Ya hay un registro guardado con los datos que intenta ingresar.";
								}else{
									stat.executeUpdate("INSERT INTO pago VALUES (\"" + idA + "\",\"" + idU + "\",\"" + monto + "\",\"" + fechaP + "\",\"" + periodo + "\",\"" + tipo + "\",\"" + fechaR + "\");");
									resultado = "El registro se guardó.";
								}
							}
						}else{
							resultado = "No hay un alumno registrado bajo esos datos.";
						}
					}else{
						resultado = "No hay un usuario registrado bajo esos datos.";
					}
				}else{
					resultado = "No ha llenado todos los campos para completar el registro.";
				}
			}else{
				if(!(usuario.equals("")) && !(monto.equals("")) && !(periodo.equals("")) && !(tipo.equals("")) && !(request.getParameter("AnoR").equals("")) && !(request.getParameter("AnoP").equals(""))){
					ResultSet rs2 = stat2.executeQuery("SELECT * FROM usuario WHERE NombreUsuario=\"" + usuario + "\";");

					if(rs2.next()){
						int idU = rs2.getInt("ID");

						ResultSet rs = stat.executeQuery("SELECT * FROM pago WHERE ID_Alumno=\"" + id2 + "\" AND ID_Usuario=\"" + idU + "\" AND FechaPago=\"" + fechaP + "\";");

						if(rs.next()){
							resultado = "Ya hay un registro guardado con los datos que intenta ingresar.";
						}else{
							stat.executeUpdate("INSERT INTO pago VALUES (\"" + id2 + "\",\"" + idU + "\",\"" + monto + "\",\"" + fechaP + "\",\"" + periodo + "\",\"" + tipo + "\",\"" + fechaR + "\");");
							resultado = "El registro se guardó.";
						}
					}else{
						resultado = "No hay un usuario registrado bajo esos datos.";
					}
				}else{
					resultado = "No ha llenado todos los campos para completar el registro.";
				}
			}

			stat2.close();
			stat1.close();
			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/pago.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}