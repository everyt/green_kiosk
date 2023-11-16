<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "coupon.Coupon_kind_Bean" %>
<%@ page import = "coupon.Coupon_kind_Mgr" %>
<%@ page import = "java.util.Vector" %>
<%
Coupon_kind_Mgr mgr = new Coupon_kind_Mgr();
Vector<Coupon_kind_Bean> Kinds = mgr.readAllKind();
%>
<!DOCTYPE html>
<html>
<head>
	<style>
		td, th {
			border-width:2px;
			padding: 3px 20px;
		}
	</style>
</head>
<body>
<div style="display: grid; justify-content: center; width: 100%;">
	<table width="100%" border=1  cellpadding=2 cellspacing=10 style="display: grid;border-collapse: collapse; margin-top: 4%;">
		<tbody id="coupons">
			<tr align="center">
				<th>쿠폰 번호</th>
				<th>쿠폰 이름</th>		
				<th>쿠폰 설명</th>
				<th>유효기간</th>
				<th>해당 쿠폰으로 발급 가능한 카테고리</th>
				<th>발급 가능 여부</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<%for (Coupon_kind_Bean bean : Kinds) { 
				String vaild_date = "";
				if (bean.getVaild_date() == -1) {
					vaild_date = "무제한";
				} else {
					vaild_date = bean.getVaild_date()+" 일";
				}
			%>
				<tr align="center">
					<td><%=bean.getNumb() %></td>
					<td><%=bean.getName() %></td>
					<td><%=bean.getDesc() %></td>
					<td><%=vaild_date %></td>
					<td><%=bean.getCategory().toString().replace("[", "").replace("]", "") %></td>
					<% if (bean.isEnable()) { %>
						<td>발급 가능</td>
					<%} else { %>
						<td>발급 불가능</td>
					<%} %>
					
					<td>수정</td>
					
					<% if (bean.isDefault_coupon()) {%>
						<td>삭제 불가능</td>
					<%} else { %>
						<td>삭제</td>
					<%} %>
				</tr>
			<%} %>
		</tbody>
	</table>
	<a href="javascript:void(0)" class="btn btn-primary my-2" onclick="openPopup('/green_kiosk/admin/Event/coupon_make.jsp')">쿠폰 등록하기</a>
</div>
</body>
</html>