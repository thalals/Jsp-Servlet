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
		request.setCharacterEncoding("EUC-KR");	//�ѱ� �ȱ����� ������ �޾ƿ�������
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
	%>
	
	�� �̸��� <%= name %>�̰�, ���� ����ϴ� ���̵�� <%= id %>�Դϴ�. <br>
	�׸��� ��й�ȣ�� <%= pw %> �Դϴ�.
	

</body>
</html>