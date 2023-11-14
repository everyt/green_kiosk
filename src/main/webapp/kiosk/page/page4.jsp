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

  <!-- First Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">

    <div class="w3-quarter">
      <img src="../images/cola.jpg" width="300" height="300"  alt="cola" style="width:100%">
      <h3>콜라</h3>
      <p>톡 쏘는 시원 상쾌한 콜라</p>
    </div>

    <div class="w3-quarter">
      <img src="../images/cola1.jpg" width="300" height="300"  alt="cola1" style="width:100%">
		<h3>제로콜라</h3>    
      <p>톡 쏘는 시원 상쾌한 제로콜라</p>
    </div>

    <div class="w3-quarter">
      <img src="../images/saida.jpg" width="300" height="300"  alt="saida" style="width:100%">
      <h3>사이다</h3>
      <p>톡 쏘는 시원 상쾌한 제로콜라</p>

    </div>
    <div class="w3-quarter">
      <img src="../images/saida1.jpg" width="300" height="300"  alt="saida1" style="width:100%">
      <h3>제로사이다</h3>
      <p>톡 쏘는 시원 상쾌한 제로콜라</p>
  </div>
  </div>

  <div class="w3-row-padding w3-padding-16 w3-center">
    <div class="w3-quarter">
      <img src="../images/milkiseu.jpg" width="300"  height="300" alt="milkiseu" style="width:100%">
      <h3>밀키스</h3>
      <p>톡 쏘는 시원 상쾌한 밀키스</p>
    </div>

    <div class="w3-quarter">
      <img src="../images/mauntindyu.jpg" width="300" height="300"  alt="mauntindyu" style="width:100%">
      <h3>마운틴듀</h3>
      <p>톡 쏘는 시원 상쾌한 마운틴듀</p>
    </div>

    <div class="w3-quarter">
      <img src="../images/fanta.jpg" width="300" height="300"  alt="fanta" style="width:100%">
      <h3>환타(포도,파인애플,오렌지)</h3>
      <p>톡 쏘는 시원 상쾌한 마운틴듀</p>
    </div>
 
    <div class="w3-quarter">
      <img src="../images/orange juice.jpg" width="300" height="300"  alt="orange juice" style="width:100%">
      <h3>오렌지주스(PET)</h3>
      <p>갓 짜낸 오렌지의 상큼함을 담은 100% 오렌지주스</p>
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
