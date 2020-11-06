<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="mid.MemberBean" %>

<html>
<head>
<title>회원가입</title>
</head>
<body bgcolor="#996600">
<%
	request.setCharacterEncoding("UTF-8");	
%>
<jsp:useBean id="pb" class="mid.MemberBean" />
<jsp:setProperty property="*" name="pb" />
<table width="650" align="center" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
      <table  border="1" cellspacing="0" cellpadding="2"  align="center">
        <form name="regForm" method="post" action="memberProc.jsp">
          <tr align="center" bgcolor="#996600"> 
            <td colspan="3"><font color="#FFFFFF">
            <b><jsp:getProperty property="name" name="pb"/> 회원님이 작성하신 내용입니다. 확인해 주세요</b></font></td>
          </tr>
          <tr> 
            <td width="150">아이디</td>
            <td width="500"><jsp:getProperty property="id" name="pb"/></td>
          </tr>
          <tr> 
            <td>패스워드</td> 
            <td><jsp:getProperty property="pwd" name="pb"/></td>
          </tr>
         
          <tr>  
            <td>이름</td>
            <td><jsp:getProperty property="name" name="pb"/></td>
          </tr>
          <tr> 
            <td>생년월일</td>
            <td><jsp:getProperty property="birthday" name="pb"/></td>
          </tr>
          <tr>  
            <td>이메일</td>
            <td><jsp:getProperty property="email" name="pb"/></td>
          </tr>
          <tr> 
            <td colspan="3" align="center"> 
             <input type="submit" value="확인완료"> &nbsp; 
             <input type="reset" value="다시쓰기"> 
            </td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>
</body>
</html>