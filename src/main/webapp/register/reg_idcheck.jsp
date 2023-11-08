<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.Member_Mgr" %>
<%
	Member_Mgr Mgr = new Member_Mgr();
	String usid = request.getParameter("usid");
	boolean result = Mgr.checkId(usid);
%>
<html>
<head>
	<title>ID 중복체크</title>
	<link href="../main/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br /> <b><%=usid%></b>
		<%
			if (result) {
				out.println("는 이미 사용중인 아이디 입니다.<p>");
			} else {
				out.println("는 사용가능한 아이디 입니다.<p>");
			}
		%>
		<a href="#" onClick="self.close()">닫기</a>
	</div>
</body>
</html>