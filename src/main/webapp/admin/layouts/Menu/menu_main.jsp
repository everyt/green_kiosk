<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/layouts/BeanManager.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/admin/menu_main_main.js"></script>
<main class="mainContent">
  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">메뉴 관리 페이지</h1>
        <p class="lead text-body-secondary"></p>
        <p>
          <a href="javascript:void(0)" class="btn btn-primary my-2" onclick="openPopup('<%=request.getContextPath()%>/admin/Menu/upload.jsp')">제품 등록하기</a>
          <!-- <a href="#" class="btn btn-secondary my-2"></a> -->
        </p>
      </div>
    </div>
  </section>

  <div class="album py-5 bg-body-tertiary">
    
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
<%--       <%
      	int menu_no = 0;
		String menu_imgPath = null;
		String menu_name = null;
		String menu_gubn = null;
		int menu_price = 0;
		String menu_content = null;
		int menu_isUse = 0;
		int menu_isSale = 0;
		int count = 0;
	
		
		Vector<Menu_menu_Bean> vlist = menuMgr.getMenuList(0);
		int vlistsize = vlist.size();
		
		for (Menu_menu_Bean bean : vlist) {
			menu_no = bean.getMenu_no();
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
            <img id="menu_imgPath" src="/downloadfile2/<%=menu_imgPath%>"class="bd-placeholder-img card-img-top" width="100%" height="225" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
            <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em"><span class="menu_name" id="menu_name"><%=menu_name%></span></text></image>
            <div class="card-body">
              <p class="card-text" align="center" id="menu_content"><%=menu_content%></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="javascript:void(0)" class="btn btn-sm btn-outline-secondary" onclick="openPopup('<%=request.getContextPath()%>/admin/Menu/View.jsp?menu_no=<%=menu_no%>')">상세보기</a>
                  <a href="javascript:void(0)" class="btn btn-sm btn-outline-secondary" onclick="openPopup('<%=request.getContextPath()%>/admin/Menu/Edit.jsp?menu_no=<%=menu_no%>')">수정하기</a>
                </div>
                <%
                	String menu_price1 = formatNumber(menu_price);
                %>
                <small class="text-body-secondary"><%=menu_price1%>원</small>
              </div>
            </div>
          </div>
        </div>
        
        <% } %> --%>
        <div class="getMenuList"></div>
<!-- not repeat div -->
      </div>
    </div>
  </div>
</main>

<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>



<%! 
    public String formatNumber(double number) { 
        // 숫자를 3자리마다 쉼표로 구분 
        java.text.DecimalFormat df = new java.text.DecimalFormat("#,###"); 
        return df.format(number); 
    } 

    public String formatTime(Long number) { 
        java.text.DecimalFormat df = new java.text.DecimalFormat("#,###"); 
        return df.format(number); 
    } 
%>



