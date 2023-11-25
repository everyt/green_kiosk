<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post_view page</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/board/layout.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/board/boardView.css">
<script src="<%=request.getContextPath()%>/assets/js/board/boardView.js"></script>
<%@ include file="/board/bootstrap.jsp" %>
<%@include file="/board/layouts/Bean.jsp" %>
<%@include file="/board/layouts/header.jsp" %>

</head>
<body>
<%@include file="/board/layouts/sidebar.jsp" %>

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
	    	
	        HttpServletRequest requestPage = (HttpServletRequest) pageContext.getRequest();

	        String CurrentUrl = requestPage.getRequestURL()+"?post_no=" + post_no;

	    	
	%>
	
<br/><br/>
<div class="container">
    <div class="row">
        <div class="mainDivid" id="mainDivid-1">
        <div class="page_category" id="page_category">게시글 읽기</div>
        <hr>
        </div>
        <div class="post-details">
            <table>
                <tr>
                    <td colspan="2">
                    <br/>
                        <h1 class="post_title" id="boardView_post_title"><%= post_title %></h1>
                        <br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;<span class="post_writer_id" id="boardView_post_writer_id"><%= post_writer_id %></span>
                         &nbsp; | &nbsp; <img src="<%=request.getContextPath()%>/assets/images/board/clock.svg">&nbsp;<%= post_time.substring(0, 19) %>
                    <br/>
                    </td >
                    
                    <td>
	                    <div class="icons_in_header" id="icons_in_header">
	                   		 <img src="<%=request.getContextPath()%>/assets/images/board/eye.svg"><%=post_viewcount%>
	                   		 <img src="<%=request.getContextPath()%>/assets/images/board/hand-thumbs-up.svg"><%=post_likecount%>
	                    </div>		
                    </td>            
                </tr>
            </table>
              <div class="under_title">
              <hr>
              <div class="currentPageUrl" id="currentPageUrl" onclick="copyToClipboard('<%=CurrentUrl%>')">	
              	<img src="<%=request.getContextPath()%>/assets/images/board/clipboard.svg">&nbsp;<%=CurrentUrl%>
              </div>
			        <div class="post-content">
			            <div style="min-height: 400px; text-align: left; padding: 15px;">
			                <pre><%= post_content %></pre>
			            </div>
			        </div>
              </div>
				<div class="recommend-button" onclick="toggleRecommendation(this)">
				    <img class="recommend-icon" src="<%=request.getContextPath()%>/assets/images/board/hand-thumbs-up.svg" alt="Thumbs Up">
				    <span class="recommend-label">추천 <%=post_likecount%></span>
				</div>
        </div>
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