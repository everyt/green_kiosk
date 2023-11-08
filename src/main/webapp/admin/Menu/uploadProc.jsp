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
<%@ include file="/admin/admin_check/check.jsp" %>
<jsp:useBean id="menuMgr" class="menu.Manager_Menu"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu_uploadProcess</title>
</head>
<body>
	<%
		String savePath= "/usr/local/tomcat/webapps/downloadfile2";
		String encType = "utf-8";
		int maxSize = 50 * 1024 * 1024;
		
		ServletContext context = this.getServletContext();
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, savePath, maxSize, encType, new DefaultFileRenamePolicy());
		
		int menu_isUse = 0;
		int menu_isSale = 0;

		String menuIsSaleParameter = multi.getParameter("menu_isSale");
		if (menuIsSaleParameter != null && !menuIsSaleParameter.isEmpty()) {
		    menu_isSale = 1;
		}

		String menuIsUseParameter = multi.getParameter("menu_isUse");
		if (menuIsUseParameter != null && !menuIsUseParameter.isEmpty()) {
		    menu_isUse = 1;
		}
		
		if (multi.getParameter("menu_name") != null && !multi.getParameter("menu_name").isEmpty() && 
			    multi.getParameter("menu_gubn") != null && !multi.getParameter("menu_gubn").isEmpty() &&
			    multi.getParameter("menu_price") != null && !multi.getParameter("menu_price").isEmpty() &&
			    multi.getParameter("menu_content") != null && !multi.getParameter("menu_content").isEmpty())
		{
		String fileName = multi.getFilesystemName("menu_imgPath");
		String menu_name = multi.getParameter("menu_name");
		String menu_gubn = multi.getParameter("menu_gubn");
		int menu_price = Integer.parseInt(multi.getParameter("menu_price"));
		String menu_content = multi.getParameter("menu_content");

		if (multi.getParameter("menu_gubn").equals("재료")){
			
		} else if (multi.getParameter("menu_gubn").equals("이벤트")){
			
		} else {
				Menu_menu_Bean menuBean = new Menu_menu_Bean();
				menuBean.setMenu_name(menu_name);
				menuBean.setMenu_gubn(menu_gubn);
				menuBean.setMenu_isSale(menu_isSale);
				menuBean.setMenu_imgPath(fileName);
				menuBean.setMenu_price(menu_price);
				menuBean.setMenu_content(menu_content); 
				menuBean.setMenu_isUse(menu_isUse);
				menuBean.setMenu_component("0");
				menuBean.setMenu_sell_amount(0);
				menuBean.setMenu_recommend(0);
				boolean result = menuMgr.insertMenu(menuBean);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='../index.jsp");
				script.println("</script>");
			}
		} else { //null 값 처리 실패
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든 필드에 입력해주세요')");
			script.println("location.href='../index.jsp'");
			script.println("</script>");
		}
		
	%>
</body>
</html>