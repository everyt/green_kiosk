<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit_page</title>
<%@ include file="/admin/layouts/BeanManager.jsp" %>
<%@ include file="/admin/layouts/bootstrap.jsp"%>
<%@ include file="/admin/admin_check/check.jsp" %>  
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/admin/Menu_upload.css">
</head>
<body>
<%
	int menu_no = 0;
	if(!request.getParameter("menu_no").equals(""))
	{
		menu_no = Integer.parseInt(request.getParameter("menu_no"));
	}
	menuBean = menuMgr.getMenu(menu_no); 
	String menu_name = menuBean.getMenu_name();
	String menu_gubn = menuBean.getMenu_gubn();
	String menu_imgPath = menuBean.getMenu_imgPath();
	int menu_price = menuBean.getMenu_price();
	String menu_content = menuBean.getMenu_content();
	int menu_isUse = menuBean.getMenu_isUse();
	int menu_isSale = menuBean.getMenu_isSale();
	
%>
		<script type="text/javascript">
		function down(filename, num){
			 document.downFrm.menu_imgPath.value=filename;
			 document.downFrm.submit();
		}
		</script>
		
	<div class="container" style="margin-top: 50px" >
		<div class="row">
			<form name="uploadFrm" method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/admin/Menu/EditProc.jsp?menu_no=<%=menu_no%>" onSubmit="return validateForm()">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" rowspan="5" style="background-color: #eeeee; text-align:left;">상품 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5">
								<div class= input-group>
								        <div class="input-group-prepend">
								          <div class="input-group-text">상품명</div>
								        </div>
									<input type="text" class="form-control" name="menu_name" maxlength="150" value="<%=menu_name%>">
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
								        <option value="단품" <%= "단품".equals(menu_gubn) ? "selected" : "" %>>단품</option>
								        <option value="음료" <%= "음료".equals(menu_gubn) ? "selected" : "" %>>음료</option>
								        <option value="세트" <%= "세트".equals(menu_gubn) ? "selected" : "" %>>세트</option>
								        <option value="재료" <%= "재료".equals(menu_gubn) ? "selected" : "" %>>재료</option>
								        <option value="사이드" <%= "사이드".equals(menu_gubn) ? "selected" : "" %>>사이드</option>
								        <option value="이벤트" <%= "이벤트".equals(menu_gubn) ? "selected" : "" %>>이벤트</option>
								    </select>
								</div>
							</td>
								<td>
								<div class= input-group>
								        <div class="input-group-prepend">
								          <div class="input-group-text">사용여부</div>
								        </div>
										<label>
	 											&nbsp;<input role="switch" type="checkbox" name="menu_isUse" value="on" <% if (menu_isUse == 1) { %> checked <% } %>>
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
							<input type="text" class="form-control" id="menu_price" name="menu_price" maxlength="30" value="<%=menu_price%>">
								</div>
							</td>
								<td>
								<div class= input-group>
								        <div class="input-group-prepend">
								          <div class="input-group-text">행사여부</div>
								        </div>
										<label>
										  &nbsp;<input role="switch" type="checkbox" name="menu_isSale" value="on"<% if (menu_isSale == 1) { %> checked <% } %>>
										</label>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<textarea class="form-control" name="menu_content" maxlength="2048" style="height: 150px; width:100%;">
								<%=menu_content%>
								</textarea>
							</td>
						</tr>
					</tbody>
				</table>
					<div class="mb-3">
						<a href="javascript:void(0);" onclick="down('<%=menu_imgPath%>')"><%=menu_imgPath%></a>
					  <input class="form-control" type="file" id="formFile" name="menu_imgPath" value="<%=menu_imgPath%>">
					</div>
					  <input type="text" name="menu_imgPath" id="menu_imgPath" value="<%=menu_imgPath%>" style="display: none;">
				<input type="submit" class="btn btn-success pull-right" value="수정하기">
				<input type="button" class="btn btn-danger" value="삭제하기" onclick="deleteMenu('<%=menu_no%>')">
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
<script>
	function deleteMenu(menu_no)
	{
		location.href = "Delete.jsp?menu_no=" + menu_no; 
	}
</script>
			<form name="downFrm" action="download.jsp" method="post">
				<input type="hidden" name="menu_imgPath">
			</form>
	</body>
</html>