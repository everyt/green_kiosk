package servlet.index;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.Member_Mgr;

/**
 * Servlet implementation class User_Api
 */
@WebServlet({ "/User_Api", "/api/user/update", "/api/user/check_pw" })
public class User_Api extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_Api() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String endPoint = request.getServletPath();
		if (endPoint.equals("/api/user/check_pw")) {
			RequestDispatcher rd = request.getRequestDispatcher("/user/pw_check.jsp");
			rd.forward(request, response);
		} else {
			response.sendError(405);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String endPoint = request.getServletPath();// TODO Auto-generated method stub
		Member_Mgr mgr = new Member_Mgr();
		PrintWriter out = response.getWriter();
		if (endPoint.equals("/api/user/update")) {
			HttpSession session = request.getSession();
			String mem_id = String.valueOf(session.getAttribute("mem_id"));
			String Name = request.getParameter("name");
			String phone = request.getParameter("phone");
			
			boolean res = mgr.updateMember(mem_id, Name, phone);
			if(res){
				  out.write("{\"result\":\"success\"}");
			  } else {
				  out.write("{\"result\":\"failed\"}");
			  }
		}
	}

}
