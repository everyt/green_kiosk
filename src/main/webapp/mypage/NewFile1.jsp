<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%@ page import="user.Member_Bean"%>
<jsp:useBean id="userMgr" class="user.Member_Mgr"/>
<jsp:useBean id="memberBean" class="user.Member_Bean"/>
<jsp:setProperty  name="memberBean" property="*"/>
<%
		//String mem_id = String.valueOf(session.getAttribute("find_pw_id"));
		String mem_id = request.getParameter("mem_id");
		System.out.println("unregi.jsp 에서 이동한 id = " + mem_id);
		memberBean.setMem_id(mem_id);
	  boolean result = userMgr.change_pw1(mem_id); 
	  if(result){
%>
<script type="text/javascript">
		alert("회원탈퇴 하였습니다.");
		location.href="/green_kiosk/index.jsp?";
</script>
<% } else { %>
<script type="text/javascript">
		alert("회원탈퇴에 실패 하였습니다.");
		history.back();
</script>
<% }
session.invalidate();
%>