<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.Member_Bean" %>
<%@ page import="java.sql.Timestamp" %>

<jsp:useBean id="Member_Mgr" class="user.Member_Mgr"/>

<%
  request.setCharacterEncoding("UTF-8");
  String smilePhone = request.getParameter("smilePhone");
  Member_Bean member_bean = Member_Mgr.get_user_with_phone(smilePhone);
  
  boolean isCorrect = false;
  
  if (member_bean != null && member_bean.getMem_id() != null) {
	  isCorrect = true;
  }
%>

<script>
  if (<%=isCorrect%>) {
    const smile = {
        index: '<%=member_bean.getMem_no()%>',
        name: '<%=member_bean.getMem_name()%>',
        mileage: '<%=member_bean.getMem_mile()%>',
    }
    
    document.cookie = "smile" + "=[" + encodeURIComponent(JSON.stringify(smile)) + "]; path=/;";
    
    location.href = '../main.jsp?smileIsCorrect=true';
  } else {
    location.href = '../smile.jsp?isCorrect=false';
  }
</script>
