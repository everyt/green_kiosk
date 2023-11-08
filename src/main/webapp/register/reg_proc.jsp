<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.Member_Mgr" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	Member_Mgr Mgr = new Member_Mgr();
	String mem_id = request.getParameter("mem_id");
	String mem_pw = request.getParameter("mem_pw");
	String mem_name = request.getParameter("mem_name");
	String mem_phone = request.getParameter("mem_phone");
	
	String result = Mgr.register_Member(mem_id, mem_pw, mem_name, mem_phone);
	
	PrintWriter script = response.getWriter();
	
	if (result == "200/회원가입에 성공했습니다.") {
		script.write("<script>");
		script.write("alert(\"회원가입에 성공했습니다.\\n가입한 아이디로 로그인해주세요.\");");
		script.write("self.close();");
		script.write("</script>");
	} else {
		String reason = result.split("/")[1];
		script.write("<script>");
		script.write("alert(\"회원가입에 실패했습니다.\\n원인 : "+reason+"\");");
		script.write("history.back();");
		script.write("</script>");
	}
%>