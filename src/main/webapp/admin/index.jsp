<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>관리자 페이지</title>
<%@ include file="/admin/layouts/indexBase.jsp" %>
<%@ include file="/admin/layouts/header.jsp" %>
<%@ include file="/admin/admin_check/check.jsp" %>
</head>

<body>
<br/>
	<div class="layout_left">
		<%@ include file="/admin/layouts/left.jsp" %>
	</div>
	<div class="layout_main">
		<%@ include file="/admin/layouts/main.jsp" %>
	</div>
	<br/>
	
<%-- 	<div class="layout_footer">
		<%@ include file="/admin/layouts/footer.jsp" %>
	</div> --%>
	
</body>
</html>