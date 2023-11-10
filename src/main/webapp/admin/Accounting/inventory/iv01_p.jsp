<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%  request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="menuMgr" class="menu.Manager_Menu"/>
<jsp:useBean id="componentBean" class="menu.Menu_component_Bean"/>
<jsp:setProperty  name="componentBean" property="*"/>
<%
	boolean result = menuMgr.insertComponent(componentBean);
	if(result) {
		
%>
<script type="text/javascript">
	alert("재료를 입고 하였습니다.");
	location.href="iv00.jsp";
</script>
<% } else { %>
<script type="text/javascript">
	alert("재료 입고에 실패 하였습니다.");
	history.back();
</script>
<% } %>