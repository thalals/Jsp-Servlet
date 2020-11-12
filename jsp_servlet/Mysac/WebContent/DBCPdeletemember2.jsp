<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="javax.naming.*"%>
<%@ page import="javax.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn=null;
	PreparedStatement ps = null;	//sql문 실행
	String idd = request.getParameter("id");

	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/nov");
		conn = ds.getConnection();
		
		String sql = "delete from member where id = ?";	//index가 1부터 시작
		ps = conn.prepareStatement(sql);
		ps.setString(1,idd);
		
		//rs = ps.executeQuery();		//실행 -> 테이블 변화 x
		ps.executeUpdate(); //업데이트 -> 테이블 변화 ㅇ
		
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if (ps != null) ps.close();
		if (conn != null) conn.close();
		response.sendRedirect("DBCPmySQLTest.jsp");

	}
%>
</body>
</html>