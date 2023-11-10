<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	아이디 찾기 
<script>
	function findIDbtn(){
		document.fm.action="<%=request.getContextPath()%>이동할 컨트롤러";
		document.fm.method="post";
	}
</script>
<form name=fm>
<table>
    <tr>
      <td>이름 :</td>
      <td><input type="text" name="name" required></td>
    </tr>
    <tr>
      <td>이메일 :</td>
      <td><input type="text" name="email" required></td>
    </tr>
    <tr>
      <td colspan="2">
        <button type="submit" id="findID-btn" onclick="findIDbtn()"><span>아이디 찾기</span></button>
      </td>
    </tr>
</table>
</form>
 </form>
</body>
</html>