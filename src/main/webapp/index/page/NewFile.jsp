<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DB 연결</title>
</head>
<body>

<%
    Connection conn = null;
    Statement stmt = null;

    try {
        // JDBC 드라이버 로드
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 데이터베이스 연결 정보 설정 (사용자명, 비밀번호, 데이터베이스 URL)
        String menu ="your_menu";
		String url = "jdbc:mysql://localhost:3306/your_database";

        // 데이터베이스 연결
        conn = DriverManager.getConnection(url,menu);

        // 데이터베이스에 쿼리 실행을 위한 Statement 객체 생성
        stmt = conn.createStatement();

      
        //  ResultSet rs = stmt.executeQuery("SELECT * FROM your_table");

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 연결 및 자원 해제
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>