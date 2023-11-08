<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="menu.Menu_order_Bean"%>
<jsp:useBean id="menuMgr" class="menu.Menu_order_Bean"/>
<%
	
	String cPath = request.getContextPath();
	String url1 = "../sales/ac00.jsp";
	String url2 = "../inventory/iv00.jsp";


    
%>

<html>
<head>
	<title>Head</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<table width="1280" cellpadding="0" cellspacing="0" >
		<tr>
			<td colspan="5">
	
			</td>
		</tr>
		<tr height="20" >
			<td colspan="5">&nbsp;</td>
		</tr>
		<tr>
			<td width="250">&nbsp;</td>
			<td><font size="3"><a href="<%=url1%>" target="content"><b>매출 관리 페이지</b></a></font></td>
			<td><font size="3"><a href="<%=url2%>" target="content"><b>재고 관리 페이지</b></a></font></td>
	
		</tr>
	</table>
</body>
</html>