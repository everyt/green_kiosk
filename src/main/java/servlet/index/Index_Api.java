package servlet.index;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.Member_Bean;
import user.Member_Mgr;

/**
 * Servlet implementation class Index_Api
 */
@WebServlet({ "/Index_Api", "/check_pw" })
public class Index_Api extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index_Api() {
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
		if (endPoint.equals("/check_pw")) {
			PrintWriter out = response.getWriter();
			
			HttpSession session = request.getSession();
			Object mem_id = session.getAttribute("mem_id");
			Member_Mgr u_mgr = new Member_Mgr();
			Member_Bean bean = null;
			String mem_pw = null;
			
			boolean find_pw = false;
			
			Cookie[] cookies = request.getCookies();
			if (cookies.length == 0) {
				System.out.println("쿠키 없음");
			} else {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("mem_pw")) {
						mem_pw = cookie.getValue();
						cookie.setMaxAge(0);
						response.addCookie(cookie);
						find_pw = true;
					}
				}
			}
			
			String mem_ac = "user";
			if (mem_id == null) {
				out.write("{\"result\":\"failed\"}");
			} else {
			
				if (find_pw == false) {
					session.invalidate();
					out.write("{\"result\":\"failed\"}");
				} else {
				
					Member_Mgr Mgr = new Member_Mgr();
					
					boolean result = Mgr.loginMember(String.valueOf(mem_id), mem_pw);
					
					PrintWriter script = response.getWriter();
					
					if (request.isRequestedSessionIdValid()) {
						if (result) {
							session.setAttribute("pw_ok", "true");
							session.setAttribute("failed_count", 0);
							out.write("{\"result\":\"success\"}");
						} else {
							session.setAttribute("pw_ok", "false");
							out.write("{\"result\":\"failed\"}");
						}
					} else {
						out.write("{\"result\":\"failed\"}");
					}
				}
			}
		}
	}

}
