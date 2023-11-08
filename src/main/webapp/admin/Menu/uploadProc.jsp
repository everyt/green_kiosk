<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="menu.Manager_Menu" %>
<%@ page import="menu.Menu_menu_Bean" %>
<%@ page import="menu.Menu_component_Bean" %>
<jsp:useBean id="mMgr" class="menu.Manager_Menu" scope="page"/>
<jsp:setProperty name="mBean" property="bbsTitle" />
<jsp:setProperty name="mBean" property="map" />
<jsp:setProperty name="mBean" property="bbsContent" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu_uploadProcess</title>
</head>
<body>

</body>
</html>