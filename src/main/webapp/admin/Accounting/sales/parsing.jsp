<%-- <%@ include file="/admin/layouts/BeanManager.jsp" %>
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
<%@ page import = "java.time.LocalDate" %>
<%@ page import = "java.time.format.DateTimeFormatter" %>

<%
Gson gson = new Gson();
List<List<Map<String, Object>>> all_foods = new ArrayList<List<Map<String, Object>>>();


List<String> keys = new ArrayList<String>();
List<String> values = new ArrayList<String>();


for (Orders_Bean order : orders) {
	List<Map<String, Object>> foods = gson.fromJson(order.getOrder_foods(), new TypeToken<List<Map<String,Object>>>(){}.getType());
	for(Map<String, Object> food : foods) {
		/**new*/
		for (Map.Entry<String, Object> entry : food.entrySet()) {
			keys.add("\"" + entry.getKey() + "\"");
			values.add("\"" + String.valueOf(entry.getValue()) + "\"");
		}

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
Map<String, List<Orders_Bean>> monthlySales = new HashMap<>();
Map<String, List<List<Map<String, Object>>>> monthlySalesFoods = new HashMap<>();

    monthlySalesFoods.put(String.format("%02", month), all_foods2);
    }

%> --%>