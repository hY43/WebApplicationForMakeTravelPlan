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
		UserInfoDAO dao = new UserInfoDAO();
		String userId = request.getParameter("id");

		dao.deleteOne(userId);
	%>

	<form action="">
		<input type="text" name="id" id="" /> <input type="submit" value="고고" />
	</form>
</body>
</html>