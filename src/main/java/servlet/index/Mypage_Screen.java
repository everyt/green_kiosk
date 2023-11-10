package servlet.index;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Mypage_Screen
 */
@WebServlet({ "/Mypage_Screen", "/mypage/personal", "/mypage/order_log", "/mypage/mile_log", "/mypage/unregister" })
public class Mypage_Screen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mypage_Screen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String endPoint = request.getServletPath();
		if (endPoint.equals("/mypage/personal")) {
			RequestDispatcher rd = request.getRequestDispatcher("/mypage/personal.jsp");
			rd.forward(request, response);
		}
		
		if (endPoint.equals("/mypage/order_log")) {
			RequestDispatcher rd = request.getRequestDispatcher("/mypage/order.jsp");
			rd.forward(request, response);
		}
		
		if (endPoint.equals("/mypage/mile_log")) {
			RequestDispatcher rd = request.getRequestDispatcher("/mypage/mile.jsp");
			rd.forward(request, response);
		}
		
		if (endPoint.equals("/mypage/unregister")) {
			RequestDispatcher rd = request.getRequestDispatcher("/mypage/unregi.jsp");
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
