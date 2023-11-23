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
<script src="<%=cPath %>/assets/js/index.js"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
.w3-bar-block .w3-bar-item {padding:20px}
</style>
</head>
<script>
//회원가입 창 여는 함수
function open_register() {
	let url = "<%=cPath %>/register/register.jsp"
	window.open(url, "회원가입", "width=460, height=600")
}
</script>
<body>
<!-- Sidebar (hidden by default) -->
<%@ include file="/index/base/sidebar.jsp"%>
<!-- Top menu -->
<%@ include file="/index/base/head.jsp" %>
  
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1300px;margin-top:100px">
		
  <!-- First Photo Grid-->
			
<div class="w3-container w3-teal">
  <h1>이벤트</h1>
</div>

<div class="w3-row-padding w3-margin-top">
  <div class="w3-third">
    <div class="w3-card">
      <img src="<%=cPath %>/assets/images/event1.jpg" width="300" height="300" style="width:100%">
      <div class="w3-container">
        <h5>5 Terre</h5>
      </div>
    </div>
  </div>

  <div class="w3-third">
    <div class="w3-card">
      <img src="<%=cPath %>/assets/images/event2.jpg" width="300" height="300" style="width:100%">
      <div class="w3-container">
        <h5>Monterosso</h5>
      </div>
    </div>
  </div>

  <div class="w3-third">
    <div class="w3-card">
      <img src="img_vernazza.jpg" style="width:100%">
      <div class="w3-container">
        <h5>Vernazza</h5>
      </div>
    </div>
  </div>
</div>

<div class="w3-row-padding w3-margin-top">
  <div class="w3-third">
    <div class="w3-card">
      <img src="img_manarola.jpg" style="width:100%">
      <div class="w3-container">
        <h5>Manarola</h5>
      </div>
    </div>
  </div>

  <div class="w3-third">
    <div class="w3-card">
      <img src="img_corniglia.jpg" style="width:100%">
      <div class="w3-container">
        <h5>Corniglia</h5>
      </div>
    </div>
  </div>

  <div class="w3-third">
    <div class="w3-card">
      <img src="img_riomaggiore.jpg" style="width:100%">
      <div class="w3-container">
        <h5>Riomaggiore</h5>
      </div>
    </div>
  </div>
</div>

  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="<%=cPath %>/" class="w3-bar-item w3-black w3-button">1</a>
      <a href="<%=cPath %>/index/page/page2.jsp" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="<%=cPath %>/index/page/page3.jsp" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="<%=cPath %>/index/page/page4.jsp" class="w3-bar-item w3-button w3-hover-black">4</a>
    </div>
  </div>
  
  <hr id="about">
  
  <!-- Footer -->

<%@ include file="/index/base/footer.jsp" %>

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

</script>

</body>
</html>
