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
	MemberDao mDao = new MemberDao();
	boolean get = mDao.getLogin(id, pw);
	if("admin".equals(id)) {
		%>
		<script>
		location.href = 'admin.jsp?id=<%=id%>';
		</script>
		<%
	}else if(get) {
		%>
		<script>
		location.href = 'main.jsp?id=<%=id%>';
		</script>
		<%
	}else {
		%>
		<script>
		location.href = 'login.jsp';
		</script>
		<%
	}
%>
<script>
</script>
</head>
<body>
</body>
</html>