<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.ReviewVO"%>
<%@page import="DAO.ReviewDAO"%>
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
		Random rd = new Random();
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewVO> list = dao.selectAll();
		int rnd = rd.nextInt(list.size()); // 랜덤한 값
	%>
	<table>
		<tr>
			<th>no</th>
			<td><%=list.get(rnd).getReviewNo()%></td>
		</tr>
		<tr>
			<th>title</th>
			<td><%=list.get(rnd).getTitle()%></td>
		</tr>
		<tr>
			<th>contents</th>
			<td><%=list.get(rnd).getContents()%></td>
		</tr>
	</table>
</body>
</html>