<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.*"%>

<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
<style>
	table{
		margin : auto;
		width : 400px;
		border : 1px solid gray;
		text-align: center;
	}
	.td_title{
		font-weight: bold;
		font-size: x-large;
	}
</style>
</head>

<body>
<%
	request.setCharacterEncoding("UTF-8");	//넘어 오는거 한글처리
	
	String id = request.getParameter("id");
	System.out.println(id);

	Connection conn =null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try{
		Context cp = new InitialContext();
		DataSource ds = (DataSource)cp.lookup("java:comp/env/jdbc/nov");
		conn = ds.getConnection();
		
		String sql ="select * from member where id =?";
		ps = conn.prepareStatement(sql);
		
		ps.setString(1, id);
	
		
		rs = ps.executeQuery();
		
		if(rs.next()){
			%>
			<form name="updateform" action="updateProcess.jsp" method="post">
			<table border=1>
				<tr>
					<td colspan="2" class = "td_title">
						회원정보 수정
					</td>
				</tr>
				<tr>
					<td><label for = "id">아이디 : </label></td>
					<td><input type="text" name="id" id = "id" disabled value = '<%= rs.getString("id")%>' /></td>
				</tr>
				<tr>
					<td><label for = "pass">비밀번호 : </label></td>
					<td><input type="password" name="pass" id = "pass"  /></td>
					
				</tr>
				<tr>
					<td><label for = "name">이름 : </label></td>
					<td><input type="text" name="name" id = "name" value = '<%= rs.getString("name")%>'/></td>
				</tr>
				<tr>
					<td><label for = "age">나이 : </label></td>
					<td><input type="text" name="age" id = "age" value = '<%= rs.getInt("age")%>'/>
					</td>
				</tr>
				<tr>
					<td><label for = "gender1"></label>성별 : </td>
					<td>
						<%if (rs.getString("gender").equals("남")) {%>
						<input type="radio" name="gender" value="남" checked id = "gender1"/>남자
						<input type="radio" name="gender" value="여" id = "gender2"/>여자
						<%} else { %>
						<input type="radio" name="gender" value="남" id = "gender1"/>남자
						<input type="radio" name="gender" value="여" checked id = "gender2"/>여자
						<%} %>
					</td>
				</tr>
				<tr>
					<td><label for = "email">이메일 주소 : </label></td>
					<td><input type="text" name="email" id = "email" value = '<%= rs.getString("email")%>'/></td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="javascript:updateform.submit()">회원정보 수정</a>&nbsp;&nbsp;
						<a href="delte.jsp?id=<%=rs.getString("id") %>">회언탈퇴</a>
					</td>
				</tr>
			</table>
			</form>
			
		<%	
		}
		else{
			out.println("<script>");
			out.println("location.href='./template.jsp'");
			out.println("</script>");
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if( ps != null) ps.close();
		if( conn != null) conn.close();
	}
	
%>

</body>

</html>
