<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String day = request.getParameter("day");
	for(int i = 1;i<=Integer.parseInt(day)+1;i++){
		out.println("<table id=tday_"+i+">");
		out.println("<caption>"+i+"일</caption>");
		for(int j = 1;j<=24;j++){
			out.println("<tr class = '"+i+"day_time'>\n<td>"+j+"시</td><td id =day_"+j+"></td></tr>");
		}
		out.println("</table>");
	}
%>
</body>
</html>