<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%@ page import="user.Member_Bean"%>
<jsp:useBean id="userMgr" class="user.Member_Mgr"/>
<jsp:useBean id="memberBean" class="user.Member_Bean"/>
<jsp:setProperty  name="memberBean" property="*"/>
<%
   String mem_pw = request.getParameter("mem_pw");
   System.out.println(mem_pw); 
 
//String mem_id = String.valueOf(session.getAttribute("find_pw_id"));
		String mem_id = request.getParameter("mem_id");
		System.out.println("unregi.jsp 에서 이동한 id = " + mem_id);
/* 		memberBean.setMem_id(mem_id);
 */	  boolean result = userMgr.delete_pw1(mem_id,mem_pw);  
	  if(result){
%>
<script type="text/javascript">
		alert("회원탈퇴가 완료되었습니다.");
		location.href="/green_kiosk/index.jsp?";
</script>
<% } else { %>
<script type="text/javascript">
		alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
		history.back();
</script>
			
<% }
session.invalidate();
%>