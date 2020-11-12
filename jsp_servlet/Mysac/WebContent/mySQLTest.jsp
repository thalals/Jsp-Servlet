<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
<title>jdbc 연동 테스트</title>
<style>
	table{
		width : 600px;
		border : 1px solid #222222;
	}
	tr,th,td{
		border : 1px solid #444444;
		text-align : center;
	}
	
	th{
		background-color:yellow;
		hegiht:40px;
	}
</style>
</head>

<body>
<%
	Connection conn=null;
	PreparedStatement ps = null;	//sql문 실행
	ResultSet rs = null;		//select한 결과를 담는다
	
	String driver="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/nov?serverTimezone=UTC";

	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url,"root","1234");	//db연결
		String sql = "select * from member";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();		//실행 -> 테이블 변화 x
		//ps.executeUpdate(); //업데이트 ->테이블 변화 ㅇ
%>

<table>
	<tr>
		<th>아이디</th><th>패쓰워드</th><th>이름</th><td>나이</th><th>성별</th><th>이메일</th>
	</tr>
	
	<%	while(rs.next()){%>
	<tr>
		<td><%= rs.getString("id") %></td>
		<td><%= rs.getString("password") %></td>
		<td><%= rs.getString("name") %></td>
		<td><%= rs.getInt("age") %></td>
		<td><%= rs.getString("gender") %></td>
		<td><%= rs.getString("email") %>	</td>
		<td><a href = "deletemember.jsp?id=<%=rs.getString("id")%>"></a></td>
	</tr>
	<%	} %>
</table>
<% 	
	}catch (Exception e){
		e.printStackTrace();
	}finally{
		if (rs != null) rs.close();
		if (ps != null) ps.close();
		if (conn != null) conn.close();
} 
%>
</body>
</html>
