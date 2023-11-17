<%@ include file="/admin/layouts/BeanManager.jsp" %>
<%@ page import="orders.Orders_Bean" %>
<%@ page import="orders.Orders_Mgr" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collection" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.reflect.TypeToken" %>

<%
Orders_Mgr mgr = new Orders_Mgr();
Vector<Orders_Bean> orders = mgr.getAllOrders();
Gson gson = new Gson();
List<List<Map<String, Object>>> all_foods = new ArrayList<List<Map<String, Object>>>();
List<String> keys = new ArrayList<String>();
List<String> values = new ArrayList<String>();
for (Orders_Bean order : orders) {
	List<Map<String, Object>> foods = gson.fromJson(order.getOrder_foods(), new TypeToken<List<Map<String,Object>>>(){}.getType());
	for(Map<String, Object> food : foods) {
		List<String> list = new ArrayList<String>(food.keySet());
		Collection<Object> value1 = food.values();

		for (String key: list) {
			keys.add("\""+key+"\"");
		}
		
		for (Object value : value1) {
			values.add("\""+String.valueOf(value)+"\"");
		}
		
	}
}
%>