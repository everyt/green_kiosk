<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/layouts/BeanManager.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/admin/Menu/menu_main.js"></script>
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
<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3 getMenuList">

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



