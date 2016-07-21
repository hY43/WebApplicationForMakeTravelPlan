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
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");

		ReviewDAO dao = new ReviewDAO();
		ReviewVO vo = new ReviewVO();
		vo.setTitle(title);
		vo.setContents(contents);
		dao.insertOne(vo);
	%>
</body>
</html>