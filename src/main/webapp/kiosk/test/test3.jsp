<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="menu.Menu_menu_Bean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="mMgr" class="menu.Manager_Menu"  />
<link href="style1.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet">

<html>

<head>

	 
	 
	 
</head>
<body>
<div class="container">

	 <div class="head color1" align="center">	<h1>KIOSK</h1> <br>
	 </div>
	 <div class="main color2" align="center">	
	 	<div class="page w3-button"onclick="jumoon0()" ><h2>단 품</h2></div>
	 	<div class="page w3-button"onclick="jumoon1()" ><h2>세 트</h2></div>
	 	<div class="page w3-button"onclick="jumoon2()" ><h2>음 료 수</h2></div>
	 	<div class="page w3-button"onclick="jumoon3()" ><h2>사 이 드</h2></div>
	 </div>

	<div class="item1 w3-button"onclick="jumoon()">
		<div class="rowbox">
 			<img src="../images/hamburger0.jpg" >
 				<div class="colbox">
 				  <H1>데리버거</H1>
 				  <h2 style="color:blue;" >3500~</h2>
 				 </div>
		</div>
	</div>
	
	<div class="item2">
		<div class="rowbox">
 			<img src="../images/hamburger1.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					 <h2>1121212</h2>
 				</div>
		</div>
	</div>
	
	<div class="item3">
		<div class="rowbox">
 			<img src="../images/hamburger2.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					 <h2>1121212</h2>
 				</div>
		</div>
	</div>
	
	<div class="item4">
		<div class="rowbox">
 			<img src="../images/hamburger3.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					 <h2>1121212</h2>
 				</div>
		</div>
	</div>
	
	<div class="item5">
		<div class="rowbox">
 			<img src="../images/hamburger4.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					 <h2>1121212</h2>
 				</div>
		</div>	
	</div>
	
	<div class="item6">
		<div class="rowbox">
 			<img src="../images/hamburger5.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					 <h2>1121212</h2>
 				</div>
		</div>
	</div>
	
	<div class="item7">
		<div class="rowbox">
 			<img src="../images/hamburger6.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					 <h2>1121212</h2>
 				</div>
		</div>	
	</div>
	
	<div class="item8">
		<div class="rowbox">
 			<img src="../images/hamburger7.jpg" >
 				<div class="colbox">
 				     <H1>데리버거</H1>
 					 <h2>1121212</h2>
 				</div>
		</div>	
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
	
	
</script>

</body>
</html>
