package servlet.admin;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coupon.Coupon_kind_Bean;
import coupon.Coupon_kind_Mgr;

/**
 * Servlet implementation class admin_coupon
 */
@WebServlet({ "/admin_coupon", "/api/admin/coupon", "/api/admin/coupon/search" })
public class admin_coupon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Coupon_kind_Mgr mgr = new Coupon_kind_Mgr();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_coupon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String endPoint = request.getServletPath();
		
		if (endPoint.equals("/api/admin/coupon")) {
			mgr.readAllKind();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String endPoint = request.getServletPath();
		
		if (endPoint.equals("/api/admin/coupon")) {
			Map<String, String[]> parameters = request.getParameterMap();
			System.out.println(request.getParameterValues("category"));
		}
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String endPoint = request.getServletPath();
		
		if (endPoint.equals("/api/admin/coupon")) {
			
		}
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String endPoint = request.getServletPath();
		
		if (endPoint.equals("/api/admin/coupon")) {
			
		}
	}

}
