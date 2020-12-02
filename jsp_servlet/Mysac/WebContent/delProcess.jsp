<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.*"%>

<%@page import="javax.naming.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pass");
	
	Connection conn =null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String sql=null;
	
	try{
		Context cp = new InitialContext();
		DataSource ds = (DataSource)cp.lookup("java:comp/env/jdbc/nov");
		conn = ds.getConnection();
		
		sql ="select password from member where id = ?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		
		rs = ps.executeQuery();
		
		rs.next();
		
		if(pw.equals(rs.getString("password"))){
			
			sql = "delete from member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
			int a = ps.executeUpdate();
			
			if(a!=0){		
				session.invalidate();
				out.println("<script>");
				out.println("alert('탈퇴')");
				out.println("location.href='template.jsp'");
				out.println("</script>");		
			
			}
			else{
				out.println("<script>");
				out.println("alert('탈퇴 문제 발생')");
				out.println("history.back()");
				out.println("</script>");		
			
			}
		}
		else{
			out.println("<script>");
			out.println("alert('비밀번호 틀림ㄴ')");
			out.println("history.back()");
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