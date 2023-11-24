<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post_view page</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/board/boardView.css">
<%@include file="/board/layouts/Bean.jsp" %>
</head>
<body>
	<%
		Long post_no = Long.parseLong(request.getParameter("post_no"));
		
		BoardMgr bMgr = new BoardMgr();
		boardBean bean = bMgr.getBoard(post_no);
		
	    String post_time = null;
	    String post_title = null;
	    String post_content = null;
	    String post_filePath = null;
	    Long post_writer = 0L;
	    String post_writer_id = null;
	    Long post_viewcount = 0L;
	    Long post_likecount = 0L;
	    Long count = 0L;

	    	post_no = bean.getPost_no();
	    	post_time = bean.getPost_time();
	    	post_title =  bean.getPost_title();
	    	post_content = bean.getPost_content();
	    	post_filePath = bean.getPost_filePath();
	    	post_writer = bean.getPost_writer();
	    	post_writer_id = bMgr.findUser(post_writer);
	    	post_viewcount = bean.getPost_viewcount();
	    	post_likecount = bean.getPost_likecount(); 
	%>
	

<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan = "3" style="background-color: #dddddd; text-align:center;"> 게시글 읽기 </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><strong>제목</strong></td>
					<td colspan ="2" style="padding-right:230px;"><%=post_title %> &nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td><strong>이름 / 작성일자</strong></td>
					<td style="padding-right:230px"><span class="post_writer_id"><%=post_writer_id %></span> &nbsp; | &nbsp; <%=post_time.substring(0,19) %></td>
				</tr>
			<tr>
   		</tr>
				<tr>
					<td><strong><br/>내용</strong></td>
					<td colspan="2" style="min-height: 700px; text-align: left; padding-right:10px;"> 
						 <br/><pre><%=post_content%></pre><br/>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</div>
	
<!--  여긴 댓글 구간  -->
<div class="boardView_comment">
	<section class="mb-5">
	    <div class="card bg-light">
	        <div class="card-body">
	            <!-- Comment form-->
	            <form class="mb-4"><textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea></form>
	            <!-- Comment with nested comments-->
	            <div class="d-flex mb-4">
	                <!-- Parent comment-->
	                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
	                <div class="ms-3">
	                    <div class="fw-bold">Commenter Name</div>
	                    If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
	                    <!-- Child comment 1-->
	                    <div class="d-flex mt-4">
	                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
	                        <div class="ms-3">
	                            <div class="fw-bold">Commenter Name</div>
	                            And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
	                        </div>
	                    </div>
	                    <!-- Child comment 2-->
	                    <div class="d-flex mt-4">
	                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
	                        <div class="ms-3">
	                            <div class="fw-bold">Commenter Name</div>
	                            When you put money directly to a problem, it makes a good headline.
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <!-- Single comment-->
	            <div class="d-flex">
	                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
	                <div class="ms-3">
	                    <div class="fw-bold">Commenter Name</div>
	                    When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
</div>
<!-- 댓글 구간 끝 -->
</body>
</html>