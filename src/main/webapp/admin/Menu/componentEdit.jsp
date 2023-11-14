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
	int component_no = 0; 
	if(!request.getParameter("component_no").equals(""))
	{
		component_no = Integer.parseInt(request.getParameter("component_no"));
	}
	menuComponentBean = menuMgr.getComponent1(component_no);
	String component_name = menuComponentBean.getComponent_name();
	int component_price = menuComponentBean.getComponent_price();
	int component_amount = menuComponentBean.getComponent_amount();
	String component_imgPath = menuComponentBean.getComponent_imgPath();
	int component_isUse = menuComponentBean.getComponent_isUse(); 
	int component_isTopping = menuComponentBean.getComponent_isTopping();
%>

		<script type="text/javascript">
		function down(filename, num){
			 document.downFrm.menu_imgPath.value=filename;
			 document.downFrm.submit();
		}
		</script>
		
	<div class="container" style="margin-top: 50px" >
		<div class="row">
			<form name="uploadFrm" method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/admin/Menu/componentEditProc.jsp?component_no=<%=component_no%>" onSubmit="return validateForm()">
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
									<input type="text" class="form-control" name="component_name" maxlength="150" value="<%=component_name%>">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class= input-group>
							        <div class="input-group-prepend">
							          <div class="input-group-text">카테고리</div>
							        </div>
								    <select class="form-control"  name="component_gubn">
								    	<option selected>재료</option>
								    </select>
								</div>
							</td>
								<td>
								<div class= input-group>
								        <div class="input-group-prepend">
								          <div class="input-group-text">사용여부</div>
								        </div>
										<label>
	 											&nbsp;<input role="switch" type="checkbox" name="component_isUse" value="on" <% if (component_isUse == 1) { %> checked <% } %>>
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
							<input type="text" class="form-control" id="component_price" name="component_price" maxlength="30" value="<%=component_price%>">
								</div>
							</td>
								<td>
								<div class= input-group>
								        <div class="input-group-prepend">
								          <div class="input-group-text">토핑 여부</div>
								        </div>
										<label>
										  &nbsp;<input role="switch" type="checkbox" name="component_isTopping" value="on"<% if (component_isTopping == 1) { %> checked <% } %>>
										</label>
								</div>
							</td>
						</tr>
						<tr>
					<td colspan="5">
						<div class= input-group>
					        <div class="input-group-prepend">
					          <div class="input-group-text">수량</div>
					               </div>
							<input type="text" class="form-control" id="component_amount" name="component_amount"  value="<%=component_amount%>" readonly>
							</div>
							</td>
						</tr>
					</tbody>
				</table>
					<div class="mb-3">
						<a href="javascript:void(0);" onclick="down('<%=component_imgPath%>')"><%=component_imgPath%></a>
					  <input class="form-control" type="file" id="formFile" name="component_imgPath" value="<%=component_imgPath%>">
					</div>
					  <input type="text" name="component_imgPath" id="component_imgPath" value="<%=component_imgPath%>" style="display: none;">
				<input type="submit" class="btn btn-success pull-right" value="수정하기">
				<input type="button" class="btn btn-danger" value="삭제하기" onclick="deleteComponent('<%=component_no%>')">
		</form>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function validateForm() {
	    var component_price = document.getElementById("component_price").value;
	    if (component_price == null || component_price.trim() === "" || isNaN(component_price)) {
	        alert("가격은 숫자로 입력하세요.");
	        return false;
	    }
	}
</script>
<script>
	function deleteComponent(component_no)
	{
		location.href = "DeleteComponent.jsp?component_no=" + component_no; 
	}
</script>
			<form name="downFrm" action="download.jsp" method="post">
				<input type="hidden" name="component_imgPath">
			</form>
	</body>
</html>