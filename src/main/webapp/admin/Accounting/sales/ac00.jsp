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
     //전체레코드수
    int listSize = 0;    //현재 읽어온 자료의 수
    int numPerPage = 10;   //페이지당 레코드 수
    int pagePerBlock = 15;
    
    int totalPage=0;  //전체 페이지 수
    int totalBlock=0; //전체 블럭수
    int nowPage=1;    //현재 페이지
    int nowBlock=1;  //현재 블럭
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

<link rel="stylesheet" href="/post_inc/datatables/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>

<style>
table {
  width: 500px;
  border-collapse: collapse;
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

</script>
	

     </head>
<body leftmargin="0" topmargin="0">

<div align="center">
    <br/>
		<h2>매장 관리 페이지</h2>
    <br>
	<table align="center" width="100%" border="1">
		<tr>
			<td>코드 등록 자료수 : <%=vlist.size()-((nowPage-1)*numPerPage)-1%></td>
		</tr>
	</table>
	<table align="center" width="100%" cellpadding="3" border="1">
		<tr>
			<td align="center" colspan="3">
			 <%     
			          
			           listSize = vlist.size();
               	       if (vlist.isEmpty()) {
               	    	   out.println("등록된 목록이 없습니다.");
               	    	   
               	       } else {
               	 %>
		
				  <table width="100%" cellpadding="2" cellspacing="0" border="1">
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
					<%
						  for (int i = 0; i<numPerPage; i++) {
							  if (i == listSize) break;
							  Orders_Bean bean  = vlist.get(i);
							int order_no = bean.getOrder_no();
							Timestamp order_time = bean.getOrder_time();
							List<Map<String, Object>> order_foods = gson.fromJson(bean.getOrder_foods(), new TypeToken<List<Map<String, Object>>>(){}.getType());
							int order_price = bean.getOrder_price();
							int order_discount = bean.getOrder_discount();
							String order_coupon = bean.getOrder_coupon();
							String order_type = bean.getOrder_type();
							Boolean order_add_mile = bean.isOrder_add_mile();
							Boolean order_is_maked = bean.isOrder_is_maked();
							
							
					%>
                    
					<tr>
						<td align="center" >
 						   	   <%=order_no%>
						</td>
						<td align="center">
 						   <%=order_time%>
						</td>
						<td align="center">
						<div class="text-over-cut">
 						   <%=order_foods%>
 						    </div>
						</td>
						<td align="center">
 						   <%=order_price%>
						</td>
						<td align="center">
 						   <%=order_discount%>
						</td>
						<td align="center">
						<div class="text-over-cut">
 						   <%=order_coupon%>
 						    </div>
						</td>
						<td align="center">
 						   <%=order_type%>
						</td>
						<td align="center">
 						   <%=order_add_mile%>
						</td>
						<td align="center">
 						   <%=order_is_maked%>
						</td>
						<td>
						<input type="button" value="수정">
						</td>
						<td>
						<input type="button" value="삭제" onclick ="openPopup('')">
						</td>
						
					</tr>
			<%}//for%>
				</table> <%
				}//if
				%> 
			</td>
		</tr>
		<tr>
		 <td>
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
</body>
</html>