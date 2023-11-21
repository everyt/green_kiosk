<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "orders.Orders_Mgr" %>
<jsp:useBean id="ordersMgr" class="orders.Orders_Mgr"/>
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
	
			  boolean result = ordersMgr.deleteOrderByNo(order_no);
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