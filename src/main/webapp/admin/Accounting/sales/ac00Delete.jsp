<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "orders.Orders_Mgr" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int order_no = 0;
		if (request.getParameter("order_no") != null) {
			order_no = Integer.parseInt(request.getParameter("order_no"));
		}
		boolean result = false; 
		Orders_Mgr orderMgr = new Orders_Mgr();
		result = orderMgr.deleteOrderByNo(order_no);
		if (result == true) {
			%>
			<script>
				
			</script>
	<%
		}
	%>
</body>
</html>