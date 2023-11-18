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
<%@ page import = "java.time.LocalDate" %>
<%@ page import = "java.time.format.DateTimeFormatter" %>

<%
Orders_Mgr mgr = new Orders_Mgr();
/**일자별 판매량*/
Vector<Orders_Bean> orders = mgr.getAllOrdersByType(1);
Vector<Orders_Bean> orders2 = mgr.getAllOrdersByType(2);
Vector<Orders_Bean> orders3 = mgr.getAllOrdersByType(3);
Gson gson = new Gson();
List<List<Map<String, Object>>> all_foods = new ArrayList<List<Map<String, Object>>>();
List<List<Map<String, Object>>> all_foods2 = new ArrayList<List<Map<String, Object>>>();
List<List<Map<String, Object>>> all_foods3 = new ArrayList<List<Map<String, Object>>>();

List<String> keys = new ArrayList<String>();
List<String> values = new ArrayList<String>();

List<String> keys2 = new ArrayList<String>();
List<String> values2 = new ArrayList<String>();

List<String> keys3 = new ArrayList<String>();
List<String> values3 = new ArrayList<String>();

for (Orders_Bean order : orders) {
	List<Map<String, Object>> foods = gson.fromJson(order.getOrder_foods(), new TypeToken<List<Map<String,Object>>>(){}.getType());
	for(Map<String, Object> food : foods) {
		/**new*/
		for (Map.Entry<String, Object> entry : food.entrySet()) {
			keys.add("\"" + entry.getKey() + "\"");
			values.add("\"" + String.valueOf(entry.getValue()) + "\"");
		}

for (Orders_Bean order2 : orders2) {
    List<Map<String, Object>> foods2 = gson.fromJson(order2.getOrder_foods(), new TypeToken<List<Map<String,Object>>>(){}.getType());
    for(Map<String, Object> food2 : foods2) {
        /**new*/
        for (Map.Entry<String, Object> entry : food2.entrySet()) {
            keys2.add("\"" + entry.getKey() + "\"");
            values2.add("\"" + String.valueOf(entry.getValue()) + "\"");
        }
    }
}

for (Orders_Bean order3 : orders3) {
    List<Map<String, Object>> foods3 = gson.fromJson(order3.getOrder_foods(), new TypeToken<List<Map<String,Object>>>(){}.getType());
    for(Map<String, Object> food3 : foods3) {
        /**new*/
        for (Map.Entry<String, Object> entry : food3.entrySet()) {
            keys3.add("\"" + entry.getKey() + "\"");
            values3.add("\"" + String.valueOf(entry.getValue()) + "\"");
        }
    }
}
/** 		
		List<String> list = new ArrayList<String>(food.keySet());
		Collection<Object> value1 = food.values();

		for (String key: list) {
			keys.add("\""+key+"\"");
		}
		
		for (Object value : value1) {
			values.add("\""+String.valueOf(value)+"\"");
		}
		 */
	}
}
/**월 별 판매량
Map<String, List<Orders_Bean>> monthlySales = new HashMap<>();
Map<String, List<List<Map<String, Object>>>> monthlySalesFoods = new HashMap<>();

int currentYear = LocalDate.now().getYear(); //현재 년도

for (int month = 1; month <= 12; month++) {
    String startDate = currentYear + "-" + String.format("%02d", month) + "-01";
    String endDate = currentYear + "-" + String.format("%02d", month) + "-31";
	
    Vector<Orders_Bean> orders2 = mgr.getAllOrdersByTime(startDate, endDate);
    monthlySales.put(String.format("%02d", month), orders2);
    List<List<Map<String, Object>>> all_foods2 = new ArrayList<List<Map<String, Object>>>();
    List <String> keys2 = new ArrayList<String>();
    List <String> values2 = new ArrayList<String>();
    
    for (Orders_Bean order2 : orders) {
    	List<Map<String, Object>> foods2 = gson.fromJson(order2.getOrder_foods(), new TypeToken<List<Map<String ,Object>>>(){}.getType());
    	for (Map<String, Object> food2 : foods2) {
    		for (Map.Entry<String, Object> entry : food2.entrySet()){
    			keys2.add("\"" + entry.getKey() + "\"");
    			values2.add("\"" + String.valueOf(entry.getValue()) + "\"");
    		}
    	}
    }
    monthlySalesFoods.put(String.format("%02", month), all_foods2);
   
} 
*/	
%>