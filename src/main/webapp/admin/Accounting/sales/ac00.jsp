<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"%>
<%@ page import="orders.Orders_Bean"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.reflect.TypeToken" %>



<jsp:useBean id="menuMgr" class="menu.Manager_Menu"/>

<%


	
int AllPrice = 0;


	int listSize = 0;    //현재 읽어온 자료의 수
	Vector<Orders_Bean> vlist = null;
	int numb = 0; 
   
   vlist = menuMgr.getMgrorderList();
   

	
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
	<title>코드관리</title>

<link rel="stylesheet" href="/post_inc/datatables/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script>
     Orders_Bean bean = new Orders_Bean();

   String orders_foods = request.getParameter("orders_foods");
   Bean.setOrder_foods(request.getParameter("order_foods"))
	
	

</script>

<style>
table {
  border-collapse: collapse;
  width:90%;
}
 
.text-over-cut {
  display: block;
  width: 200px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  margin: 0;
}
</style>
	

     </head>
<body leftmargin="0" topmargin="0">

<div align="center">
    <br/>
		<h2>매장 관리 페이지</h2>
    <br>
			 <%     
			          
			           listSize = vlist.size();
               	       if (vlist.isEmpty()) {
               	    	   out.println("등록된 목록이 없습니다.");
               	    	   
               	       } else {
              %>
		
				  <table  border="1">
				  <thead>
				  <tr>
			<th colspan="11">코드 등록 자료수 : <%=listSize%></th>
		</tr>
				  </thead>
				  <tbody class="getMenuList" id="getMenuList">
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
				    	int count = 0;
				        if (i < 10) {
				        
				    %>

				    <tr>
						<td align="center">
 						   <%=order_no%>
						</td>
						<td align="center">
 						   <%=String.valueOf(order_time).substring(0, String.valueOf(order_time).length()-2)%>
						</td>

						<% 
						
						Gson gson = new Gson();
						
							List<Map<String, Object>> parsedData = gson.fromJson(order_foods, new TypeToken<List<Map<String, Object>>>() {}.getType());
							
							Map<String, Integer> menuMap = new HashMap<>();
							String productInfo = "";
							
							for (Map<String, Object> order : parsedData ) {
								for (Map.Entry<String, Object> entry : order.entrySet()){
									String menuName = entry.getKey();
							        Object value = entry.getValue();
							        if ("name".equals(menuName)) {
										productInfo += value + " X ";
							        } else if ("amount".equals(menuName)) {
										productInfo += value + "개, ";
							        }
									
								}
							}
						
							productInfo = productInfo.replaceAll(", $", "");
							System.out.println(productInfo);
 						%>
 						<td align="center" >
							<input class="ac00foods" id="ac00foods" value='<%=productInfo%>'>
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
				        }//for
				        
				        
				        
				       %>
				 
				<%
				}//if
				%> 
		
		<tr>
		 <td colspan="2"><br /><br /></td>
		 </tr>
		 <tr>
	
		</table>

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