<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".north").on("mouseover", function(){
			/* $("#mapBasic").attr("src", ""); */
			console.log("hello");
		});
	});
</script>
</head>
<body>
<img src="../images/map.JPG" alt="" usemap="#Map" id="mapBasic"/>
<map name="Map" id="Map">
    <area class="north" alt="" title="" href="northMap.jsp" shape="poly" coords="61,91,301,85,76,179,199,182,74,162,53,150,43,134,113,96,84,96,211,155,157,92,159,174,199,142,195,168,118,165,79,165,78,119,223,144,97,158,81,142,89,76,111,62" />
    <area class="north" alt="" title="" href="northMap.jsp" shape="poly" coords="76,201,112,10,252,11,251,200" />
</map>
</body>
</html>