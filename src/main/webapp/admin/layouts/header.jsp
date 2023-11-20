<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ include file="bootstrap.jsp" %>
<%@ include file="header/user.html" %>
<div id="wrapper">
	<div id="header">
	<a href="'<%=request.getContextPath()%>/admin/index.jsp')"></a>
		<div class="w3-top">
			<div class="w3-bar w3-theme w3-top w3-left-align w3-large">
		    	<a class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white w3-large w3-theme-l1" href="<%=request.getContextPath()%>/admin/index.jsp"><i class="fa fa-bars"></i></a>
		    	<a href="<%=request.getContextPath() %>/admin/" class="w3-bar-item w3-button w3-theme-l1">Home</a>
<%-- 		    	<a href="javascript:void(0)" class="w3-bar-item w3-button w3-hide-small w3-hover-white"onclick="loadContent('<%=request.getContextPath()%>/admin/Menu')">메뉴 관리</a>
		    	<a href="javascript:void(0)" class="w3-bar-item w3-button w3-hide-small w3-hover-white" onclick="loadContent('<%=request.getContextPath()%>/admin/Event')">행사 관리</a>
		    	<a href="javascript:void(0)" class="w3-bar-item w3-button w3-hide-small w3-hover-white" onclick="loadContent('<%=request.getContextPath()%>/admin/Accounting/index.jsp')">회계 관리</a> --%>
		    	<a href="<%=request.getContextPath() %>/admin/Menu/?menuType=menu" class="w3-bar-item w3-button w3-hide-small w3-hover-white">메뉴 관리</a>
		    	<a href="<%=request.getContextPath() %>/admin/Event/?menuType=Event" class="w3-bar-item w3-button w3-hide-small w3-hover-white" >행사 관리</a>
		    	<a href="<%=request.getContextPath() %>/admin/Accounting/?menuType=Accounting" class="w3-bar-item w3-button w3-hide-small w3-hover-white">회계 관리</a>

  			</div>
		</div>
	</div>
</div>
</body>
</html>
