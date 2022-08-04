<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
    <%@ page import="dao.*"%>
    <%@ page import="dto.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	int point = Integer.parseInt(request.getParameter("point"));
	String id = request.getParameter("id");
	MemberDao mDao = new MemberDao();
	mDao.getChange(pw, name, point, id);
%>
<script>
	alert('수정되었습니다.');
	location.href = 'admin.jsp?id=admin';
</script>
</head>
<body>
	
</body>
</html>