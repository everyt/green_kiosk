<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 쿠폰 만들기</title>
<script src="<%=request.getContextPath()%>/assets/js/admin/Event/coupon.js"></script>
<%@ include file="/admin/layouts/bootstrap.jsp"%>
<%@ include file="/admin/admin_check/check.jsp" %>  
<script>var contextpath="<%=request.getContextPath()%>"</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/admin/Menu_upload.css">
</head>
<body>

	<div class="container" style="margin-top: 50px" >
		<div class="row">
			<form name="uploadFrm" method="post" enctype="multipart/form-data" action="javascript:">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" rowspan="5" style="background-color: #eeeee; text-align:left;">쿠폰 등록</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5">
								<div class= input-group>
								        <div class="input-group-prepend">
								          <div class="input-group-text">쿠폰 이름</div>
								        </div>
									<input type="text" class="form-control" name="coupon_name" maxlength="20" required>
								</div>
							</td>
						</tr>
						<tr>
						<td>
								<div class= input-group>
							        <div class="input-group-prepend">
							          <div class="input-group-text">할인률 ( % )</div>
						        </div>
							<input type="number" class="form-control" id="menu_price" name="coupon_discount" maxlength="3" min="0" max="100" required>
								</div>
							</td>
								<td>
								<div class= input-group>
								        <div class="input-group-prepend">
								          <div class="input-group-text">발급 가능 여부</div>
								        </div>
										<label>
										  &nbsp;<input role="switch" type="checkbox" name="coupon_enable" id="coupon_enable" checked/>
										</label>
								</div>
							</td>
						</tr>
						<tr>
							<td align="center" >
								<div class="input-group" style="display:flex; margin-right:20px">
							        <div class="input-group-prepend" style="align-self:center; margin-right:20px">
							          <div class="input-group-text" style="margin-bottom:25px">쿠폰 사용가능 카테고리</div>
							          <div class="input-group-text">컨트롤을 누르고 여러개를 선택할수 있습니다</div>
							        </div>
								<select class="form-select" multiple aria-label="Default select example" name="category" id="category" style="height:20vh">
									<option selected value="단품">단품</option>
									<option selected value="음료">음료</option>
									<option selected value="세트">세트</option>
									<option selected value="사이드">사이드</option>
									<option selected value="이벤트">이벤트</option>
								</select>
								</div>
							</td>
							
							<td>

								
								 <div class="input-group-prepend">
							          <div class="input-group-text">쿠폰 유효 일자 (일, -1로 입력하면 무제한으로 설정됩니다.) </div>
						        </div>
								<input type="number" class="form-control" id="menu_price" name="coupon_vaild_date" maxlength="3" min="-1" required>
								<div class= input-group style="display:grid;">
								        <div class="input-group-prepend" style="align-self:center; justify-self:center;"> 
								          <div class="input-group-text">아래쪽에 쿠폰에 대한 설명을 입력해주세요.</div>
								        </div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<textarea class="form-control" name="coupon_desc" maxlength="20" style="height: 150px; width:100%" placeholder="쿠폰 설명" required></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<input type="submit" onclick="upload()" class="btn btn-success pull-right" value="등록하기">
		</form>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	
	
	</body>
</html>