<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="menu.Menu_menu_Bean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="mMgr" class="menu.Manager_Menu"  />
<link href="style3.css" rel="stylesheet" type="text/css">
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

	<div class="item1 "onclick="hrefTo()">
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
	
	<div class="item3 " onclick="jumoon()">
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
	
	<div class="item7" onclick="btn-open-popup()">
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
            결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
       결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
        결제 처리중입니다. 잠시만 기다려주21231231231231232131231세요...
             
          </p>
        </main>
      </div>
    </div>
  </div>
  


    <button class="btn-open-popup">Modal 띄우기</button>

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
	

		


<%
	Vector<Menu_menu_Bean> vector = mMgr.getMenuList();
	
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

	MicroModal.init();

function modal() {
	

    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('.btn-open-popup');

    btnOpenPopup.addEventListener('click', () => {
      modal.style.display = 'block';
    });
	
}	
	
MicroModal.init();

	const back = () => {
	  localStorage.setItem('mobile', false);
	  location.href = 'main.jsp';
	}
	const hrefTo = (type) => {
	  localStorage.setItem('paymentType', type);
	  MicroModal.show('modal-1');
	  setTimeout(() => {
	  }, 2500)
}	
	
	
</script>

</body>
</html>
