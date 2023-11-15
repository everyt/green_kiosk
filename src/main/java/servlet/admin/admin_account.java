package servlet.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import menu.Manager_Menu;
import menu.Menu_component_Bean;
import menu.Menu_menu_Bean;


@WebServlet({"/admin/account/getMenuData"})
public class admin_account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setCharacterEncoding("UTF-8");
    	response.setContentType("application/json;charset=UTF-8");
    	
    	
    	String endPoint = request.getServletPath();
    	
    	if("/admin/Event/getMenuData".equals(endPoint))
    	{
    		String type = (String)request.getParameter("type");
 
            Vector<Menu_menu_Bean> menu_list = null;
            Vector <Menu_component_Bean> component_list = null;
            if (type == null) {
            	type = "onSale";
            }
            if(type.equals("onSale")) {
    		 menu_list = new Manager_Menu().getMenuList(5);
    		} else if (type.equals("component")) {
    		 component_list = new Manager_Menu().getComponentList(0);  
    		}
    		String json = null;
    		if (!type.equals("component")) {
    		 json = new Gson().toJson(menu_list);
    		} else {
    		 json = new Gson().toJson(component_list);
    		}
    		response.getWriter().write(json);
    	} 
	}
}
