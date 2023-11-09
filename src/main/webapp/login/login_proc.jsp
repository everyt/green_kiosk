<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.Member_Mgr" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String cPath = request.getContextPath();
	Cookie[] cookies = request.getCookies();
%>
<jsp:useBean id="user" class="user.Member_Bean" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String usid = request.getParameter("mem_id");
	String uspw = request.getParameter("mem_pw");
	Member_Mgr Mgr = new Member_Mgr();
	Boolean result = Mgr.loginMember(usid, uspw);
	PrintWriter script = response.getWriter();
	if (result) {
		session.setAttribute("mem_id", usid);
		script.write("<script>");
		script.write("location.href = "+cPath+"/");
		script.write("</script>");
	} else {
		script.write("<script>");
		script.write("alert(\"아이디 혹은 비밀번호가 일치하지 않습니다.\");");
		script.write("history.back()");
		script.write("</script>");
	}
%>