<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.Member_Mgr" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.Member_Bean" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	System.out.println(request.getParameter("mem_id"));
	Member_Mgr Mgr = new Member_Mgr();
	
	System.out.println(user.getMem_id());
%>