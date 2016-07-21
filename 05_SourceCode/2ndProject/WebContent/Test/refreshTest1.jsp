<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	width: 100%;
	padding: 0 !important;
	background: rgba(235, 235, 235, .96) !important;
	    overflow-x: hidden;
    overflow-y: auto;
}
</style>
<script type="text/javascript" src = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn").on("click", function(){
			// 1. ajax를 통해 대기..
			waitForReflesh();
			// 2. popup을 통해 writeform 생성
			goWriteForm();
		});
	});
	
	function waitForReflesh(){
		$.ajax({
			url : "writeForm.jsp",
			type : "get",
			success : function(){
				showPost();
			}
		});
	}
	
	function showPost(){
		
	}
	
	function goWriteForm(){
		var popupwin = window.open("writeForm.jsp", "chile", "width=300,height=300,left=300,top=300");
	}
</script>
</head>
<body>
	<!-- if click new post button, show writing forms -->
	<div>
	<input type="button" id="btn" value="new form"/>
	</div>
	
</body>
</html>