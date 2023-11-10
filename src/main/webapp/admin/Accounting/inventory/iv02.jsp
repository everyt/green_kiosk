<%@ page language="java" contentType="text/html; charset=UTF-8"%>>
<%@ page import="menu.Menu_component_Bean"%>
<jsp:useBean id="menuMgr" class="menu.Manager_Menu"/>
<%
	String usid = (String) session.getAttribute("idKey");
	int numb = Integer.parseInt(request.getParameter("numb"));
	Menu_component_Bean cmBean = menuMgr.getComponent1(numb);   //입력자료 가져오기
%>
<html>
<head>
	<title>코드관리</title>
	<link href="../main/style.css" rel="stylesheet" type="text/css" >
</head>

<body bgcolor="#FFFFCC" onLoad="regFrm.code.focus()">
	<div align="center">
		<br /> <br />
		<form name="regFrm" method="post" action="code02_p.jsp" >
			<table align="center" cellpadding="5" >
				<tr>
					<td align="center" valign="middle" bgcolor="#FFFFCC">
						<table border="1" cellpadding="2" align="center" width="600">
							<tr align="center" bgcolor="#996600">
								<td colspan="3"><font color="#FFFFFF"><b>재고 목록 수정</b></font></td>
							</tr>
							<tr>
								<td width="20%">순서</td>
								<td width="50%">
									<input name="component_no" size="15" 
									value="<%=cmBean.getComponent_no()%>" readonly></td>
							</tr>
							<tr>
								<td>재료 이름</td>
								<td><input name="component_name" size="15"
									value="<%=cmBean.getComponent_name()%>" readonly ></td>
							</tr>
							<tr>
								<td>재료 가격</td>
								<td><input name="component_price" size="30"
									value="<%=cmBean.getComponent_price()%>"></td>
							</tr>
							<tr>
								<td>재료 수량</td>
								<td><input name="component_amount" size="15"
									value="<%=cmBean.getComponent_amount()%>"></td>
							</tr>
							
							<tr>
							     <td>재료 이미지</td>
							     <td><input name="component_imgPath" size="15"
							        value="<%=cmBean.getComponent_imgPath()%>"></td>
							</tr>        
							<tr>
								<td colspan="3" align="center">
								<input type="submit" value="수정완료"> &nbsp; &nbsp; 
								<input type="reset" value="다시쓰기"> &nbsp; &nbsp; 
								<input type="button" value="자료삭제" onClick="location.href='code03.jsp?numb=<%=numb%>'"> &nbsp; &nbsp;
								<input type="button" value="신규코드" onClick="location.href='code01.jsp'"> &nbsp; &nbsp;
								<input type="button" value="코드목록" onClick="history.go(-1)"></td>						
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>