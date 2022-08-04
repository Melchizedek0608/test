<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
	.login {
		border : 1px solid black;
		height : 300px;
		width : 300px;
	}
	.btn {
		width : 200px;
	}
</style>
<script>
	$(function() {
		$('.sign-btn').click(function () {
			location.href = 'sign.jsp';
		});
	});
</script>
</head>
<body>
	<div class="login">
		<h1>회원가입</h1>
		<form action="signAction.jsp">
			ID : <input type="text" name="id" /> <br/>
			PW : <input type="password" name="pw" /> <br/>
			Name : <input type="text" name="name" /> <br/>
			<button type="submit" class="btn">작성완료</button>
		</form>
	</div>
</body>
</html>