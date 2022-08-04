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
	String action = request.getParameter("action");
	int point = Integer.parseInt(request.getParameter("point"));
	int member = Integer.parseInt(request.getParameter("member"));
	int get = member - point;
	if(action.equals("C")){
		action = "C++";
	}
	if(get<0) {
		%>
		<script>
			alert('포인트가 부족합니다. 광고를 클릭하세요.')
			history.back();
		</script>
		<%
	}else {
		mDao.getPoint(get, name);
		%>
		<script>
			alert('컨텐츠(<%=action%>)를 구입하였습니다.')
			location.href = 'main.jsp?id=<%=id%>';
		</script>
		<%
	}
%>
</head>
<body>

</body>
</html>