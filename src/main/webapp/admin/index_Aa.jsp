<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/admin/coupon.css">
<script src="<%=request.getContextPath() %>/assets/js/admin/menu_main_1.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/admin/index/index_main.js"></script>
<%@ include file="/admin/layouts/indexBase.jsp" %>
<%@ include file="/admin/layouts/header.jsp" %>
<%@ include file="/admin/admin_check/check.jsp" %>

</head>

<body>
<br/>
	<div class="layout_left">
		<%@ include file="/admin/layouts/left.jsp" %>
	</div>
<main class="mainContent">
  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">차트 페이지</h1>
        <p class="lead text-body-secondary"></p>

      </div>
    </div>
  </section>

  <div class="album py-5 bg-body-tertiary">    
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 getMenuList">

<!-- not repeat div -->
      </div>
      
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/admin/index/chart/chart bar.js"></script>      
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<div class="chartBox">
	<div>
		<canvas id="myChart" style="display: block; box-sizing: border-box; height: 300px; width: 1200px;" width="1200"></canvas>
	</div>
	
	<div>
		<canvas id="myChart3"  style="display: block; box-sizing: border-box; height: 232px; width: 696px;" width="696"></canvas>
	</div>
	
	<div>
		<canvas id="myChart2"  style="display: block; box-sizing: border-box; height: 232px; width: 696px;" width="696"></canvas>
	</div> 
	
	<div>
		<canvas id="myChart4" style="display: block; box-sizing: border-box; height: 232px; width: 696px;" width="696"></canvas>
		
	 <label for="startDate">Start Date:</label>
    	<input type="date" id="startDate">

    <label for="endDate">End Date:</label>
    	<input type="date" id="endDate">
		
		<button onclick="updateChart()">날짜 등록 </button>
	</div>
</div>  
                        
    </div>
  </div>
</main>
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js"></script>
	<br/>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/admin/index_index.js"></script>
</html>