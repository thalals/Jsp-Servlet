<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;
	
	id = (String)session.getAttribute("id");
	System.out.println("id : " + id);
	if(id !=null){	//로그인 됬으면
		
	%>
	<html>
	<body>
		<h5>"<%= id %>" 님이 로그인 되었습니다.</h5>
	
		<a href = "logout.jsp?id=<%=id%>"> 로그아웃</a>
		<a href = "./template.jsp?page=update.jsp?id=<%=id%>"> 회원정보 수정</a>
	
	</body>
	
	</html>
	


<%} else{ %>
<a href="./template.jsp?page=loginForm.jsp">Login</a>
<a href="./template.jsp?page=joinForm.jsp">join</a>


<%} %>