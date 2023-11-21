<%@page import="menu.Manager_Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="menu.Menu_component_Bean"%>
<%@ page import="java.text.DecimalFormat"%>



<jsp:useBean id="menuMgr" class="menu.Manager_Menu"/>
<%

    int AllPrice = 0;
    

	int listSize = 0;    //현재 읽어온 자료의 수
	Vector<Menu_component_Bean> vlist = null;
	int numb = 0; 
    
    vlist = menuMgr.getComponenctlist();
    DecimalFormat date_format = new DecimalFormat("###,###");
    String result = "";
    String result1 = "";
 
%>



<!DOCTYPE html>
<html>
<head>

	<title>코드관리</title>
	<link href="../main/style.css" rel="stylesheet" type="text/css" >
	
<script type="text/javascript">

	function count()  {
		  // 결과를 표시할 element
		  const resultElement = document.getElementById('result');
		  
		  // 현재 화면에 표시된 값
		  let number = resultElement.inne1r2r3rrText;
		  
		  // 더하기/빼기
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		  }else if(type === 'minus')  {
		    number = parseInt(number) - 1;
		  }
</script>

</head>
<body leftmargin="0" topmargin="0">

<div align="center">
    <br/>
		<h2>재고 관리 페이지</h2>
	<br>
	<table align="center" cellpadding="3" width="800" border="1">
		<tr>
			<td>재고 등록 목록 : <%=vlist.size()%></td>
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
						<td>재료 이름</td>
						<td>재료 가격</td>
						<td>재료 수량</td>
						<td>이미지 경로</td>
						<td>수 정</td>
						<td>설 정</td>
						<td>총 액</td>
					</tr>  	   
			          <% 
			          
						  for (int i = 0;i<listSize; i++) {
							Menu_component_Bean bean  = vlist.get(i);
							int component_no = bean.getComponent_no();
							String component_name = bean.getComponent_name();
							int component_price = bean.getComponent_price();
							int component_amount = bean.getComponent_amount();
							String component_imgPath = bean.getComponent_imgPath();
					  %>
					<tr>
						<td align="center">
 						   <%=component_no%>
						</td>
						<td align="center">
 						   <%=component_name%>
						</td>
						<td align="center" id="price<%=component_no%>">
 						   <%=component_price%>
						</td>
						<td align="center" id="amount<%=component_no%>">
 						   <%=component_amount%>
						</td>
						<td align="center">
 						   <%=component_imgPath%>
						</td>
						<td align="center">
						   <a onClick="loadContent('inventory/iv02.jsp?numb=<%=component_no%>')" href="javascript:">수정</a>
						</td>
						<td align="center">
						   <input type='button'
							       onclick='count("plus",<%=component_no%>)'
							       value='+'/>
							<input type='button'
							       onclick='count("minus",<%=component_no%>)'
							       value='-'/>
						</td>
						<%
						int price = bean.getComponent_price();
						int amount = bean.getComponent_amount();
						int TotalPrice;
						    TotalPrice = (price*amount);
						
						    AllPrice = AllPrice + TotalPrice;
						    result = date_format.format((long)AllPrice);
						    result1 = date_format.format((long)TotalPrice);
				
						
					
						
						%>
						<td align="center" name="total" id="total<%=component_no%>">
 						   <%=result1%>원
						</td>
					</tr>
					<%}//for%>
				</table> <%
				}//if
				%> 
     <table align="center" width="800" border="1">
   
		<tr>
			<td align="center" id="allprice">
			 재고 총 금액 : <%=result%>원</td>
		</tr>
	</table>
			 </td>
		   </tr>
		 </table>
        </div>
    </body>
</html>