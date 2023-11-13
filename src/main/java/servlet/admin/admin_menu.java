package servlet.admin;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import menu.Manager_Menu;
import menu.Menu_menu_Bean;


@WebServlet("/getMenuData")
public class admin_menu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setCharacterEncoding("UTF-8");
    	response.setContentType("application/json;charset=UTF-8");
    	
    	
    	String endPoint = request.getServletPath();
    	
    	if("/getMenuData".equals(endPoint))
    	{
    		String type = null;
    		if (request.getParameter("type") != null) {
    			type = request.getParameter("type");
    		}
            Vector<Menu_menu_Bean> menu_list = null;
            
    		if (type.equals("all")) {
    		 menu_list = new Manager_Menu().getMenuList(0);
    		} else if (type.equals("single")) {
        	 menu_list = new Manager_Menu().getMenuList(1);
    		} else if (type.equals("drink")) {
        	 menu_list = new Manager_Menu().getMenuList(3);
    		}
    		String json = new Gson().toJson(menu_list);
    		response.getWriter().write(json);
    	}
	}
}
