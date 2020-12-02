<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "free.BoardDataPro" %>
<%@ page import = "java.sql.*" %>

<% request. setCharacterEncoding("utf-8");%>

<jsp:useBean id="article" scope="page" class="free.FreeBoardBean" >
	<jsp:setProperty name="article" property="*"/>
	
</jsp:useBean> 

<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());
	
	BoardDataPro dbPro = BoardDataPro.getInstance();
	dbPro.insertArticle(article);
	
	response.sendRedirect("./template.jsp?page=freelist.jsp");

%>