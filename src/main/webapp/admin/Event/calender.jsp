<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Date Picker Example</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>

    <label for="datepicker">시작 일자 : </label>
    <input type="text" id="datepicker" name="event_issueDate">
    
    <label for="datepicker2">종료 일자 : </label>
    <input type="text" id="datepicker2" name="event_expireDate">
    
<script>
$(function() {
    // DatePicker 초기화
    $("#datepicker").datepicker({
    	changeMonth : true,
    	changeYear : true,
    	dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
    	monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	monthNamesShort : ['1','2','3','4','5','6','7','8','9','10','11','12']
    });
    
    $("#datepicker2").datepicker({
    	changeMonth : true,
    	changeYear : true,
    	dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
    	monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	monthNamesShort : ['1','2','3','4','5','6','7','8','9','10','11','12']
    });
});
</script>
</body>
</html>
