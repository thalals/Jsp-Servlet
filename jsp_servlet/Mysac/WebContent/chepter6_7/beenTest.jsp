<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch7.PersonBeen" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/*PersonBeen pb = new PersonBeen();	//java 코드 가져오기 위에 import*/
	request.setCharacterEncoding("UTF-8");
	
%>
<jsp:useBean id="pb" class="ch7.PersonBeen" />
<jsp:setProperty property="*" name="pb" />		<!-- * 로 모두 불러오기 -->

이름 : <jsp:getProperty property="name" name="pb"/>
이메일 : <jsp:getProperty property="email" name="pb"/>		<!-- 액션폼 스타일 -->
주소 : <%=pb.getAddr() %>		<!-- 자바 스타일 -->
생년월일 : <%=pb.getBirthday() %>
나이 : <%=pb.getAge() %>
</body>
</html>