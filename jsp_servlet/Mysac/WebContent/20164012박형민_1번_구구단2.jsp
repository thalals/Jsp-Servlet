<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");	//한글 안깨지게 데이터 받아오기전에
		int start = Integer.parseInt(request.getParameter("start"));
		int finish = Integer.parseInt(request.getParameter("finish"));
		
		for(int j=1;j<10;j++){
			for(int i=start; i<=finish;i++){
				out.print(i + "*" + j + "=" + i*j + "  ");
			}
			out.print("</br>");
		}
	%>
	
	
</body>
</html>