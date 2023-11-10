<%@page import="menu.Manager_Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"%>
<%@ page import="menu.Menu_component_Bean"%>
<jsp:useBean id="menuMgr" class="menu.Manager_Menu"/>
<%

	int totalRecord = 0; //전체레코드수
	int listSize = 0;    //현재 읽어온 자료의 수
	Vector<Menu_component_Bean> vlist = null;
	int numb = 0; 
    
    
    
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
		  let number = resultElement.innerText;
		  
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
	<table align="center" width="800" border="1">
		<tr>
			<td>재고 등록 목록 : <%=totalRecord%></td>
		</tr>
	</table>
	<table align="center" width="800" cellpadding="3" border="1">
		<tr>
			<td align="center" colspan="3">
			    <%     
			           vlist = menuMgr.getComponenctlist();
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
						<td>수량 설정</td>
						<td>수량 적용</td>
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
						<td align="center">
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
						<td align="center">
							<button onclick="count_apply(<%=component_no%>)" type="button">적용</button>
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