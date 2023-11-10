<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cookie.Cookie_Singleton" %>

<%
  Cookie[] cookies = request.getCookies();
  Cookie_Singleton cs = Cookie_Singleton.getInstance(); 
  cs.setCookieInfo("order", cookies);
  cs.deleteCookie(response);
%>