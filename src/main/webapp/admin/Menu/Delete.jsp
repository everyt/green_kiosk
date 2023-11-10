<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file = "/admin/layouts/BeanManager.jsp" %>
<title>메뉴 삭제</title>
</head>
<body>
<%
	int menu_no = Integer.parseInt(request.getParameter("menu_no"));
	int result = menuMgr.deleteMenu(menu_no); 
	PrintWriter script = response.getWriter();
	if (result != 1)
	{
		script.println("<script>");
		script.println("alert('올바른 접근이 아닙니다!')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		script.println("<script>");
		script.println("window.opener.location.reload();");
		script.println("window.close();");
		script.println("</script>");
	}
%>

</body>
</html>