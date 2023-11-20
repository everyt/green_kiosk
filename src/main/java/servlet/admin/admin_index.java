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

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet({"/admin/index/getMenuData", "/admin/index/getIndexInfo"})
public class admin_index extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    // 현재 날짜 가져오기
    LocalDate currentDate = LocalDate.now();

    // 이번 달의 시작일 계산
    LocalDate firstDayOfMonth = currentDate.withDayOfMonth(1);
    //이번 주의 시작일 계산
    LocalDate firstDayOfWeek = currentDate.with(DayOfWeek.MONDAY);

    // 이번 달의 마지막 날짜 계산
    LocalDate lastDayOfMonth = currentDate.withDayOfMonth(currentDate.lengthOfMonth());
    // 이번 주의 마지막 날짜 계산
    LocalDate lastDayOfWeek = currentDate.with(DayOfWeek.SUNDAY);

    // 날짜를 원하는 형식으로 출력 (예: "2023-11-01")
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    //이번 달
    String formattedFirstDay = firstDayOfMonth.format(formatter);
    String formattedLastDay = lastDayOfMonth.format(formatter);
    //이번 주
    String formattedFirstDayOfWeek = firstDayOfWeek.format(formatter);
    String formattedLastDayOfWeek = lastDayOfWeek.format(formatter);


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setCharacterEncoding("UTF-8");
    	response.setContentType("application/json;charset=UTF-8");
    	
    	
    	String endPoint = request.getServletPath();
    	
    	if("/admin/index/getMenuData".equals(endPoint))
    	{
    		String type = (String)request.getParameter("type");
    		String time = (String)request.getParameter("time");
    		System.out.println(type + time);
            Vector<Orders_Bean> order_list = null;
            
            if (type == null) {
            	type = "all";
            }
            //이번 달 주문 
    		if (type.equals("all")&&time.equals("month")) {
    		 order_list = new Orders_Mgr().getAllOrdersByTime(formattedFirstDay, formattedLastDay);
    		}
    		// 이번 주 주문
    		else if (type.equals("all")&&time.equals("week")) {
    		 order_list = new Orders_Mgr().getAllOrdersByTime(formattedFirstDayOfWeek, formattedLastDayOfWeek);
    		}
    		String json = null;
    		 json = new Gson().toJson(order_list);
    		
    		response.getWriter().write(json);
    		
    	} 
    	else if ("/admin/index/getIndexInfo".equals(endPoint)) 
    	{
    		String type = (String)request.getParameter("type");
    		Vector<Orders_Bean> order_list = null;
    		
    		if (type == null) {
    			type = "all";
    		}
    		if(type.equals("all")) {
    			order_list = new Orders_Mgr().getAllOrders();
    		}
    		
    		String json = null;
    		json = new Gson().toJson(order_list);
    		
    		response.getWriter().write(json); 
    	}
	}
}
