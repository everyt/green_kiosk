<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"%>
<%@ page import="orders.Orders_Bean"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.reflect.TypeToken" %>
<jsp:useBean id="menuMgr" class="menu.Manager_Menu"/>

<%
	Gson gson = new Gson();
     //페이징을 위한 변수 선언
    int totalRecode = 0;     //전체 글의 갯수
    int numPerPage = 10;     //페이지당 레코드 수
    int pagePerBlock = 15;   //한 블럭당 묶여질 페이지 수
    int nowPage=0;    //현재 보여질 페이지
    int nowBlock=0;   //현재 보여질 블럭
    int listSize=0;   //현재 읽어온 게시물의 수
    int totalPage=0;  //전체 페이지 수
    int totalBlock=0; //전체 블럭수
    int start = 0;   //orders테이블의 selct시작번호
    int end = 10;    //시작번호로 부터 가져올 selec의 개수
 	Vector<Orders_Bean> vlist = null;
	int numb = 0;
	   vlist = menuMgr.getMgrorderList();
	   
	   if(request.getParameter("nowPage") !=null) {
		   nowPage = Integer.parseInt(request.getParameter("nowPage"));
	   }
	     start = (nowPage * numPerPage) - numPerPage;
	     end = numPerPage;
	nowBlock=(int)Math.ceil((double)nowPage/pagePerBlock);
	totalBlock =(int)Math.ceil((double)nowPage/pagePerBlock);
	
	
%>
<!DOCTYPE html>
<html>
<head>
	<title>코드관리</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/admin/account/account.js"></script>
<link rel="stylesheet" href="/post_inc/datatables/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>

<style>
table {
  border-collapse: collapse;
  width:90%;
}
 
.text-over-cut {
  display: block;
  width: 200px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  margin: 0;
}
</style>

<script type="text/javascript">
  $(document).ready(function(){ 

  });

  function pageing(page){
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	
	function block(value){
		document.readFrm.nowPage.value = <%=pagePerBlock%>*(value-1)+1;
		document.readFrm.submit();
	}
</script>
	

     </head>
<body leftmargin="0" topmargin="0">

<div align="center">
    <br/>
		<h2>매장 관리 페이지</h2>
    <br>
			 <%     
			          
			           listSize = vlist.size();
               	       if (vlist.isEmpty()) {
               	    	   out.println("등록된 목록이 없습니다.");
               	    	   
               	       } else {
              %>
		
				  <table  border="1">
				  <thead>
				  <tr>
			<th colspan="11">코드 등록 자료수 : <%=listSize-((nowPage-1)*numPerPage)-1%></th>
		</tr>
				  </thead>
				  <tbody class="getMenuList" id="getMenuList">
					<tr align="center" bgcolor="#D0D0D0" height="120%">
						<td>번호</td>
						<td>판매 일시</td>
						<td>판매 내역</td>
						<td>판매 금액</td>
						<td>할인</td>
						<td>쿠폰</td>
						<td>결제 방식</td>
						<td>마일리지</td>
						<td>주문 현황</td>
						<td>수정</td>
						<td>삭제</td>
					</tr>
				</tbody>
				<%
				    for( int i = 0; i<numPerPage; i++) {
				    	if (i == listSize)break;
				    	Orders_Bean bean = vlist.get(i);
				    	int order_no = bean.getOrder_no();
				    	Timestamp order_time = bean.getOrder_time();
				    	String order_foods = bean.getOrder_foods();
				    	int order_price = bean.getOrder_price();
				    	int order_discount = bean.getOrder_discount();
				    	String order_coupon = bean.getOrder_coupon();
				    	String order_type = bean.getOrder_type();
				    	boolean order_use_mile = bean.isOrder_use_mile();
				    	int order_use_amount = bean.getOrder_use_amount();
				    	
				    %>
				    <tr>
				       <td align="center">
				       <%=listSize-((nowPage-1)*numPerPage)-i%>
				       </td>
              <td>
           
              <a href="javascript:read(<%=order_no%>)"> </a>
              </td>
              </tr>
				<%}//for%>
				<%
				}//if
				%> 
		
		<tr>
		 <td colspan="2"><br /><br /></td>
		 </tr>
		 <tr>
		 <td>
		 <!-- 페이징 및 블럭처리 Start -->
		 		 <%
		          int pageStart = (nowBlock -1)*pagePerBlock + 1;//하단 페이지 시작번호
			      int pageEnd = ((pageStart + pagePerBlock)< totalPage)? (pageStart+pagePerBlock): totalPage+1;
		         if(totalPage !=0) {
		        	 if(nowBlock > 1) {%>
		        	 <a href="javascript:block('<%=nowBlock-1%>')">prev...</a><%}%>&nbsp;
		        	 <%for ( ; pageStart<pageEnd; pageStart++){%>
		        	 <a href="javascript:pageing('<%=pageStart %>')">
		        	 <%if(pageStart==nowPage) {%><font color="blue"> <%}%>
		        	 [<%=pageStart %>]
		        	 <%if(pageStart==nowPage){%></font> <%}%></a>
		        	 <%}//for%>&nbsp;
		        	 <%if (totalBlock > nowBlock) {%>
		        	 <a href="javascript:block('<%=nowBlock+1%>')">.....next</a>
		        	      <%}%>&nbsp;
		        	      <%}%>
		        	 </td>
		</table>

</div>

<script>
	function deleteOrder(order_no)
	{
		location.href = "ac00Delete.jsp?order_no=" + order_no; 
	}
	
</script>
</body>
</html>