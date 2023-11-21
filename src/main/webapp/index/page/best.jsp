<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="user.Member_Mgr" %>
<%@ page import="user.Member_Bean" %>
<%
	String cPath = request.getContextPath();

	Object mem_id = session.getAttribute("mem_id");
	Member_Mgr u_mgr = new Member_Mgr();
	Member_Bean bean = null;
	String mem_ac = "user";
	if (mem_id != null) {
		bean = u_mgr.getMember(String.valueOf(mem_id));
		mem_ac = bean.getMem_ac();
	}
%>
<html>
<head>
<title>W3.CSS Templatee</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="<%=cPath %>/assets/css/reset.css">
<link rel="stylesheet" href="<%=cPath %>/assets/css/index.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<%=cPath %>/assets/js/index.js"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
.w3-bar-block .w3-bar-item {padding:20px}
</style>
</head>
<script>
let mapSort1 = null;
var menuType = "all";
var priceSumdaily = [0,0,0,0,0,0,0];
var priceSumDate = ['','','','','','',''];
var menuAmountMap = new Map();
var keyValuePairs  = [];
//회원가입 창 여는 함수
function open_register() {
	let url = "<%=cPath %>/register/register.jsp"
	window.open(url, "회원가입", "width=460, height=600")
}
</script>
<script src="myApp.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="myApp.js"></script>
<body>
<!-- Sidebar (hidden by default) -->
<%@ include file="/index/base/sidebar.jsp"%>
<!-- Top menu -->
<%@ include file="/index/base/head.jsp" %>
  
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1300px;margin-top:100px">

<div class="w3-container w3-teal">
  <h1>인기 메뉴</h1>
</div>
    <div class="w3-row-padding w3-padding-16 w3-center" id="food">
   <div class="w3-quarter">
      <img src="<%=cPath %>/assets/images/hamburger0.jpg"  width="300" height="300" alt="hamburger0" style="width:100%">
      <h3>데리버거</h3>
	  <p>쇠고기패티에 달콤 짭짤한 데리소스를 더한 가성비 버거</p>
   </div>

    <div class="w3-quarter">
      <img src="<%=cPath %>/assets/images/hamburger1.jpg" width="300" height="300"  alt="hamburger" style="width:100%">
      <h3>더블 데리버거</h3>
      <p>두 장의 패티가 이루는 조화로운 맛에 <br>든든함까지 추가된 더블버거 시리즈</p>
    </div>


    <div class="w3-quarter">
      <img src="<%=cPath %>/assets/images/hamburger2.jpg" width="300" height="300"  alt="hamburger2" style="width:100%">
      <h3>불고기버거</h3>
      <p>두툼한 쇠고기패티와 한국적인 맛의 소스가 잘 조화된 ???매장의 대표 버거</p>

    </div>
    <div class="w3-quarter">
      <img src="<%=cPath %>/assets/images/hamburger3.jpg" width="300"  height="300" alt="hamburger3" style="width:100%">
      <h3>더블 불고기버거</h3>
	  <p>불고기 특유의 소스와 쇠고기의 진함을 배로 느끼는 제품</p>
  </div>
  </div>
  
  <!-- Second Photo Grid-->

  <div class="w3-row-padding w3-padding-16 w3-center">
    <div class="w3-quarter">
      <img src="<%=cPath %>/assets/images/hamburger4.jpg" width="300" height="300"  alt="hamburger4" style="width:100%">
      <h3>치킨버거</h3>
	  <p>닭고기패티와 데리야끼 소스로 만든 담백하고 달콤한 맛의 치킨버거</p>
    </div>

    <div class="w3-quarter">
      <img src="<%=cPath %>/assets/images/hamburger5.jpg" width="300" height="300"  alt="hamburger5" style="width:100%">
      <h3>더블 치킨버거</h3>
      <p>두 장의 패티가 이루는 조화로운 맛에 든든함까지 추가된 더블버거 시리즈</p>
    </div>

    <div class="w3-quarter">
      <img src="<%=cPath %>/assets/images/hamburger6.jpg" width="300" height="300"  alt="hamburger1" style="width:100%">
		<h3>치즈버거</h3>    
  		<p>부드러운 치즈와 호주산 쇠고기패티의 본연의 맛을 느낄수 있는 치즈버거</p>
    </div>
 
    <div class="w3-quarter">
      <img src="<%=cPath %>/assets/images/hamburger7.jpg"  width="300" height="300"  style="width:100%">
      <h3>더블 클래식치즈버거</h3>
      <p>두 장의 패티가 이루는 조화로운 맛에 든든함까지 추가된 더블 클래식치즈버거</p>
    </div>
  </div>

  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="<%=cPath %>/index.jsp" class="w3-bar-item w3-black w3-button">1</a>
      <a href="<%=cPath %>/index/page/page2.jsp" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="<%=cPath %>/index/page/page3.jsp" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="<%=cPath %>/index/page/page4.jsp" class="w3-bar-item w3-button w3-hover-black">4</a>
    </div>
  </div>
  
  <hr id="about">
  
  <!-- Footer -->

    <div class="w3-third w3-serif">
      <h3>인기 태그</h3>
      <p>
        <span class="w3-tag w3-black w3-margin-bottom">???가게 전주점</span>
        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">햄버거</span>
        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">수제 버거</span>
        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">감자튀김</span>
        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">치킨버거</span>
        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">데리버거</span>
        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">불고기버거</span>
        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">치즈버거</span>
        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">전주 맛집</span>
        <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">키오스크</span>
      </p>
    </div>

