<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/admin/layouts/BeanManager.jsp" %>
<%@ include file="/admin/layouts/bootstrap.jsp"%>
<%@ include file="/admin/admin_check/check.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/admin/Menu/menu_view.css" />
</head>
<body>
<%
	int menu_no = 0;
	if(!request.getParameter("menu_no").equals(""))
	{
		menu_no = Integer.parseInt(request.getParameter("menu_no"));
	}
	menuBean = menuMgr.getMenu(menu_no); 
	String menu_name = menuBean.getMenu_name();
	String menu_gubn = menuBean.getMenu_gubn();
	String menu_imgPath = menuBean.getMenu_imgPath();
	int menu_price = menuBean.getMenu_price();
	String menu_content = menuBean.getMenu_content();
	int menu_isUse = menuBean.getMenu_isUse();
	int menu_isSale = menuBean.getMenu_isSale();
%>

	<section style="background-color: #eee;">
  <div class="container py-5">
    <div class="row justify-content-center">
      <div class="col-md-8 col-lg-6 col-xl-4">
        <div class="card text-black">
          <i class="fab fa-apple fa-lg pt-3 pb-1 px-3"></i>
          <img src="/downloadfile2/<%=menu_imgPath%>"
            class="card-img-top" alt="상품사진" />
          <div class="card-body">
            <div class="text-center">
              <h5 class="card-title"><%=menu_name%></h5>
              <p class="text-muted mb-4"><%=menu_content%></p>
            </div>
            <div>
              <div class="d-flex justify-content-between">
                <span>상품 카테고리</span><span class="view"><%=menu_gubn%></span>
              </div>
				<div class="d-flex justify-content-between">
				    <span>사용 여부</span>
				    <span class="view"><%= menu_isUse == 1 ? "적용" : "미적용" %></span>
				</div>
				<div class="d-flex justify-content-between">
				    <span>할인 행사 여부</span>
				    <span class="view"><%= menu_isSale == 1 ? "적용" : "미적용" %></span>
				</div>
            <div class="d-flex justify-content-between total font-weight-bold mt-4">
              <span>가격</span><span class="view"><%=menu_price%> 원</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 </div>
</section>
</body>
</html>