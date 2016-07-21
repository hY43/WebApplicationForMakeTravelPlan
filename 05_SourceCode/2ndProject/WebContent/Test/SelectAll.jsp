<%@page import="VO.UserInfoVO"%>
<%@page import="java.util.ArrayList"%>
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
		UserInfoVO vo = new UserInfoVO();
		ArrayList<UserInfoVO> list = dao.selectAll();
	%>


	<h1>
		<%
			for (UserInfoVO i : list) {
				out.println(i.getUserId());
			}
		%>
	</h1>



</body>
</html>