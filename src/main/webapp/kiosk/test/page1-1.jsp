<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="menu.Menu_menu_Bean" %>
<%@ page import="java.util.Vector" %>
<link href="style1.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet">

<jsp:useBean id="mMgr" class="menu.Manager_Menu"  />

<html>
<head>
</head>
<body>
<div class="container">
	 <div class="head color1" align="center">	<h1>???가게 메뉴판</h1> <br>
	 </div>
	 <div class="main color1" align="center">	<h1>단 품</h1> <br>
	 </div>


	 	 
<div class="foods" style="display:block">
<%
	Vector<Menu_menu_Bean> vector = mMgr.getMenuList();
	
	int menuLength = vector.size();

	if (vector.isEmpty()){
		out.println("등록된 메뉴가 없습니다.");
	} else {
		int last = 0;
		for (int i = 0; i < menuLength; i++) {
			Menu_menu_Bean bean = vector.get(i);
			System.out.println(i);
%>

  
<!-- !PAGE CONTENT! -->

	
	<div class="item1">
	 		  <img style="max-width:50%; max-height:50%;" src="../images/<%=bean.getMenu_imgPath()%>" >
		      <h3><%=bean.getMenu_name()%></h3>
			  <p><%=bean.getMenu_content()%></p>
			  <p><%=bean.getMenu_price() %>
	<div class="jumoon w3-button "onclick="jumoon()">
				<h3>장바구니 담기</h3>	
	
	</div>
	   </div>
<%
	
} //for
	}

%>
</div>







<script>
function jumoon() {
	location.href = "test.jsp";

	}		
</script>

</body>
</html>
