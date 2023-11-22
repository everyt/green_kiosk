<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">




<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인기 메뉴 순위</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>인기 메뉴 순위</h2>
    <table id="popularMenuTable">
        <tr>
            <th>순위</th>
            <th>메뉴 이름</th>
            <th>주문 수</th>
        </tr>
    </table>

    <script src="popularMenu.js"></script>
</body>
</html>
<script>
document.addEventListener('DOMContentLoaded', function () {
    // 서버에서 인기 메뉴 데이터를 가져와서 테이블에 표시하는 함수 호출
    fetchPopularMenu();
});

function fetchPopularMenu() {
    // 서버로부터 인기 메뉴 데이터를 가져오는 API 호출
    fetch('/api/popularMenu')
        .then(response => response.json())
        .then(data => {
            // 가져온 데이터를 테이블에 추가
            const table = document.getElementById('popularMenuTable');
            const tbody = document.createElement('tbody');

            data.forEach((menu, index) => {
                const row = tbody.insertRow();
                const cellRank = row.insertCell(0);
                const cellMenuName = row.insertCell(1);
                const cellOrderCount = row.insertCell(2);

                // 순위, 메뉴 이름, 주문 수를 표시
                cellRank.textContent = index + 1;
                cellMenuName.textContent = menu.menuName;
                cellOrderCount.textContent = menu.orderCount;
            });

            // 테이블의 기존 tbody를 대체
            if (table.tBodies.length > 0) {
                table.replaceChild(tbody, table.tBodies[0]);
            } else {
                table.appendChild(tbody);
            }
        })
        .catch(error => console.error('Error fetching popular menu:', error));
}
</script>