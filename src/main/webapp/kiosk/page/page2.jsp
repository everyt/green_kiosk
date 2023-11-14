<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
.w3-bar-block .w3-bar-item {padding:20px}
</style>
</head>
<body>

<!-- Top menu -->
<div class="w3-top">
  <div class="w3-white w3-xlarge" style="max-width:1300px;margin:auto">
    <div class="w3-center w3-padding-16">???가게 메뉴</div>
  </div>
</div>
  
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1300px;margin-top:100px">
		
  <!-- First Photo Grid-->
			
<div class="w3-row">

 <div class="w3-container w3-quarter" a href="page/page4.jsp">
  <a href="page1.jsp" class="w3-bar-item w3-button w3-xlarge w3-hover-black">단품 메뉴</a>
    </div>

  <div class="w3-container w3-quarter" a href="page/page4.jsp">
  <a href="page2.jsp" class="w3-bar-item w3-button w3-xlarge w3-hover-black">세트 메뉴</a>
    </div>

  <div class="w3-container w3-quarter" a href="page/page4.jsp">
  <a href="page3.jsp" class="w3-bar-item w3-button w3-xlarge w3-hover-black">디저트</a>
    </div>

  <div class="w3-container w3-quarter" a href="page/page4.jsp">
  <a href="page4.jsp" class="w3-bar-item w3-button w3-xlarge w3-hover-black">음료수</a>
    </div>
</div>



   <div class="w3-row-padding w3-padding-16 w3-center w3-tooltip" id="food">
   	<div class="w3-quarter">
        <img src="../images/hamburger0.jpg"  width="300" height="300" alt="hamburger0" style="width:100%">
      <h3>데리버거</h3>
	  <p>쇠고기패티에 달콤 짭짤한 데리소스를 더한 가성비 버거</p>

   </div>

    <div class="w3-quarter">
      <img src="../images/hamburger1.jpg" width="300" height="300"  alt="hamburger" style="width:100%">
      <h3>더블 데리버거</h3>
      <p>두 장의 패티가 이루는 조화로운 맛에 <br>든든함까지 추가된 더블버거 시리즈</p>
    </div>


    <div class="w3-quarter">
      <img src="../images/hamburger2.jpg" width="300" height="300"  alt="hamburger2" style="width:100%">
      <h3>불고기버거</h3>
      <p>두툼한 쇠고기패티와 한국적인 맛의 소스가 잘 조화된 ???매장의 대표 버거</p>

    </div>
    <div class="w3-quarter">
      <img src="../images/hamburger3.jpg" width="300"  height="300" alt="hamburger3" style="width:100%">
      <h3>더블 불고기버거</h3>
	  <p>불고기 특유의 소스와 쇠고기의 진함을 배로 느끼는 제품</p>
  </div>
  </div>
  
  <!-- Second Photo Grid-->

  <div class="w3-row-padding w3-padding-16 w3-center">
    <div class="w3-quarter">
      <img src="../images/hamburger4.jpg" width="300" height="300"  alt="hamburger4" style="width:100%">
      <h3>치킨버거</h3>
	  <p>닭고기패티와 데리야끼 소스로 만든 담백하고 달콤한 맛의 치킨버거</p>
    </div>

    <div class="w3-quarter">
      <img src="../images/hamburger5.jpg" width="300" height="300"  alt="hamburger5" style="width:100%">
      <h3>더블 치킨버거</h3>
      <p>두 장의 패티가 이루는 조화로운 맛에 든든함까지 추가된 더블버거 시리즈</p>
    </div>

    <div class="w3-quarter">
      <img src="../images/hamburger6.jpg" width="300" height="300"  alt="hamburger1" style="width:100%">
		<h3>치즈버거</h3>    
  		<p>부드러운 치즈와 호주산 쇠고기패티의 본연의 맛을 느낄수 있는 치즈버거</p>
    </div>
 
    <div class="w3-quarter">
      <img src="../images/hamburger7.jpg"  width="300" height="300"  style="width:100%">
      <h3>더블 클래식치즈버거</h3>
      <p>두 장의 패티가 이루는 조화로운 맛에 든든함까지 추가된 더블 클래식치즈버거</p>
    </div>
  </div>


	<div class="w3-row w3-border">
	<div class="w3-half w3-container">
	  <h2>w3-half</h2>  
	</div>
	<div class="w3-quarter w3-container">
	  <h2>취소하기</h2>
	</div>
	<div class="w3-quarter w3-container">
	  <h2>결제하기</h2>
	</div>
</div>


</div>



<script>

		function count(type)  {
			
			String i = 0;
				// 결과를 표시할 element
			  const resultElement = document.getElementById('result');
			  
			  // 현재 화면에 표시된 값
			  let number = resultElement.innerText;
			  
			  // 더하기/빼기
			  if(type === 'plus') {
			    number = parseInt(number) + 1;
			  }else if(type === 'minus')  {
			    number = parseInt(number) - 1;
			  }
			  
			  // 결과 출력
			  resultElement.innerText = number;
			}

</script>

</body>
</html>
