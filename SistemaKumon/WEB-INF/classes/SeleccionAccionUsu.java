import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SeleccionAccionUsu extends HttpServlet{
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

			String opcion = request.getParameter("query");
			String elegido = "";

			switch(opcion){
					case "Alta":
						elegido = "alta";
						break;
					case "Cambio":
						elegido = "cambio";
						break;
					case "Baja":
						elegido = "baja";
						break;
			}

			sesion.setAttribute("elegido", elegido);
			sesion.setAttribute("buscado", "");
			sesion.setAttribute("buscado2", "");
			sesion.setAttribute("id_Usu", 0);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/usuario.jsp");

			if(disp != null){
				disp.forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}