<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<th>해당 쿠폰으로 발급 가능한 메뉴</th>
				<th>발급 가능 여부</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<tr align="center">
				<td >1</td>
				<td>신규 가입 환영 쿠폰</td>
				<td>신규 유저에게 발급되는 쿠폰입니다</td>
				<td>무제한</td>
				<td>제한 없음</td>
				<td>O</td>
				<td>수정</td>
				<td>삭제 불가능</td>
			</tr>
		</tbody>
	</table>
	<a href="javascript:void(0)" class="btn btn-primary my-2" onclick="openPopup('/green_kiosk/admin/Event/coupon_make.jsp')">쿠폰 등록하기</a>
</div>
</body>
</html>