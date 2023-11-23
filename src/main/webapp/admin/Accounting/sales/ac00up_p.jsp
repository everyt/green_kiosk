<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "orders.Orders_Mgr" %>
<%@ page import = "orders.Orders_Bean" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import= "java.text.SimpleDateFormat"%>
<%@ page import= "java.util.Date"%>
<jsp:useBean id="updateOrder1Bean" class="orders.Orders_Bean"/>
<jsp:useBean id="ordersMgr" class="orders.Orders_Mgr"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String order_no = request.getParameter("order_no");
String req_order_price = request.getParameter("order_price");
String dateString = request.getParameter("order_time");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date date = sdf.parse(dateString);
Timestamp timestamp = new Timestamp(date.getTime());
updateOrder1Bean.setOrder_price(Long.parseLong(req_order_price));
updateOrder1Bean.setOrder_time(timestamp);
updateOrder1Bean.setOrder_no(Integer.parseInt(order_no));
updateOrder1Bean.setOrder_foods(request.getParameter("order_foods"));
updateOrder1Bean.setOrder_coupon(request.getParameter("order_coupon"));
updateOrder1Bean.setOrder_type(request.getParameter("order_type"));
	  boolean result = ordersMgr.updateOrder1(updateOrder1Bean);
	  if(result){
%>
<script type="text/javascript">
		alert("코드정보 수정 하였습니다.");
		opener.loadContent('sales/ac00.jsp');opener.updateMenu('all')
		self.close();
</script>
<% } else {%>
<script type="text/javascript">
		alert("코드정보 수정에 실패 하였습니다.");
		self.close();
</script>
<% } %>