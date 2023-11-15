<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.game.member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="com.game.member.Member" scope="page" />
<jsp:setProperty name="member" property="id" />
<jsp:setProperty name="member" property="password" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<%
		String id = null;
		
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
		
		if(id != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'index'");
			script.println("</script>");
		}
	
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.login(member.getId(), member.getPassword());
		
		if(result == 1){
			session.setAttribute("id", member.getId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index'");
			script.println("</script>");
		}else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>