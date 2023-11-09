<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String name1 = request.getParameter("name");
	String phone1 = request.getParameter("phone");
	
	System.out.println(name1);
	System.out.println(phone1);

%>
</body>
</html>