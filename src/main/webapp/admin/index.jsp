<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/admin/coupon.css">
<script type="text/script" src="<%=cPath%>/assets/js/admin/menu_main_1.js"></script>
<%@ include file="/admin/layouts/indexBase.jsp" %>
<%@ include file="/admin/layouts/header.jsp" %>
<%@ include file="/admin/admin_check/check.jsp" %>

</head>

<body>
<br/>
	<div class="layout_left">
		<%@ include file="/admin/layouts/left.jsp" %>
	</div>
	<div class="mainContent" id="mainContent">
		<%@ include file="/admin/layouts/index/index_main.jsp" %>
	</div>
	<br/>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/admin/index_index.js"></script>
</html>