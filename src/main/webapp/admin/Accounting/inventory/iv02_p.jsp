<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="menu.Menu_component_Bean"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="menuMgr" class="menu.Manager_Menu"/>
<jsp:useBean id="componentBean" class="menu.Menu_component_Bean"/>
<jsp:setProperty  name="componentBean" property="*"/>
<script>
window.resizeTo( 300, 200 )
</script>
<%
	  boolean result = menuMgr.updateComponent(componentBean);
	  if(result){
%>
<script type="text/javascript">
		opener.loadContent('inventory/iv00.jsp');
		self.close();
</script>
<% } else {%>
<script type="text/javascript">
		alert("코드정보 수정에 실패 하였습니다.");
		self.close();
</script>
<% } %>