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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<%
	MemberDao mDao = new MemberDao();
	ArrayList<MemberDto> list = mDao.getMember();
	if("admin".equals(request.getParameter("id"))){
		
	} else {
		%>
		<script>
			alert('삭제되었습니다.');
		</script>
		<%
	}
%>
<script>
	$(function () {
		$('.btn').click(function () {
			location.href = 'login.jsp';
		});
	});
</script>
</head>
<body>
	<div style="float:right;">
		<button class="btn">로그인</button>
	</div>
	<h1>회원관리</h1>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>PW</th>
			<th>Name</th>
			<th>Point</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
		for(int i=0; i<list.size(); i++){
			%>
			<tr>
				<td><%=list.get(i).getId()%></td>
				<td><%=list.get(i).getPw()%></td>
				<td><%=list.get(i).getName()%></td>
				<td><%=list.get(i).getPoint()%></td>
				<td>
					<form action="change.jsp">
						<input type="hidden" name="id" value="<%=list.get(i).getId()%>"/>
						<input type="hidden" name="pw" value="<%=list.get(i).getPw()%>"/>
						<input type="hidden" name="name" value="<%=list.get(i).getName()%>"/>
						<input type="hidden" name="point" value="<%=list.get(i).getPoint()%>"/>
						<button type="submit">수정</button>
					</form>
				</td>
				<td>
					<form action="DelServlet" method="get">
						<button class="del" name="id" value="<%=list.get(i).getId()%>">삭제</button>
					</form>
				</td>
			</tr>
			<%
		}
		%>
	</table>
	
	<h1>스케줄러 관리</h1>
	<form action="quartzServlet" method="get">
		<button name="name" value="plus">스케줄러(20초마다 포인트1증가) 실행 시작</button>
		<button name="name" value="exit">스케줄러 실행 종료</button>
	</form>
</body>
</html>