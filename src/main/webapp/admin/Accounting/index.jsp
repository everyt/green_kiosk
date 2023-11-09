<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String cPath = request.getContextPath();
String url1 = "../Accounting/sales/ac00.jsp";
String url2 = "../Accounting/inventory/iv00.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<html>
<body>
<table width="1280" cellpadding="0" cellspacing="0" >
		<tr>
			<td width="250">&nbsp;</td>
			<td><input type="button" value="매출 관리 페이지"  onClick="loadContent('Accounting/sales/ac00.jsp')"></td>
			<td><input type="button" value="재고 관리 페이지" onClick="loadContent('Accounting/inventory/iv00.jsp')"></td>
	    </tr>
	</table>
</body>
</html>

