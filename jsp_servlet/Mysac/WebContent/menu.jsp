<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String id = (String)session.getAttribute("id");
%>
<body>
<%
	if(id == null){
%>	
	<a href ="login.jsp"> 로그인</a>
<%
	}
	else{
%>	
	<%=id %> 님 환영합니다.
	<br><hr>
	<a href = "logout.jsp"> 로그아웃</a>
<%
	}
%>
</body>
</html>