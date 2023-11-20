package servlet.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import menu.Menu_menu_Bean;
import orders.Orders_Bean;
import orders.Orders_Mgr;


@WebServlet({"/admin/index/getMenuData", "/admin/index/getChartData"})
public class admin_index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setCharacterEncoding("UTF-8");
    	response.setContentType("application/json;charset=UTF-8");
    	
    	
    	String endPoint = request.getServletPath();
    	
    	if("/admin/index/getMenuData".equals(endPoint))
    	{
    		String type = (String)request.getParameter("type");
            Vector<Orders_Bean> order_list = null;
            
            if (type == null) {
            	type = "all";
            }
    		if (type.equals("all")) {
    		 order_list = new Orders_Mgr().getAllOrders();
    		}  else if (type.equals("day")) {
    		 order_list = new Orders_Mgr().getAllOrders();
    		}
    		String json = null;
    		 json = new Gson().toJson(order_list);
    		
    		response.getWriter().write(json);
    		
    	}
	}
}
