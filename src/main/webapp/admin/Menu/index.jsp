<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ page import="java.util.Vector" %>
<%@ page import= "menu.Manager_Menu" %>
<%@ page import= "menu.Menu_menu_Bean" %>
<jsp:useBean id="menuMgr" class="menu.Manager_Menu" />
<%@ include file="/admin/layouts/bootstrap.jsp"%> 
<%@ include file="/admin/admin_check/check.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/admin/menu.css" />
</head>
<body>
<main>
  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">메뉴 관리 페이지</h1>
        <p class="lead text-body-secondary"></p>
        <p>
          <a href="javascript:void(0)" class="btn btn-primary my-2" onclick="loadContent('<%=request.getContextPath()%>/admin/Menu/upload.jsp')">제품 등록하기</a>
          <!-- <a href="#" class="btn btn-secondary my-2"></a> -->
        </p>
      </div>
    </div>
  </section>

  <div class="album py-5 bg-body-tertiary">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      <%
		String menu_imgPath = null;
		String menu_name = null;
		String menu_gubn = null;
		int menu_price = 0;
		String menu_content = null;
		int menu_isUse = 0;
		int menu_isSale = 0;
		int count = 0;
		
		Vector<Menu_menu_Bean> vlist = menuMgr.getMenuList();
		int vlistsize = vlist.size();
		
		for (Menu_menu_Bean bean : vlist) {
			menu_name = bean.getMenu_name();
			menu_gubn = bean.getMenu_gubn();
			menu_price = bean.getMenu_price();
			menu_content = bean.getMenu_content();
			menu_imgPath = bean.getMenu_imgPath();
			menu_isUse = bean.getMenu_isUse();
			menu_isSale = bean.getMenu_isSale();
			count++;
		
      %>
        <div class="col">
          <div class="card shadow-sm">
            <img src="/downloadfile2/<%=menu_imgPath%>"class="bd-placeholder-img card-img-top" width="100%" height="225" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
            <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em"><span class="menu_name"><%=menu_name%></span></text></image>
            <div class="card-body">
              <p class="card-text" align="center"><%=menu_content%></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-body-secondary">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        
        <% } %>
<!-- not repeat div -->
      </div>
    </div>
  </div>

</main>

<footer class="text-body-secondary py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1">Album example is © Bootstrap, but please download and customize it for yourself!</p>
    <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="/docs/5.3/getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>

    
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>