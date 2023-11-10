package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import menu.Manager_Menu;
import menu.Menu_component_Bean;
import menu.Menu_menu_Bean;
/**
 * Servlet implementation class admin
 */
@WebServlet({ "/admin", "/api/admin/edit_jaego", "/api/admin/edit_menu"})
public class admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String endPoint = request.getServletPath();
		if (endPoint.equals("/api/admin/edit_jaego")) {
			Menu_component_Bean bean = new Menu_component_Bean();
			bean.setComponent_amount(Integer.parseInt(request.getParameter("amount")));
			bean.setComponent_imgPath(request.getParameter("imgpath"));
			bean.setComponent_name(request.getParameter("name"));
			bean.setComponent_no(Integer.parseInt(request.getParameter("no")));
			bean.setComponent_price(Integer.parseInt(request.getParameter("price")));
			
			Manager_Menu menuMgr = new Manager_Menu();
			PrintWriter out = response.getWriter();
			boolean result = menuMgr.updateComponent(bean);
			  if(result){
				  out.write("{\"result\":\"success\"}");
			  } else {
				  out.write("{\"result\":\"failed\"}");
			  }
		} else if (endPoint.equals("/api/admin/edit_menu")) {
			Menu_menu_Bean bean = new Menu_menu_Bean();
			bean.setMenu_name(request.getParameter("menu_name"));
			bean.setMenu_gubn(request.getParameter("menu_gubn"));
			bean.setMenu_price(Integer.parseInt(request.getParameter("menu_price")));
			bean.setMenu_content(request.getParameter("menu_content"));
			bean.setMenu_imgPath(request.getParameter("menu_imgPath"));
			bean.setMenu_isUse(Integer.parseInt(request.getParameter("menu_isUse")));
			bean.setMenu_isSale(Integer.parseInt(request.getParameter("menu_isSale")));
			bean.setMenu_no(Integer.parseInt(request.getParameter("menu_no")));
			
			Manager_Menu menuMgr = new Manager_Menu();
			PrintWriter out = response.getWriter();
			boolean result = menuMgr.updateMenu(bean);
			  if(result){
				  out.write("{\"result\":\"success\"}");
			  } else {
				  out.write("{\"result\":\"failed\"}");
			  }
		}
	}

}
