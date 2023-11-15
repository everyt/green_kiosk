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
	int component_no = 0;
	if(!request.getParameter("component_no").equals(""))
	{ 
		component_no = Integer.parseInt(request.getParameter("component_no"));
	}
	menuComponentBean = menuMgr.getComponent1(component_no);
	String component_name = menuComponentBean.getComponent_name();
	int component_price = menuComponentBean.getComponent_price();
	int component_amount = menuComponentBean.getComponent_amount();
	String component_imgPath = menuComponentBean.getComponent_imgPath();
	int component_isUse = menuComponentBean.getComponent_isUse(); 
	int component_isTopping = menuComponentBean.getComponent_isTopping();
%>

	<section style="background-color: #eee;">
  <div class="container py-5">
    <div class="row justify-content-center">
      <div class="col-md-8 col-lg-6 col-xl-4">
        <div class="card text-black">
          <i class="fab fa-apple fa-lg pt-3 pb-1 px-3"></i>
          <img src="<%=component_imgPath%>"
            class="card-img-top" alt="상품사진" />
          <div class="card-body">
            <div class="text-center">
              <h5 class="card-title"><%=component_name%></h5>
              <p class="text-muted mb-4">수량 : <%=component_amount%> 개</p>
            </div>
            <div>
              <div class="d-flex justify-content-between">
                <span>상품 카테고리</span><span class="view">재료</span>
              </div>
				<div class="d-flex justify-content-between">
				    <span>사용 여부</span>
				    <span class="view"><%= component_isUse == 1 ? "적용" : "미적용" %></span>
				</div>
				<div class="d-flex justify-content-between">
				    <span>토핑 여부</span>
				    <span class="view"><%= component_isTopping == 1 ? "적용" : "미적용" %></span>
				</div>
            <div class="d-flex justify-content-between total font-weight-bold mt-4">
              <span>가격</span><span class="view"><%=component_price%> 원</span>
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