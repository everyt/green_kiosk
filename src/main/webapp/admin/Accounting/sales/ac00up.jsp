<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="orders.Orders_Bean"%>
<%@ page import = "orders.Orders_Mgr" %>
<jsp:useBean id="ordersMgr" class="orders.Orders_Mgr"/>
<%
	String usid = (String) session.getAttribute("idKey");
	int numb = Integer.parseInt(request.getParameter("numb"));
	Orders_Bean codeBean = ordersMgr.getord1(numb);   //입력자료 가져오기
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
								<td colspan="3"><font color="#FFFFFF"><b>코드 자료 수정</b></font></td>
							</tr>
							<tr>
								<td width="20%">순서</td>
								<td width="50%">
									<input name="numb" size="15" 
									value="<%=codeBean.getOrder_no()%>" readonly></td>
							</tr>
							<tr>
								<td>사용자 아이디</td>
								<td><input name="id" size="15"
									value="<%=codeBean.getOrder_time()%>" readonly ></td>
							</tr>
							<tr>
								<td>코드</td>
								<td><input name="code" size="30"
									value="<%=codeBean.getOrder_foods()%>"></td>
							</tr>
							<tr>
								<td>차 크기</td>
								<td><input name="size" size="15"
									value="<%=codeBean.getOrder_price()%>"></td>
							</tr>
							<tr>
							     <td>기본 시간</td>
							     <td><input name="g_time" size="15"
							        value="<%=codeBean.getOrder_discount()%>"></td>
							 </tr>       
							<tr>
							     <td>기본 요금</td>
							     <td><input name="g_gum" size="15"
							        value="<%=codeBean.getOrder_coupon()%>"></td>
							</tr>
							<tr>
							     <td>이용 시간</td>
							     <td><input name="b_time" size="15"
							        value="<%=codeBean.getOrder_type()%>"></td>
							</tr>
							<tr>
							     <td>이용 요금</td>
							     <td><input name="b_gum" size="15"
							        value="<%=codeBean.getOrder_use_mile()%>"></td>
							</tr>
							<tr>
							     <td>정액제</td>
							     <td><input name="jung" size="15"
							        value="<%=codeBean.getOrder_use_amount()%>"></td>
							</tr>
							<tr>
							     <td>정액제</td>
							     <td><input name="jung" size="15"
							        value="<%=codeBean.getOrder_add_mile()%>"></td>
							</tr>
							<tr>
							     <td>정액제</td>
							     <td><input name="jung" size="15"
							        value="<%=codeBean.getOrder_is_maked()%>"></td>
							</tr>
							<tr>
							     <td>정액제</td>
							     <td><input name="jung" size="15"
							        value="<%=codeBean.get_who()%>"></td>
							</tr>
							<tr>
							     <td>정액제</td>
							     <td><input name="jung" size="15"
							        value="<%=codeBean.getOrder_is_togo()%>"></td>
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