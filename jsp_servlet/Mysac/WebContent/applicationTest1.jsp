<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 테스트</title>
</head>
<body>
<h2>어플리케이션 테스트</h2>
<table border=1>
	<tr>
		<td>jsp 버전</td>
		<td><%=application.getMajorVersion() %>.<%=application.getMinorVersion() %> </td>
	</tr>
	<tr>
		<td>컨테인 버전</td>
		<td><%=application.getServerInfo() %></td>
	</tr>
	<tr>
		<td>웹 어플리케이션 실제 파일시슽템 경로 버전</td>
		<td><%=application.getRealPath("/") %></td>
	</tr>
</table>

</body>
</html>