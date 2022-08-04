<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dao.*"%>
    <%@ page import="dto.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	MemberDao mDao = new MemberDao();
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	int member = Integer.parseInt(request.getParameter("member"));
	int point = (int)(Math.random()*1000)+1;
	int get = member + point;
	mDao.getPoint(get, name);
	%>
	<script>
		alert('<%=point%>점이 적립되었습니다.');
		location.href = 'main.jsp?id=<%=id%>';
	</script>
	<%
%>
</head>
<body>

</body>
</html>