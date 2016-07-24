<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.0.0.min.js"></script>
<script>
	var pageFlag = 0; // 0: 선택하지 않음, 1: post 선택, 2: Bookmark 선택, 3: myPlan 선택
	$(function(){
		$("#post").on("click",function(){
			pageFlag=1;
		});
	});
</script>
</head>
<body>
<div>
<!-- 메뉴 선택 -->
<a href="#" id="post">포스트</a></br>
<a href="#" id="Bookmark">북마크</a></br>
<a href="#" id="myPlan">내일정</a></br>
</div>
<div id="contents">
<%

%>
</div>
</body>
</html>