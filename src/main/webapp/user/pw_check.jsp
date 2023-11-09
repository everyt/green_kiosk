<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="user.Member_Mgr" %>
<%@ page import="user.Member_Bean" %>
<%@ page import="java.lang.String" %>
<%@ page import="java.io.PrintWriter" %>
<script>
	let beforeurl = document.referrer;
	if (beforeurl.contains("green_kiosk") == false) {
		self.close();
	}
</script>
<%
	String cPath = request.getContextPath();

	Object mem_id = session.getAttribute("mem_id");
	Member_Mgr u_mgr = new Member_Mgr();
	Member_Bean bean = null;
	String mem_pw = request.getParameter("mem_pw");;
	String mem_ac = "user";
	if (mem_id == null) {
		%>
			<script>
				beforeurl = document.referrer;
				if (beforeurl.contains("green_kiosk") == false) {
					self.close();
				} else {
					alert("잘못된 접근입니다.");
					history.back();
				}
				
			</script>
		<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	Member_Mgr Mgr = new Member_Mgr();
	
	boolean result = Mgr.loginMember(String.valueOf(mem_id), mem_pw);
	
	PrintWriter script = response.getWriter();
	
	if (result) {
		%>
			<script>
				opener.document.getElementById("pw_res").attributes.correct.value = "true";
				self.close();
			</script>
		<%
	} else {
		%>
		<script>
			opener.document.getElementById("pw_res").attributes.correct.value = "false";
			self.close();
		</script>
	<%
	}
%>