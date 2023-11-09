<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="user.Member_Mgr" %>
<%@ page import="user.Member_Bean" %>
<script> let res = "false"; </script>
<%
	String cPath = request.getContextPath();

	Object mem_id = session.getAttribute("mem_id");
	Object failed_count = session.getAttribute("failed_count");
	Object pw_ok = session.getAttribute("pw_ok");
	if (pw_ok != null) {
		String s_pw_ok = String.valueOf(pw_ok);
		if (s_pw_ok.equals("true")) {
			session.setAttribute("pw_ok", null);
			session.setAttribute("failed_count", null);
			%>
			<script>res = "true"</script>
			<%
		} else {
			if (failed_count != null) {
				Integer f_count = Integer.parseInt(String.valueOf(failed_count));
				System.out.println("personal 22: "+f_count);
				if (f_count > 3) {
					session.invalidate();
					%>
						<script>				
							alert("비밀번호 오류 허용 횟수 3회를 초과하였습니다.\n강제 로그아웃됩니다.");
							location.href="<%=cPath%>/";
						</script>
					<%
				} else {
					System.out.println("personal 32: in");
					f_count = f_count + 1;
					Integer rem = 4 - f_count;
					%>
						<script>				
							alert("비밀번호가 틀렸습니다.\n남은 오류 허용 횟수 <%=rem%>회\n횟수를 모두 소진하면 강제 로그아웃됩니다.");
						</script>
					<%
					session.setAttribute("failed_count", f_count);
				}
			} else {
				%>
					<script>				
						alert("비밀번호가 틀렸습니다.\n남은 오류 허용 횟수 3회\n횟수를 모두 소진하면 강제 로그아웃됩니다.");
					</script>
				<%
				session.setAttribute("failed_count", 1);
			}
		}
	}
	Member_Mgr u_mgr = new Member_Mgr();
	Member_Bean bean = null;
	String mem_pw = null;
	String mem_ac = "user";
	if (mem_id != null) {
		bean = u_mgr.getMember(String.valueOf(mem_id));
		mem_ac = bean.getMem_ac();
		mem_pw = bean.getMem_pw();
		System.out.println(mem_pw);
		%> 
			<script id="pw_ingage"> 
				if (res != "true") {
					let pw = prompt("민감한 정보를 다루는 곳입니다.\n비밀번호를 입력하세요.");
					
					if (pw == null) {
						history.back();
					} else {
						location.href = "<%=cPath%>/user/pw_check.jsp?mem_pw="+pw
					}
				}
			</script>		
		<%
	} else {
		%>
		<script> alert("잘못된 접근입니다."); location.href = "<%= cPath%>/" </script>
 		<%
	}
%>
<html>
<head>
<title>마이페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="<%=cPath %>/assets/css/reset.css">
<link rel="stylesheet" href="<%=cPath %>/assets/css/index.css">
<link rel="stylesheet" href="<%=cPath %>/assets/css/mypage.css">
<link rel="stylesheet" href="<%=cPath %>/assets/css/register.css">
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
<nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" id="mySidebar">
	<div class="close_div">
		  <a class="close" href="javascript:void(0)" onclick="w3_close()"
		  class="w3-bar-item w3-button">X</a>
		</div>
		<%if (mem_id == null) {%>
	  <form class="login" name="loginFrm" method="post" action="<%= cPath%>/login/login_proc.jsp">
	  	<div class="inside">
		  	<div class="idpw_warp">
			  	<input title="아이디" class="id" placeholder="아이디" onkeyup="if(window.event.keyCode==13){login()}" name="mem_id" maxlength="22">
			  	<input title="비밀번호" type="password" id="pw" class="pw"  onkeyup="if(window.event.keyCode==13){login()}" placeholder="비밀번호" maxlength="23" name="mem_pw">
			  	<div class="eyes">
			  		<i id="ps_hide" onclick="password_visable('true')" class="on"></i>
			  		<i id="ps_show" onclick="password_visable('false')" style="display:none" class="off"></i>
			  	</div>
			</div>
			
			<div class="checkbox">
				<input type="checkbox" id="save_id">
				<label id="string_save_id" for="save_id">아이디 저장</label>
			</div>
			
			<div class="bottom">
				<input class="login_btn" type="button" onclick="login()" value="로그인">
				
				<div class="login_tool">
					<span>ID/PW 찾기</span>
					<span onclick="open_register()">회원가입</span>
				</div>
			</div>
		</div>
	  </form>
	  <%} else { if (mem_ac.equals("S")) {%>
		<div class="login">
			<div class="inside">
		  		<div class="info">
		  			<span class="name">관리자 <%=bean.getMem_name()%>님 환영합니다.</span>
		  			<div class="equip">
		  				<span class="mile">보유 마일리지 : <%=bean.getMem_mile() %> 점</span>
		  				<%	
		  					Integer count = 0;
		  					String coupon = bean.getMem_coupon();
		  					if (coupon != "") {
		  						String[] coupon_s = coupon.split(",");
		  						count = coupon_s.length;
		  					}
		  					
		  				%>
		  				<span class="coupon">보유중인 쿠폰 : <%=count %> 장</span>
		  			</div>
		  			<div class="setting">
		  				<span onclick="location.href='<%=cPath %>/admin'">관리하기</span>
		  				<span onclick="location.href='<%=cPath %>/login/logout.jsp'">로그아웃</span>
		  			</div>
		  		</div>
		  	</div>
		</div>	  
	  <%} else {%>
		
		<div class="login">
			<div class="inside">
		  		<div class="info">
		  			<span class="name"><%=bean.getMem_name()%>님 환영합니다.</span>
		  			<div class="equip">
		  				<span class="mile">보유 마일리지 : <%=bean.getMem_mile() %> 점</span>
		  				<%	
		  					Integer count = 0;
		  					String coupon = bean.getMem_coupon();
		  					if (coupon != "") {
		  						String[] coupon_s = coupon.split(",");
		  						count = coupon_s.length;
		  					}
		  					
		  				%>
		  				<span class="coupon">보유중인 쿠폰 : <%=count %> 장</span>
		  			</div>
		  			<div class="setting">
		  				<span onclick="location.href='<%=cPath %>/mypage/personal.jsp'">마이페이지</span>
		  				<span onclick="location.href='<%=cPath %>/login/logout.jsp'">로그아웃</span>
		  			</div>
		  		</div>
		  	</div>
		</div>
		 
	  <%}} %>
   <button class="w3-bar-item w3-button" onclick="myAccFunc()">햄버거</button>
  <div id="demoAcc" class="w3-bar-block w3-hide w3-white w3-card-4">
  	<a href="<%=cPath %>/index.jsp" class="w3-bar-item w3-button">단품</a>
    <a href="<%=cPath %>/index/page/page2.jsp" class="w3-bar-item w3-button">세트</a>
    <a href="<%=cPath %>/index/page/page3.jsp" class="w3-bar-item w3-button">디저트</a>
    <a href="<%=cPath %>/index/page/page4.jsp" class="w3-bar-item w3-button">음료수</a>
  </div>

  <button class="w3-bar-item w3-button" onclick="myAccFunc1()">이벤트</button>
  <div id="demoAcc1" class="w3-bar-block w3-hide w3-white w3-card-4">
    <a href="<%=cPath %>/index/event/event1.jsp" class="w3-bar-item w3-button">이벤트</a>
    <a href="<%=cPath %>/index/event/event2.jsp" class="w3-bar-item w3-button">쿠폰</a>
    <a href="<%=cPath %>/index/page/page4.jsp" class="w3-bar-item w3-button">3</a>
  </div>
  
  <button class="w3-bar-item w3-button" onclick="myAccFunc2()">고객지원</button>
   <div id="demoAcc2" class="w3-bar-block w3-hide w3-white w3-card-4">
    <a href="<%=cPath %>/index/page/page2.jsp" class="w3-bar-item w3-button">ㅂ</a>
    <a href="<%=cPath %>/index/page/page3.jsp" class="w3-bar-item w3-button">ㅈ</a>
    <a href="<%=cPath %>/index/page/page4.jsp" class="w3-bar-item w3-button">ㄷ</a>
  </div>
  
  
