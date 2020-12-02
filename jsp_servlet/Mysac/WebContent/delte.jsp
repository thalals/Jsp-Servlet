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
	%>
	<form action="delProcess.jsp" method="post">
		<h4> 비밀번호를 입력해 주세요 </h4>
		<input type="hidden" name="id" value="<%=id %>">
		<input type="password" name="pass">
		<input type="submit" value="탈퇴">
		<input type="button" value="취소" onClick="history.back()">
		
	</form>
</body>
</html>