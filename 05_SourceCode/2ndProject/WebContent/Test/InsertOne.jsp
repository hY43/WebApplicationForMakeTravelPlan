<%@page import="DAO.UserInfoDAO"%>
<%@page import="VO.UserInfoVO"%>
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
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String bgimg = request.getParameter("bgimg");
		String admin = request.getParameter("admin");

		UserInfoDAO dao = new UserInfoDAO();
		UserInfoVO vo = new UserInfoVO();

		vo.setUserId(id);
		vo.setName(name);
		vo.setPassword(pw);
		vo.setTel(tel);
		vo.setEmail(email);
		vo.setBackgroundImg(bgimg);
		vo.setAdmin(admin);

		dao.insertOne(vo);
	%>
</body>
</html>