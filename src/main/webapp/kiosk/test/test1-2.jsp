<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="menu.Menu_menu_Bean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="mMgr" class="menu.Manager_Menu"  />
<link href="style2.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet">

<html>

<head>

</head>
<body>
<div class="container">

	 <div class="head color1" align="center">	<h1>KIOSK</h1>
	 </div>
	 <div class="main color2" align="center">	
	 	<div class="page "onclick="jumoon0()" ><h2>디 저 트</h2></div>
	 	<div class="page "onclick="jumoon1()" ><h2>음 료 수</h2></div>
	</div>

	<div class="item1 ">
		<div class="rowbox">
 			<img src="../images/cola.jpg" >
 				<div class="colbox">
 				  <H1>데리버거</H1>
 				  <h2 style="color:blue;" >3500~</h2>
 				 </div>
		</div>
	</div>
	
	<div class="item2">
		<div class="rowbox">
 			<img src="../images/cola1.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item3">
		<div class="rowbox">
 			<img src="../images/saida.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item4">
		<div class="rowbox">
 			<img src="../images/saida1.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 				 	 <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item5">
		<div class="rowbox">
 			<img src="../images/milkiseu.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 				  	<h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>
	
	<div class="item6">
		<div class="rowbox">
 			<img src="../images/mauntindyu.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>
	</div>
	
	<div class="item7">
		<div class="rowbox">
 			<img src="../images/fanta.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
 				</div>
		</div>	
	</div>
	
	<div class="item8">
		<div class="rowbox">
 			<img src="../images/orange juice.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					  <h2 style="color:blue;" >3500~</h2>
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
	

		<div class="qqq"><h1>취소하기</h1></div>
		<div class="qqq1"><h1>계산하기</h1></div>
	
	
	
	
	
	
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
function jumoon0() {
	location.href = "test1-1.jsp";
}		
function jumoon1() {
	location.href = "test1-2.jsp";
}		
function jumoon2() {
	location.href = "test1-1.jsp";
}		
function jumoon3() {
	location.href = "test1-1.jsp";
}		
	

function jumoon(numb,moim){
	url = "test1-1.jsp?numb=" + numb + "&d_moim=" + moim;
	window.open(url, "don00_yogum","width=1000,height=500,scrollbars=yes");
}

</script>

</body>
</html>
