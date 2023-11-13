<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자(메뉴)</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/admin/Accounting/account.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/admin/menu.css">
<%@ include file="/admin/layouts/indexBase.jsp" %>
<%@ include file="/admin/layouts/bootstrap.jsp"%> 
<%@ include file="/admin/admin_check/check.jsp" %>
<%@ include file="/admin/layouts/header.jsp" %>

</head>
<body>
<%@ include file="/admin/layouts/left.jsp" %>
<main class="mainContent" id="mainContent">
</main> 

</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/admin/menu_index.js"></script>
</html>

