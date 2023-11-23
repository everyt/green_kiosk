<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Vector"%>
<%@ page import="orders.Orders_Bean"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.reflect.TypeToken" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>매장 관리 페이지</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/admin/coupon.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/admin/Accounting/account.css" />
<!-- 스크립트 리팩토링! -->
<script src="<%=request.getContextPath() %>/assets/js/admin/menu_main_1.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/admin/account/account.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script>
     Orders_Bean bean = new Orders_Bean();

   String orders_foods = request.getParameter("orders_foods");
   Bean.setOrder_foods(request.getParameter("order_foods"))
	
	

</script>
<%@ include file="/admin/layouts/indexBase.jsp" %>
<%@ include file="/admin/layouts/header.jsp" %>
<%@ include file="/admin/admin_check/check.jsp" %>

<!-- 스타일 리팩토링! -->
<style>
table {
  border-collapse: collapse;
  width:90%;
}

tr, td {
	border-width:1px
}

.mainContent div h2 {    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    align-self: center;}
 
.text-over-cut {
  display: block;
  width: 200px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  margin: 0;
}
</style>
<!-- 스타일 리팩토링! -->

<jsp:useBean id="menuMgr" class="menu.Manager_Menu"/>


	

     </head>
<%


	
int AllPrice = 0;


	int listSize = 0;    //현재 읽어온 자료의 수
	Vector<Orders_Bean> vlist = null;
	int numb = 0; 
   
   vlist = menuMgr.getMgrorderList();
   

	
%>

<body leftmargin="0" topmargin="0">

	<div class="layout_left">
		<%@ include file="/admin/layouts/left.jsp" %>
	</div>
<div class="mainContent" id="mainContent">
<div style="align-content: center; display: flex; flex-direction: column; flex-wrap: wrap;">
    <br/>
		<h2>매장 관리 페이지</h2>
    <br>
			 <%     
			          
			           listSize = vlist.size();
               	       if (vlist.isEmpty()) {
               	    	   out.println("등록된 목록이 없습니다.");
               	    	   
               	       } else {
              %>
		
				  <table border="1">
				  <thead>
				  
				  </thead>
				  <tbody class="getMenuList" id="getMenuList">
				  <tr align="center">
						<th colspan="11" >코드 등록 자료수 : <%=listSize%></th>
					</tr>
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
						<td>수정</td>
						<td>삭제</td>
					</tr>
				</tbody>
				<%
				    for( int i = 0; i<listSize; i++) {
				    	if (i == listSize)break;
				    	Orders_Bean bean = vlist.get(i);
				    	int order_no = bean.getOrder_no();
				    	Timestamp order_time = bean.getOrder_time();
				    	String order_foods = bean.getOrder_foods();
				    	long order_price = bean.getOrder_price();
				    	long order_discount = bean.getOrder_discount();
				    	String order_coupon = bean.getOrder_coupon();
				    	String order_type = bean.getOrder_type();
				    	boolean order_use_mile = bean.isOrder_use_mile();
				        boolean order_is_maked = bean.isOrder_is_maked();
				    	
				        if (i < 10) {
				        
				    %>
				    <tr>
						<td align="center">
 						   <%=order_no%>
						</td>
						<td align="center">
 						   <%=order_time%>
						</td>
						<td align="center">
						<div class="text-over-cut">
						 <%=order_foods%>
						</div>
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
 						   <%=order_use_mile%>
						</td>
						<td align="center">
 						   <%=order_is_maked%>
						</td>
							<td align="center">
						   <input type="button" value="수정" onClick="loadContent('sales/ac00up.jsp?numb=<%=order_no%>');" >
						</td>
							<td align="center">
						   <input type="button" value="삭제" onClick="loadContent('sales/ac00Delete.jsp?numb=<%=order_no%>')">
						</td>
					</tr>
				    <tr>
				    
              </tr>
				<%} else {}
				        }//for%>
				<%
				}//if
				%> 
		
		<tr>
		 <td colspan="2"><br /><br /></td>
		 </tr>
		 <tr>
	
		</table>
	</div>
</div>

<script>
	function deleteOrder(order_no)
	{
		location.href = "ac00Delete.jsp?order_no=" + order_no; 
	}
	
	function updateOrder1(updateOrder1Bean)
	{
		location.href = "ac00up.jsp?order_no=" + order_no; 
	}
	

	
	
</script>
</body>
</html>