import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegistroAlumno extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			String logged = (String) getServletContext().getAttribute("logged");
			if(logged != null){
				if(logged.equals("false")){
					RequestDispatcher dips = getServletContext().getRequestDispatcher("/alumno.jsp");

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

				RequestDispatcher dips = getServletContext().getRequestDispatcher("/alumno.jsp");

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
			String id_Tut = request.getParameter("ID_Tutor");
			String nombre = request.getParameter("Nombre");
			String direccion = request.getParameter("Direccion");
			String grado = request.getParameter("Grado escolar");
			String nivel = request.getParameter("Nivel");
			String fNac = request.getParameter("AnoNac") + "/" + request.getParameter("MesNac")+ "/" + request.getParameter("DiaNac");
			String fIns = request.getParameter("AnoIns") + "/" + request.getParameter("MesIns")+ "/" + request.getParameter("DiaIns");
			String estatus = request.getParameter("Estatus");
			String beca = request.getParameter("Beca");
			String telefono = request.getParameter("Telefono");

			boolean act = true;
			String resultado = "";

			String usuario = getServletContext().getInitParameter("usuario");
			String pass = getServletContext().getInitParameter("pass");

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/kumon";
			Connection con = DriverManager.getConnection(url,usuario,pass);

			Statement stat = con.createStatement();

			Statement stat1 = con.createStatement();

			System.out.println(id_Tut);

			if(!(telefono.equals(""))&&!(id_Tut.equals("")) && !(nombre.equals("")) && !(direccion.equals("")) && !(request.getParameter("AnoNac").equals("")) && !(request.getParameter("AnoIns").equals(""))){
				ResultSet rs1 = stat1.executeQuery("SELECT * FROM tutor WHERE Nombre=\"" + id_Tut + "\";");
				if(rs1.next()){
					String id_T = rs1.getString("ID");
					ResultSet rs = stat.executeQuery("SELECT * FROM alumno WHERE Nombre=\"" + nombre + "\";");
					while(rs.next()){
						String idT = rs.getString("ID_Tutor");
						String dir = rs.getString("Direccion");
						String grad = rs.getString("Grado");
						String niv = rs.getString("Nivel");
						String tel = rs.getString("Telefono");

						if(idT.equals(id_T) && dir.equals(direccion) && grad.equals(grado) && niv.equals(nivel) && tel.equals(telefono)){
							act = false;
							resultado = "Ya hay un registro guardado con los datos que intenta ingresar.";
						}
					}

					if(act){
						stat.executeUpdate("INSERT INTO alumno(ID_Tutor, Nombre, Direccion, Grado, Nivel, FechaNacimiento, FechaInscripcion, EstatusPago, Becado,Telefono) VALUES (\"" + id_T + "\",\"" + nombre + "\",\"" + direccion + "\",\"" + grado + "\",\"" + nivel + "\",\"" + fNac + "\",\"" + fIns + "\"," + estatus + "," + beca +",\""+telefono+"\");");
						resultado = "El alumno ha sido registrado";
					}
				}else{
					resultado = "No hay un tutor registrado bajo ese Inombe.";
				}
			}else{
				resultado = "No ha llenado todos los campos para completar el registro.";
			}

			stat1.close();
			stat.close();
			con.close();

			request.setAttribute("resultado", resultado);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/alumno.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}