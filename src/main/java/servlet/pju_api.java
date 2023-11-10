package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.Member_Mgr;

/**
 * Servlet implementation class pju_api
 */
@WebServlet({ "/pju_api", "/api/user/find_id", "/api/s/find_pw" })
public class pju_api extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pju_api() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String endPoint = request.getServletPath();
		PrintWriter out = response.getWriter();
		if (endPoint.equals("/api/user/find_id")) {
			String mem_name = request.getParameter("name");
			String mem_phone = request.getParameter("phone");
			
			Member_Mgr mgr = new Member_Mgr();
			
			List<String> ids = mgr.findId(mem_name, mem_phone);
			
			System.out.println(ids);
			String s_res = "";
			for (String id : ids) {
				if (s_res.equals("") ) {
					s_res = id;
				} else {
					s_res = s_res+", "+id+"";
				}
				
			}
			out.write("{\"result\":\""+s_res+"\"}");
		}
		
		if (endPoint.equals("/find_pw")) {
			String mem_id = request.getParameter("id");
			String mem_name = request.getParameter("name");
			String mem_phone = request.getParameter("phone");
			
			Member_Mgr mgr = new Member_Mgr();
			
			List<String> ids = mgr.findpw( mem_id , mem_name, mem_phone);
			String s_res = "";
			for (String id : ids) {
				if (s_res.equals("") ) {
					s_res = "['"+id+"'";
				} else {
					s_res = s_res+", '"+id+"'";
				}
				
			}
			s_res = s_res + "]";
			
			out.write("{\"result\":\""+s_res+"\"}");
		}
	}

}