<!-- End page content -->
</div>



<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}

function myAccFunc() {
	  var x = document.getElementById("demoAcc");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	    x.previousElementSibling.className += " w3-green";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	    x.previousElementSibling.className = 
	    x.previousElementSibling.className.replace(" w3-green", "");
	  }
	}

function myAccFunc1() {
	  var x = document.getElementById("demoAcc1");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	    x.previousElementSibling.className += " w3-green";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	    x.previousElementSibling.className = 
	    x.previousElementSibling.className.replace(" w3-green", "");
	  }
	}

function myAccFunc2() {
	  var x = document.getElementById("demoAcc2");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	    x.previousElementSibling.className += " w3-green";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	    x.previousElementSibling.className = 
	    x.previousElementSibling.className.replace(" w3-green", "");
	  }
	}
	
function barChart3() {
	
	 const existingChart = Chart.getChart('myChart3');
   if (existingChart) {
       existingChart.destroy();
   }
   
 const entriesArray = Array.from(menuAmountMap.entries());
 const menuData2 = entriesArray.map(([name, amount]) => ({ name, amount }));
 menuData2.sort((a, b) => b.amount - a.amount);
 const top20MenuData = menuData2.slice(0, 20);

 const ctx = document.getElementById('myChart3').getContext('2d');
 new Chart(ctx, {
   type: 'bar',
   data: {
     labels: top20MenuData.map(item => item.name),
     datasets: [{
       label: '판매량',
       data: top20MenuData.map(item => item.amount),
       borderWidth: 1
     }]
   },
   options: {
     scales: {
       y: {
         beginAtZero: true
       }
     },
     responsive: true,
     plugins: {
       title: {
         display: true,
         text: "당월 메뉴별 판매량(상위 20개)"
       }
     }
   }
 });
}

function formatNumber(number) {
    // 숫자를 3자리마다 쉼표로 구분
    var df = new Intl.NumberFormat('ko-KR');
    return df.format(number);
}

function dateDiff(start_date, end_date) {
    let startDate = new Date(start_date);
    let endDate = new Date(end_date);

    let diffInMonths = (endDate.getFullYear() - startDate.getFullYear()) * 12 + endDate.getMonth() - startDate.getMonth();

    // Adjust for day differences
    let startDateCopy = new Date(startDate.getTime());
    startDateCopy.setMonth(startDateCopy.getMonth() + diffInMonths);

    if (startDateCopy > endDate) {
        diffInMonths--;
    }

    // Calculate the remaining days
    let daysInMonth = new Date(endDate.getFullYear(), endDate.getMonth() + 1, 0).getDate();
    let remainingDays = (endDate - startDateCopy) / (1000 * 60 * 60 * 24);

    return diffInMonths * daysInMonth + remainingDays;
}

