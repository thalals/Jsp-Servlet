<%-- contentType 156p 어떤 타입으로 결과과 전송되는지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action= "sessionLogin" method="post">
	아이디 : <input type = "text" name = "id" />
	비밀번호 : <input type = "password" name ="password" /><br>
	<input type ="submit" value="로그인" / >
</form>
</body>
</html>