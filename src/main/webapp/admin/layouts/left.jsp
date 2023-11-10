<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.io.PrintWriter" %>

	<nav class="w3-sidebar w3-bar-block w3-collapse w3-large w3-theme-l5 w3-animate-left" id="mySidebar">
	  <a href="javascript:void(0)" onclick="w3_close()" class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large" title="Close Menu">
	    <i class="fa fa-remove"></i>
	  </a>
	  <br/>
	  <h4 class="w3-bar-item"><b>Menu</b></h4>
	  <hr/>
	  <% String menuType = null;
	  if(request.getParameter("menuType") == null)
	  {
		  menuType = "main";
	  }
	  if (request.getParameter("menuType") != null && !request.getParameter("menuType").isEmpty())
	  {
		  menuType = "main";
	  } else if (request.getParameter("menuType") == null && menuType == null){
	  
			  PrintWriter script = response.getWriter();
			  script.println("<script>");
			  script.println("alert('정상 접근이 아닙니다!')");
			  script.println("history.back()");
			  script.println("</script>");
		  }
	
	  %>
	  <%
	  //menu page 일 경우 
	  if(menuType.equals("menu")) { %>
	  <a class="w3-bar-item w3-button w3-hover-black" href="javascript:void(0)" onclick="loadContent('<%=request.getContextPath()%>/admin/layouts/menu_main.jsp')">전체 메뉴</a>
	  <a class="w3-bar-item w3-button w3-hover-black" href="javascript:void(0)">Link</a>
	  <a class="w3-bar-item w3-button w3-hover-black" href="javascript:void(0)">Link</a>
	  <%
	  //Event page 일 경우 
	  } else if (menuType.equals("Event")){ %>
	  <a class="w3-bar-item w3-button w3-hover-black" href="javascript:void(0)" onclick="loadContent('<%=request.getContextPath()%>/login/logout.jsp')">로그아웃</a>
	  <a class="w3-bar-item w3-button w3-hover-black" href="javascript:void(0)">Link</a>
	  <a class="w3-bar-item w3-button w3-hover-black" href="javascript:void(0)">Link</a>
	  <% 
	  //Accounting page 일 경우
	  } else { %>
	  <a class="w3-bar-item w3-button w3-hover-black" href="javascript:void(0)" onclick="loadContent('<%=request.getContextPath()%>/login/logout.jsp')">로그아웃</a>
	  <a class="w3-bar-item w3-button w3-hover-black" href="javascript:void(0)">Link</a>
	  <a class="w3-bar-item w3-button w3-hover-black" href="javascript:void(0)">Link</a>
	  <% } %>
	</nav>
	
</body>
</html>