function processMenuData(response) {
    var foodSales = {};
    var foodCount = {};
    var priceSumDay = 0;
    var priceSumWeek = 0;
    var priceSumMonth = 0;
    var priceSumYear = 0;
    var allOrderFoods = [];
    var allTime = [];
    var currentDate = new Date().toISOString().slice(0, 10);
	var currentDay = new Date(currentDate).getDay();
	
	var daysOfWeek = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
	var dayOfWeekString = daysOfWeek[currentDay];
	
    for (var i = 0; i < response.length; i++) {
        var order_time = response[i].order_time;
        var orderDate = new Date(order_time).toISOString().slice(0, 10);
        var order_price = response[i].order_price;
	    var order_foods = response[i].order_foods; // 주문 음식 정보를 JSON으로 파싱
       allOrderFoods.push(order_foods);
       allTime.push(order_time);   
	    var orderDay = new Date(orderDate).getDay();
	    
	    
        if (orderDate == currentDate) {
            priceSumDay += order_price;
		} 
		
        if (dateDiff(orderDate, currentDate) >= 0 && dateDiff(orderDate, currentDate) < 7) {
            priceSumWeek += order_price;
      		  if (!priceSumDate.includes(orderDate)) {
        			priceSumDate[orderDay] = orderDate; 
        			}
            priceSumdaily[orderDay] += order_price;
        }
		
        if (dateDiff(orderDate, currentDate) >= 0 && dateDiff(orderDate, currentDate) <= 30) {
            priceSumMonth += order_price;
        }
        
        
    }   
    return { priceSumDay, priceSumWeek, priceSumMonth, foodCount, foodSales, allOrderFoods, allTime, priceSumdaily };
}

function updateHTML(priceSumDay, priceSumWeek, priceSumMonth, totalAmountByNameFromCookie) {
	mapSort1 = new Map([...menuAmountMap.entries()].sort((a, b) => b[1] - a[1]));
	var htmlTemplate =
	    '<div class="col-xl-3 col-md-6 mb-4">' +
	    createCard2('일일 매출', priceSumDay) +
	    '</div>' +
	    '<div class="col-xl-3 col-md-6 mb-4">' +
	    createCard2('이번 주 매출', priceSumWeek) +
	    '</div>' +
	    '<div class="col-xl-3 col-md-6 mb-4">' +
	    createCard2('이번 달 매출', priceSumMonth) +
	    '</div>';
	    //$('.getMenuList').empty().html(htmlTemplate);
	}


function updateMenu(menuType) {
    $.ajax({
        type: "POST",
        url: "<%=cPath %>/admin/index/getMenuData?type=all",
        dataType: "json",
        data: {
            type: menuType
        },
        contentType: "application/json; charset=UTF-8",
        success: function (response) {
            if (response && response.length > 0) {
                // Separate concerns: processing data and updating HTML
                var { priceSumDay, priceSumWeek, priceSumMonth, foodCount, foodSales, allOrderFoods, allTime, priceSumdaily } = processMenuData(response);
					console.log("all time :  " + allTime);
					var orderInfoArray = JSON.parse("[" + allOrderFoods + "]");
					console.log(allOrderFoods);
					orderInfoArray.forEach(function(order) {
				    order.forEach(function(item) {
				        var menuName = item.name;
				        var amount = parseInt(item.amount);
				
				        if (menuAmountMap.has(menuName)) {
				            menuAmountMap.set(menuName, menuAmountMap.get(menuName) + amount);
				        } else {
				            menuAmountMap.set(menuName, amount);
				        }
				    });
				});
                // Update HTML
                updateHTML(priceSumDay, priceSumWeek, priceSumMonth, priceSumdaily);
				     
				 barChart3();

            } else {
                console.error("No data received or data is empty.");
            }
        },

        error: function (xhr, status, error) {
            console.error("Ajax request failed:", status, error);
        }
    });
}

window.addEventListener('DOMContentLoaded', function () {
	updateMenu("all");
  
});

const array = [1, 2, 3, 4, 5];

const newArray = array.map(function(element, index, array) {
  // 각 요소를 변형한 결과를 반환하여 새로운 배열을 생성합니다
  return element * 2;
});

console.log(newArray); // [2, 4, 6, 8, 10]

</script>


</body>
</html>
