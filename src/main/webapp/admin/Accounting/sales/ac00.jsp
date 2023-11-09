<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"%>
<%@ page import="menu.Menu_order_Bean"%>
<jsp:useBean id="menuMgr" class="menu.Manager_Menu"/>
<%
    int totalRecord = 0; //전체레코드수
    int listSize = 0;    //현재 읽어온 자료의 수
	Vector<Menu_order_Bean> vlist = null;
	String usid = (String) session.getAttribute("idKey");
	int numb = 0;

%>
<!DOCTYPE html>
<html>
<head>
	<title>코드관리</title>
	<link href="../main/style.css" rel="stylesheet" type="text/css" >
<script type="text/javascript">
	function code02(numb){
		document.readFrm.numb.value=numb;
		document.readFrm.action="code02.jsp";
		document.readFrm.target="content";
		document.readFrm.submit();
	}

	function code03(numb){
		document.readFrm.numb.value=numb;
		document.readFrm.action="code03.jsp";
		document.readFrm.target="content";
		document.readFrm.submit();
	}

	function check() {
	     if (document.searchFrm.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
	     }
	  document.searchFrm.action="code00.jsp";
      document.searchFrm.target="content";
	  document.searchFrm.submit();
	 }
</script>

</head>
<body leftmargin="0" topmargin="0">

<div align="center">
    <br/>
		<h2>매장 관리 페이지</h2>
    <br>
	<table align="center" width="800" border="1">
		<tr>
			<td>코드 등록 자료수 : <%=totalRecord%></td>
		</tr>
	</table>
	<table align="center" width="800" cellpadding="3" border="1">
		<tr>
			<td align="center" colspan="3">
		
				  <table width="100%" cellpadding="2" cellspacing="0" border="1">
					<tr align="center" bgcolor="#D0D0D0" height="120%">
						<td>번호</td>
						<td>판매 일시</td>
						<td>판매 내역</td>
						<td>판매 금액</td>
						<td>결제 방식</td>
						<td>현금 액수</td>
						<td>카드 액수</td>
						<td>이용 요금</td>
						<td>일별 총금액</td>
						<td>월별 총금액</td>
						<td>수 정</td>
						<td>삭 제</td>
					</tr>
					<%
						  for (int i = 0;i<listSize; i++) {
							Menu_order_Bean bean  = vlist.get(i);
							int mgrodr_no = bean.getMgrodr_no();
							String mgrodr_day = bean.getMgrodr_day();
							String mgrodr_kind = bean.getMgrodr_kind();
							String mgrodr_sele = bean.getMgrodr_sele();
							String mgrodr_mtd = bean.getMgrodr_mtd();
							String mgrodr_hsel = bean.getMgrodr_hsel();
							String mgrodr_csel = bean.getMgrodr_csel();
							String mgrodr_sday = bean.getMgrodr_sday();
							String mgrodr_smon = bean.getMgrodr_smon();
							
							
					%>
					<tr>
						<td align="center">
 						   <%=""%>>
						</td>
						<td align="center">
 						   <%=""%>
						</td>
						<td align="center">
 						   <%=""%>
						</td>
						<td align="center">
 						   <%=""%>
						</td>
						<td align="center">
 						   <%=""%>
						</td>
						<td align="center">
 						   <%=""%>
						</td>
						<td align="center">
 						   <%=""%>
						</td>
						<td align="center">
 						   <%=""%>
						</td>
						<td align="center">
 						   <%=""%>
						</td>
						<td align="center">
						   <a href="javascript:code02('<%=numb%>')">수정</a>
						</td>
						<td align="center">
						   <a href="javascript:code03('<%=numb%>')">삭제</a>
						</td>
					</tr>
					<%}//for%>
				</table> <%
 			//if
 		%>
			</td>
		</tr>
		</table>

	<form name="readFrm" method="get">
	    <br>
		<input type="button" value="코드등록" onClick="location.href='code01.jsp'"> &nbsp; &nbsp;
		<input type="button" value="회계 홈" onClick="history.go(-1)"> &nbsp; &nbsp;
		<input type="hidden" name="numb"> 
	</form>
</div>
</body>
</html>