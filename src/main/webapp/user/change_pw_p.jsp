<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%@ page import="user.Member_Bean"%>
<jsp:useBean id="userMgr" class="user.Member_Mgr"/>
<jsp:useBean id="memberBean" class="user.Member_Bean"/>
<jsp:setProperty  name="memberBean" property="*"/>
<%
	  boolean result = userMgr.updateMember1(memberBean);
	  if(result){
%>
<script type="text/javascript">
		alert("회원정보 수정 하였습니다.");
		location.href="h00.jsp?numb=0";
</script>
<% } else { %>
<script type="text/javascript">
		alert("회원정보 수정에 실패 하였습니다.");
		history.back();
</script>
<% } %>