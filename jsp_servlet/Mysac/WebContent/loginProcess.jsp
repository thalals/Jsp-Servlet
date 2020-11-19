<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.*"%>

<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	//넘어 오는거 한글처리
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");

	
	Connection conn =null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try{
		Context cp = new InitialContext();
		DataSource ds = (DataSource)cp.lookup("java:comp/env/jdbc/nov");
		conn = ds.getConnection();
		
		String sql ="select * from member where id = ?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		
		rs = ps.executeQuery();
		
		if(rs.next()){
			if(pass.equals(rs.getString("password"))){
				session.setAttribute("id", id);
				out.println("<script>");
				out.println("location.href='template.jsp'");
				out.println("</script>");		
			};
			
			out.println("<script>");
			out.println("location.href='login.jsp'");
			out.println("</script>");
			
		}
		else{
			out.println("<script>");
			out.println("location.href='joininForm.jsp'");
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