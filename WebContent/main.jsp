<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dao.*"%>
    <%@ page import="dto.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<%
	String id = request.getParameter("id");
	MemberDao mDao = new MemberDao();
	System.out.print(id);
	MemberDto list = mDao.getMemberData(id);
%>
<script>
	$(function () {
		$('.btn').click(function () {
			alert('로그아웃 되었습니다.');
			location.href = 'login.jsp';
		});
	});
</script>
</head>
<body>
	<div>
		<span style="font-size:50px; border-radius: 30px;">메인페이지</span>
		<div style="float:right;"><%=list.getName() %>님 안녕하세요
			<button class="btn">로그아웃</button> <br/>
			포인트 : <%=list.getPoint() %>점
		</div>
	</div>
	
	<div>
		<p>구입할 컨텐츠를 선택하세요.</p>
		<a href="mainAction.jsp?action=intro&point=100000&member=<%=list.getPoint()%>&name=<%=list.getName()%>&id=<%=id%>">
			<img src="img/1.png"/>
		</a>
		100.000포인트
		
		<a href="mainAction.jsp?action=java&point=500000&member=<%=list.getPoint()%>&name=<%=list.getName()%>&id=<%=id%>">
			<img src="img/2.png"/>
		</a>
		500.000포인트
		
		<a href="mainAction.jsp?action=C&point=300000&member=<%=list.getPoint()%>&name=<%=list.getName()%>&id=<%=id%>">
			<img src="img/3.png"/>
		</a>
		300.000포인트
		
	</div>
	
	<div style="border:1px solid black; float:right;">
		<광고>
		<div>
			<a href="mainAction2.jsp?member=<%=list.getPoint()%>&name=<%=list.getName()%>&id=<%=id%>">
				<img src="img/4.png"/>
			</a>
		</div>
	</div>
	
</body>
</html>