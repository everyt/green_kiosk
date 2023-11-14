<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file = "/admin/layouts/BeanManager.jsp" %>
<%@ include file="/admin/admin_check/check.jsp" %>
<title>메뉴 삭제</title>
</head>
<body>
<%@ page import="java.net.URLDecoder" %>

	<%
	    String menuType = "";
	    if (request.getCookies() != null) {
	        for (javax.servlet.http.Cookie cookie : request.getCookies()) {
	            if (cookie.getName().equals("menuType")) {
	                menuType = URLDecoder.decode(cookie.getValue(), "UTF-8");
	                break;
	            }
	        }
	    }
	%>
<%
	int component_no = Integer.parseInt(request.getParameter("component_no"));
	int result = menuMgr.deleteComponent(component_no);   
	PrintWriter script = response.getWriter();
	if (result != 1)
	{
		script.println("<script>");
		script.println("alert('올바른 접근이 아닙니다!')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		script.println("<script>");
        %>
       	<script>
       		window.opener.updateMenu('<%=menuType%>');
       	</script>
        <%
 		script.println("window.close();");
		script.println("</script>");
	}
%>

</body>
</html>