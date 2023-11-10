<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="menu.Menu_component_Bean"%>
<%  request.setCharacterEncoding("UTF-8");%>
<html>
<head>
	<title>재료 입고</title>
<link rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
function component_inputcheck(){
	if(document.cpntFrm.inventory.value==""){
		alert("재료를 입력해 주세요.");
		document.cpntFrm.code.focus();
		return;
	}
	document.cpntFrm.action = "iv01_p.jsp";
	document.cpntFrm.submit();
}
</script>
<body onLoad="cpntFrm.code.focus()">
	<div align="center">
		<br /><br />
		<form name="cpntFrm" method="post" action="iv01_p.jsp">
			<table cellpadding="5">
				<tr>
					<td>
						<table border="1" cellspacing="0" cellpadding="2" width="600">
							<tr>
								<td align="center" colspan="3"><font><b>재료 입고</b></font></td>
							</tr>
							<tr>
								<td>재료 이름</td>
								<td>
								<input name="component_name" size="15">
								</td>
								<td>재료</td>
							</tr>
							<tr>
								<td width="20%">재료 가격</td>
								<td width="50%">
									<input name="component_price" size="15" > 
								</td>
								<td width="30%">재료가격</td>
							</tr>
							<tr>
								<td width="20%">재료 수량</td>
								<td width="50%">
									<input name="component_amount" size="15" > 
								</td>
								<td width="30%">재료 수량</td>
							</tr>
						    <tr>
								<td width="20%">재료 이미지</td>
								<td width="50%">
									<input name="component_imgPath" size="15" > 
								</td>
								<td width="30%">재료 이미지</td>
							</tr>
								<td colspan="3" align="center">
								    <input type="button" value="재료등록" onclick="component_inputcheck()"> &nbsp; &nbsp; 
								    <input type="reset" value="다시쓰기"> &nbsp; &nbsp; 
  								    <input type="button" value="뒤로가기" onClick="loadContent('inventory/iv00.jsp')">						
								 </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>