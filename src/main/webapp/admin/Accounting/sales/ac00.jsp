<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"%>
<%@ page import="orders.Orders_Bean"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<jsp:useBean id="menuMgr" class="menu.Manager_Menu"/>
<%
     //전체레코드수
    int listSize = 0;    //현재 읽어온 자료의 수
	Vector<Orders_Bean> vlist = null;
	int numb = 0;
	   vlist = menuMgr.getMgrorderList();

%>
<!DOCTYPE html>
<html>
<head>
	<title>코드관리</title>
	<link href="../main/style.css" rel="stylesheet" type="text/css" >


</head>
<body leftmargin="0" topmargin="0">

<div align="center">
    <br/>
		<h2>매장 관리 페이지</h2>
    <br>
	<table align="center" width="800" border="1">
		<tr>
			<td>코드 등록 자료수 : <%=vlist.size()%></td>
		</tr>
	</table>
	<table align="center" width="800" cellpadding="3" border="1">
		<tr>
			<td align="center" colspan="3">
			 <%     
			          
			           listSize = vlist.size();
               	       if (vlist.isEmpty()) {
               	    	   out.println("등록된 목록이 없습니다.");
               	    	   
               	       } else {
               	 %>
		
				  <table width="100%" cellpadding="2" cellspacing="0" border="1">
					<tr align="center" bgcolor="#D0D0D0" height="120%">
						<td>번호</td>
						<td>판매 일시</td>
						<td>판매 내역</td>
						<td>판매 금액</td>
						<td>할인</td>
						<td>쿠폰</td>
						<td>결제 방식</td>
						<td>마일리지</td>
						<td>주문 현황</td>
					
						<td>출 력</td>
						<td>삭 제</td>
					</tr>
					<%
						  for (int i = 0;i<listSize; i++) {
							  Orders_Bean bean  = vlist.get(i);
							int order_no = bean.getOrder_no();
							Timestamp order_time = bean.getOrder_time();
							List<Map<String, Object>> order_foods = bean.getOrder_foods();
							int order_price = bean.getOrder_price();
							int order_discount = bean.getOrder_discount();
							String order_coupon = bean.getOrder_coupon();
							String order_type = bean.getOrder_type();
							Boolean order_add_mile = bean.isOrder_add_mile();
							Boolean order_is_maked = bean.isOrder_is_maked();
							
							
					%>
					<tr>
						<td align="center">
 						   	   <%=order_no%>
						</td>
						<td align="center">
 						   <%=order_time%>
						</td>
						<td align="center">
 						   <%=order_foods%>
						</td>
						<td align="center">
 						   <%=order_price%>
						</td>
						<td align="center">
 						   <%=order_discount%>
						</td>
						<td align="center">
 						   <%=order_coupon%>
						</td>
						<td align="center">
 						   <%=order_type%>
						</td>
						<td align="center">
 						   <%=order_add_mile%>
						</td>
						<td align="center">
 						   <%=order_is_maked%>
						</td>
						
					</tr>
			<%}//for%>
				</table> <%
				}//if
				%> 
			</td>
		</tr>
		</table>

</div>
</body>
</html>