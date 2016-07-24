<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> -->
<!-- </body>
</html>
 -->
 <style>
	div{
		width:400px
		height:400px
		background-color:black
	}
 </style>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.0.0.min.js"></script>
<script>
$(function(){
	$("#btn").on("click", function(){
		document.write("<div id='div1'></div>");
		$("#div1").css({
			"margin":"0",
			"padding":"0",
	 		"background-color" : "rgba(235,235,235,.96)",
 			"width":"100%",
 			"height":"100%",
 			"opacity":"1",
 			"position":"fixed",
 			"top":"0px",
 			"left":"0px"
		});
 		document.write("<div id='div2'><img src='../images/Chennai_sorrento.JPG' /><p>와 예쁘네</p></div>");
		$("#div2").css({
	 		"background-color" : "white",
	 		"margin":"250px",
 			"width":"910px",
 			"height":"6760px",	
 			"float":"left",
 		    "transform": "translate(0,0)"
		});
		$("img").css({
			"width":"700px",
			"height":"400px"
		});
	});
});
</script>
<input type="button" value="클릭" id="btn" />
<p>안녕안녕안녕</p>
<div></div>
