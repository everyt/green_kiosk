<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>

<div class="w3-container">
 
  <h2>Circular Buttons</h2>

  <button class="w3-button w3-xlarge w3-circle w3-black" id="plus"
  	 onclick='count("minus")'>-</button>
	<div class="w3-button w3-xlarge w3-circle w3-red w3-card-4" id='result'>0</div>
  <div button class="w3-button w3-xlarge w3-circle w3-red w3-card-4" id="minus"
    	 onclick='count("plus")'>+ </div>
    	  </div>


<script>
function count(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('result');
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus')  {
	    number = parseInt(number) - 1;
	  	if(tpye )
	  }
	  
	  // 결과 출력
	  resultElement.innerText = number;
	}
</script>

</body>
</html> 
