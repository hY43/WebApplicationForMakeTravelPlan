<%@page import="VO.UserInfoVO"%>
<%@page import="DAO.UserInfoDAO"%>
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
		String userId = request.getParameter("id");

		UserInfoDAO dao = new UserInfoDAO();
		UserInfoVO vo = dao.selectOne(userId);
	%>
	<h1>
		<%
			out.println(vo.getName());
		%>
	</h1>
</body>
</html>