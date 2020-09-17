<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=EUC-KR>
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("EUC-KR");	//한글 안깨지게 데이터 받아오기전에
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
	%>
	
	내 이름은 <%= name %>이고, 내가 사용하는 아이디는 <%= id %>입니다. <br>
	그리고 비밀번호는 <%= pw %> 입니다.
	

</body>
</html>