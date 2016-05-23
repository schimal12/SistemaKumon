import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Logout extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response){
	try{
	    String logged = "false";
	    getServletContext().setAttribute("logged",logged);
	    RequestDispatcher dips = getServletContext().getRequestDispatcher("/index.jsp");
		if(dips != null){
			dips.forward(request,response);
		}
		}catch(IOException e){
			e.printStackTrace();
		}
		catch(ServletException ex){
			ex.printStackTrace();
		}
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response){
		doPost(request,response);
	}
}