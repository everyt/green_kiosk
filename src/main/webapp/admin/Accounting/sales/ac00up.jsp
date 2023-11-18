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
								<td width="20%">번호</td>
								<td width="50%">
									<input name="order_no" size="15" 
									value="<%=codeBean.getOrder_no()%>" readonly></td>
							</tr>
							<tr>
								<td>판매 일시</td>
								<td><input name="order_time" size="15"
									value="<%=codeBean.getOrder_time()%>" readonly ></td>
							</tr>
							<tr>
								<td>판매 내역</td>
								<td><input name="order_foods" size="30"
									value="<%=codeBean.getOrder_foods()%>"></td>
							</tr>
							<tr>
								<td>판매 금액</td>
								<td><input name="order_price" size="15"
									value="<%=codeBean.getOrder_price()%>"></td>
							</tr>
							<tr>
							     <td>할인</td>
							     <td><input name="order_discount" size="15"
							        value="<%=codeBean.getOrder_discount()%>"></td>
							 </tr>       
							<tr>
							     <td>쿠폰</td>
							     <td><input name="order_coupon" size="15"
							        value="<%=codeBean.getOrder_coupon()%>"></td>
							</tr>
							<tr>
							     <td>결제 방식</td>
							     <td><input name="order_type" size="15"
							        value="<%=codeBean.getOrder_type()%>"></td>
							</tr>
							<tr>
							     <td>마일리지</td>
							     <td><input name="order_use_mile" size="15"
							        value="<%=codeBean.isOrder_add_mile()%>"></td>
							</tr>
							<tr>
							     <td>주문현황</td>
							     <td><input name="order_use_amount" size="15"
							        value="<%=codeBean.getOrder_use_amount()%>"></td>
							</tr>
							<tr>
								<td colspan="3" align="center">
								<input type="submit" value="수정완료"> &nbsp; &nbsp; 
								<input type="reset" value="다시쓰기"> &nbsp; &nbsp; 
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