<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="orders.Orders_Bean" %>
<%@ page import ="orders.Orders_Mgr" %>
<%@ page import = "java.util.Vector" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file = "/admin/layouts/bootstrap.jsp" %>
<title>이번 달 매출</title>
</head>
<body>
		<h1><%=request.getParameter("term") %></h1>
		<%
		if (!request.getParameter("term").isEmpty()) {
			Orders_Mgr mgr = new Orders_Mgr();
			Vector<Orders_Bean> vlist = mgr.getAllOrders(); 
			int vlistSize = vlist.size();

	        
			for (Orders_Bean bean : vlist) {
				int order_no = bean.getOrder_no();
		        Timestamp timestamp = bean.getOrder_time();
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		        String order_time = dateFormat.format(new Date(timestamp.getTime()));
				String order_foods = bean.getOrder_foods();
				long order_price = bean.getOrder_price();
				long order_discount = bean.getOrder_discount();
				String order_coupon = bean.getOrder_coupon();
				String order_type = bean.getOrder_type();
				
				
			}
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('올바르지 않은 요청입니다.')");
			script.println("window.close()");
			script.println("</script>");
		}
		
		%>
</body>
</html>