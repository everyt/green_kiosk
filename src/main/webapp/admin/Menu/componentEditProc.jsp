<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ include file="/admin/layouts/BeanManager.jsp" %>
<%@ include file="/admin/admin_check/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu_uploadProcess</title>
</head>
<body>
<%@ page import="java.net.URLDecoder" %>
 
	<%
	    String menuType = "";
	    if (request.getCookies() != null) {
	        for (javax.servlet.http.Cookie cookie : request.getCookies()) {
	            if (cookie.getName().equals("menuType")) {
	                menuType = URLDecoder.decode(cookie.getValue(), "UTF-8");
	                break;
	            }
	        }
	    }
	%>
	<%
		//해당 주소는 서버 주소입니다. 로컬에서 실행시 오류 발생하므로 서버에 올려서 테스트
		String savePath= "/usr/local/tomcat/webapps/downloadfile2"; 
		String encType = "utf-8";
		int maxSize = 50 * 1024 * 1024;
		
		ServletContext context = this.getServletContext();
		MultipartRequest multi = null;
		
		multi = new MultipartRequest(request, savePath, maxSize, encType, new DefaultFileRenamePolicy());
		
		int component_isUse = 0;
		int component_isTopping = 0;

		String componentIsToppingParameter = multi.getParameter("component_isTopping");
		if (componentIsToppingParameter != null && !componentIsToppingParameter.isEmpty()) {
		    component_isTopping = 1;
		}

		String componentIsUseParameter = multi.getParameter("component_isUse");
		if (componentIsUseParameter != null && !componentIsUseParameter.isEmpty()) {
		    component_isUse = 1;
		}
		
		if (		multi.getParameter("component_no") != null && !multi.getParameter("component_no").isEmpty() &&
				multi.getParameter("component_name") != null && !multi.getParameter("component_name").isEmpty() && 
			    multi.getParameter("component_price") != null && !multi.getParameter("component_price").isEmpty() &&
			    multi.getParameter("component_amount") != null && !multi.getParameter("component_amount").isEmpty())
		{
			int component_no = Integer.parseInt(multi.getParameter("component_no"));
			String component_name = multi.getParameter("component_name");
			int component_price = Integer.parseInt(multi.getParameter("component_price"));
			String fileName =	multi.getParameter("component_imgPath")	;
			int component_amount = Integer.parseInt(multi.getParameter("component_amount"));
		
		if (multi.getParameter("component_gubn").equals("재료")){
				menuComponentBean = new Menu_component_Bean();
				menuComponentBean.setComponent_no(component_no);
				menuComponentBean.setComponent_amount(component_amount);
				menuComponentBean.setComponent_name(component_name);
				menuComponentBean.setComponent_price(component_price);
				menuComponentBean.setComponent_isUse(component_isUse);
				menuComponentBean.setComponent_isTopping(component_isTopping);
				if (fileName == null){
					fileName = multi.getParameter("component_imgPath");
					menuComponentBean.setComponent_imgPath(fileName);
				} else {
					menuComponentBean.setComponent_imgPath(fileName);
				}
				boolean result = menuMgr.updateComponent(menuComponentBean);
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
		        %>
		       	<script>
		       		window.opener.updateMenu('<%=menuType%>');
		       	</script>
		        <%
 				script.println("window.close()");
				script.println("</script>");
			}
		} else { //null 값 처리 실패
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든 필드에 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}
		
	%>
</body>
</html>