</nav>




<!-- Top menu -->
<div class="w3-top">
  <div class="w3-white w3-xlarge" style="max-width:1300px;margin:auto">
    <div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">☰</div>
    <div class="w3-right w3-padding-16">Mail</div>
    <div class="w3-center w3-padding-16">???가게 메뉴</div>
  </div>
</div>
  
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1300px;margin-top:100px;height:920px;width:1300px">
		
	<div class="w3-row-padding w3-padding-16 w3-center w3-tooltip" id="food">
		<table border="1" class="mypage" cellspacing="0" cellpadding="2" width="1250">
			<tr>
				<td colspan="2" height="5%">
					<div class="top">
						<span class="title"><b>마이페이지</b></span>
					</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<div class="setting">
						<div class="order" onclick="location.href='<%=cPath %>/mypage/personal.jsp'">
							<span class="title">개인정보 확인/수정</span>
						</div>
						
						<div class="order" onclick="location.href='<%=cPath %>/mypage/order.jsp'">
							<span class="title">주문내역</span>
						</div>	
						
						<div class="mile" onclick="location.href='<%=cPath %>/mypage/mile.jsp'">
							<span class="title">마일리지 적립/사용내역</span>
						</div>
						
						<div class="unregi" onclick="location.href='<%=cPath %>/mypage/unregi.jsp'">
							<span class="title">회원탈퇴</span>
						</div>
					</div>
				</td>
				<!-- 해당 위치 고정 -->
				<td rowspan="4" width="80%">
					<table cellspacing="0" cellpadding="2" width="100%" height="100%">
						<tr height="5%">
							<td align="center"><b>개인정보 확인/수정</b></td>	
						</tr>
						<tr height="50%">
							<td>
								<form action="<%=cPath %>/register/reg_proc.jsp" method="POST" class="joinForm" name="regFrom" style="transform: translate(-20%, -30%)">                                                                     
							      <div class="textForm">
							        <input name="mem_name" type="text" class="regi_name" placeholder="이름">
							      </div>
							      <div class="textForm">
							        <input name="mem_pw" type="password" class="pw" id="pw" placeholder="비밀번호" maxlength="23">
							        <div class="eyes_pw">
										<i id="ps_hide" onclick="password_visable('true')" class="on"></i>
										<i id="ps_show" onclick="password_visable('false')" style="display:none" class="off"></i>
									</div>
							      </div>
							       <div class="textForm">
							        <input name="loginPwConfirm" type="password" class="pw" id="pw_re" placeholder="비밀번호 확인" maxlength="23">
							        <div class="eyes_pw">
										<i id="ps_hide_re" onclick="re_password_visable('true')" class="on"></i>
										<i id="ps_show_re" onclick="re_password_visable('false')" style="display:none" class="off"></i>
									</div>
							      </div>
							      <div class="textForm">
							        <input name="mem_phone" type="text" maxlength="11" class="cellphoneNo" oninput="maxLengthCheck(this)" placeholder="전화번호" >
							      </div>
							      <input type="button" onclick="register()" class="btn" value="수 정 하 기"/>
							    </form>
							</td>
						</tr>
					</table>
				</td>
				<!-- 해당 위치 고정 -->
			</tr>
		</table>
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

</script>

</body>
</html>
