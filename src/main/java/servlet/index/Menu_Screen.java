package servlet.index;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class index
 */
@WebServlet({ "/index", "/setMenu", "/dessert", "/drink" })
public class Menu_Screen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Menu_Screen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//request.getContextPath()
		String endPoint = request.getServletPath();
		if (endPoint.equals("/setMenu")) {
			RequestDispatcher rd = request.getRequestDispatcher("/index/page/page2.jsp");
			rd.forward(request, response);
		}
		
		if (endPoint.equals("/dessert")) {
			RequestDispatcher rd = request.getRequestDispatcher("/index/page/page3.jsp");
			rd.forward(request, response);
		}
		
		if (endPoint.equals("/drink")) {
			RequestDispatcher rd = request.getRequestDispatcher("/index/page/page4.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
