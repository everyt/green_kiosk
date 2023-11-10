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
	function iv02(numb){
		document.readFrm.numb.value=numb;
		document.readFrm.action="iv02.jsp";
		document.readFrm.target="content";
		document.readFrm.submit();
	}

	function iv03(numb){
		document.readFrm.numb.value=numb;
		document.readFrm.action="iv03.jsp";
		document.readFrm.target="content";
		document.readFrm.submit();
	}
</script>

</head>
<body leftmargin="0" topmargin="0">

<div align="center">
    <br/>
		<h2>재고 관리 페이지</h2>
		<input type="button" value="재료 등록" onClick="loadContent('inventory/iv01.jsp')"> &nbsp; &nbsp;
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
						<td>삭 제</td>
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
						<td align="center">
 						   <%=component_amount%>
						</td>
						<td align="center">
 						   <%=component_imgPath%>
						</td>
						<td align="center">
						   <a onClick="loadContent('inventory/iv02.jsp')" href="javascript:('<%=numb%>')">수정</a>
						</td>
						<td align="center">
						   <a onClick="loadContent('inventory/iv01.jsp')" href="javascript:">삭제</a>
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