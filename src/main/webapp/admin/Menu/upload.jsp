<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/admin/layouts/bootstrap.jsp"%>
<%@ include file="/admin/admin_check/check.jsp" %>  
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/admin/Menu_upload.css">
</head>
<body>
	<div class="container" style="margin-top: 50px" >
		<div class="row">
			<form name="uploadFrm" method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/admin/Menu/uploadProc.jsp" onSubmit="return validateForm()">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" rowspan="5" style="background-color: #eeeee; text-align:left;">상품 등록</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5">
								<div class= input-group>
								        <div class="input-group-prepend">
								          <div class="input-group-text">상품명</div>
								        </div>
									<input type="text" class="form-control" name="menu_name" maxlength="150">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class= input-group>
							        <div class="input-group-prepend">
							          <div class="input-group-text">카테고리</div>
							        </div>
								<select class="form-select" aria-label="Default select example" name="menu_gubn">
								  <option selected>단품</option>
								  <option value="음료">음료</option>
								  <option value="세트">세트</option>
								  <option value="재료">재료</option>
								  <option value="사이드">사이드</option>
								  <option value="이벤트">이벤트</option>
								</select>
								</div>
							</td>
								<td>
								<div class= input-group>
								        <div class="input-group-prepend">
								          <div class="input-group-text">사용여부</div>
								        </div>
										<label>
										  &nbsp;<input role="switch" type="checkbox" name="menu_isUse"/>
										</label>
								</div>
							</td>
						</tr>
						<tr>

							<td>
								<div class= input-group>
							        <div class="input-group-prepend">
							          <div class="input-group-text">가격</div>
						        </div>
							<input type="text" class="form-control" id="menu_price" name="menu_price" maxlength="30">
								</div>
							</td>
								<td>
								<div class= input-group>
								        <div class="input-group-prepend">
								          <div class="input-group-text">행사여부</div>
								        </div>
										<label>
										  &nbsp;<input role="switch" type="checkbox" name="menu_isSale" />
										</label>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<textarea class="form-control" name="menu_content" maxlength="2048" style="height: 150px; width:100%" placeholder="상품설명">
								</textarea>
							</td>
						</tr>
					</tbody>
				</table>
					<div class="mb-3">
					  <input class="form-control" type="file" id="formFile" name="menu_imgPath">
					</div>
				<input type="submit" class="btn btn-success pull-right" value="등록하기">
		</form>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function validateForm() {
	    var menuPrice = document.getElementById("menu_price").value;
	    if (menuPrice == null || menuPrice.trim() === "" || isNaN(menuPrice)) {
	        alert("가격은 숫자로 입력하세요.");
	        return false;
	    }
	}
</script>

	</body>
</html>