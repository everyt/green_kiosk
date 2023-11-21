<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="menu.Menu_menu_Bean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="mMgr" class="menu.Manager_Menu"  />
<link href="style1.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet">
<link rel='stylesheet' href='../../assets/css/micromodal.css' />
<script src='https://unpkg.com/micromodal/dist/micromodal.min.js'></script>

<html>

<head>

</head>
<body>
<div class="container">

	 <div class="head color1" align="center">	<h1>KIOSK</h1> <br>
	 </div>
	 <div class="main color2" align="center">	
	 	<div class="page "onclick="jumoon0()" ><h2>단 품</h2></div>
	 	<div class="page "onclick="jumoon1()" ><h2>세 트</h2></div>
	 	<div class="page "onclick="jumoon2()" ><h2>음 료 수</h2></div>
	 	<div class="page "onclick="jumoon3()" ><h2>사 이 드</h2></div>
	 </div>

	<div class="item1 "onclick="jumoon()">
		<div class="rowbox">
 			<img src="../images/hamburger0.jpg" >
 				<div class="colbox">
 				  <H1>데리버거</H1>
 				  <h2 style="color:blue;" >3500~</h2>
 				 </div>
		</div>
	</div>
	
	<div class="item2" onclick="jumoon()">
		<div class="rowbox">
 			<img src="../images/hamburger1.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item3 w3-button" onclick="jumoon()">
		<div class="rowbox">
 			<img src="../images/hamburger2.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item4" onclick="jumoon()">
		<div class="rowbox">
 			<img src="../images/hamburger3.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 				 	 <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item5" onclick="jumoon()">
		<div class="rowbox">
 			<img src="../images/hamburger4.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 				  	<h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>
	
	<div class="item6" onclick="jumoon()">
		<div class="rowbox">
 			<img src="../images/hamburger5.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item7" onclick="jumoon()">
		<div class="rowbox">
 			<img src="../images/hamburger6.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>
	
	<div class="item8" onclick="jumoon()">
		<div class="rowbox">
 			<img src="../images/hamburger7.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>



  <div class="modal micromodal-slide" id="modal-1" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1" data-micromodal-close>
      <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
        <main class="modal__content" id="modal-1-content">
          <p>
            결제 처리중입니다. 잠시만 기다려주세요...
          </p>
        </main>
      </div>
    </div>
  </div>









	
<div class="jumoon color1" align="center">
 				<div class="colbox">
				<h1>주문내역</h1>
				</div>
				<div class="colbox">
				<h1>~개</h1>				
				</div>
				<div class="colbox">
				<h1 style="color:blue">가격 : </h1>
				</div>				
</div>	
	
	
	
<div class="naeyeok">
					<div>
 				     <H1>데리버거</H1>
 				    </div>
 				    <div>
 				     <H1>데리버거</H1>
 				    </div>
 				    <div>
 				     <H1>데리버거</H1>
 				    </div>
 				    <div>
 				     <H1>데리버거</H1>
 				    </div>
 				    
</div>
		<div class="qqq" onclick="jumoon"><h1>A!!!!!!!</h1></div>
		<div class="qqq1"><h1>A!!!!!!!</h1></div>
	

	
	
</div>
		


<%
	Vector<Menu_menu_Bean> vector = mMgr.getMenuList(type);
	
	int menuLength = vector.size();

	if (vector.isEmpty()){
		out.println("등록된 메뉴가 없습니다.");
	} else {
		for (int i = 0; i < menuLength; i++) {
			Menu_menu_Bean bean = vector.get(i);
			
%>

<%
		}
	}

%>








<script>
function jumoon0() {
	location.href = "test.jsp";
}		
function jumoon1() {
	location.href = "test2.jsp";
}		
function jumoon2() {
	location.href = "test3.jsp";
}		
function jumoon3() {
	location.href = "test4.jsp";
}		
	

function jumoon(){
	url = "test1-1.jsp?;"
	window.open(url, "test1-1","width=50%.height=100%,scrollbars=yes");
}
	MicroModal.init();
</script>

</body>
</html>
