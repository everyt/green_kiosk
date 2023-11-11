<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="user.Member_Mgr" %>
<%@ page import="user.Member_Bean" %>
<%@ page import="java.lang.String" %>
<%@ page import="java.io.PrintWriter" %>
<script>
	let beforeurl = document.referrer;
	if (beforeurl.includes("green_kiosk") == false) {
		self.close();
	}
</script>
<%
	String cPath = request.getContextPath();

	Object mem_id = session.getAttribute("mem_id");
	Member_Mgr u_mgr = new Member_Mgr();
	Member_Bean bean = null;
	String mem_pw = null;
	
	boolean find_pw = false;
	
	Cookie[] cookies = request.getCookies();
	if (cookies.length == 0) {
		System.out.println("쿠키 없음");
	} else {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("mem_pw")) {
				mem_pw = cookie.getValue();
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				find_pw = true;
			}
		}
	}
	
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
	
	if (find_pw == false) {
		session.invalidate();
		%>
			<script>
				alert("로그인을 올바르게 진행하지 않은 아이디로 의심됩니다.\n자동으로 로그아웃 되오니,\n다시 로그인을 하고 사용해주시기 바랍니다.");
				location.href = "<%=cPath%>/"
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
		session.setAttribute("pw_ok", "true");
		session.setAttribute("failed_count", 0);
		%>
			<script>
				if (beforeurl.includes("/mypage/personal")){
					location.href = "<%=cPath%>/mypage/personal"
				}
			</script>
		<%
	} else {
		session.setAttribute("pw_ok", "false");
		%>
			<script>
				if (beforeurl.includes("/mypage/personal")){
					location.href = "<%=cPath%>/mypage/personal"
				}
			</script>
		<%
	}
%>