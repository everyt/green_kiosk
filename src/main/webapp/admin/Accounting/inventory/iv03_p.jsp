<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="menu.Menu_component_Bean"%>
<jsp:useBean id="menuMgr" class="menu.Manager_Menu"/>
<%
	
	int numb = Integer.parseInt(request.getParameter("component_no"));

    if(equals(numb)) {
    	menuMgr.deleteComponent(numb);
		String url = "iv00.jsp? numb=0";
		response.sendRedirect(url);
    } else {
%>
<script type="text/javascript">
	alert("입력하신 비밀번호가 아닙니다.");
	history.back();
</script>
<% } %>