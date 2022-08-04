<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	MemberDao mDao = new MemberDao();	
	System.out.print(id);
	System.out.print(pw);
	System.out.print(name);
	mDao.getSign(id, pw, name);
%>
<script>
	$(function () {
		alert('가입되었습니다. 로그인 해주세요.');
		location.href = 'login.jsp';
	});
</script>
</head>
<body>
	
</body>
</html>