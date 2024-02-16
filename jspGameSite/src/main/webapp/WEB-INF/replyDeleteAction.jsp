<%@page import="com.game.member.Member"%>
<%@page import="com.game.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.game.reply.ReplyDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="reply" class="com.game.reply.Reply" scope="page" />
<jsp:setProperty name="reply" property="comment" />
<jsp:setProperty name="reply" property="replyer" />
<jsp:setProperty name="reply" property="target_id" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 작성 로직</title>
</head>
<body>
	<%
	PrintWriter script = response.getWriter();
	
	Long rno = 0L;
	Long target_id = 0L;
	
	if(request.getParameter("rno") != null) {
		rno = Long.parseLong(request.getParameter("rno"));
	}
	if(request.getParameter("target_id") != null) {
		target_id = Long.parseLong(request.getParameter("target_id"));
	}
	
	String id = null;
	String nickname = null;
	
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
		MemberDAO memberDAO = new MemberDAO();
		Member member = memberDAO.getMember(id);
		nickname = member.getNickname();
	}
	ReplyDAO replyDAO = new ReplyDAO();
	String replyer = replyDAO.compare(rno);
	
	if(id == null){
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login'");
		script.println("</script>");
	}else if(!nickname.trim().equals(replyer.trim())) {	// rno의 작성자와 로그인 유저 일치여부 검사
		script.println("<script>");
		script.println("alert('댓글 작성자가 아닙니다.')");
		script.println("var commentPage = " + reply.getTarget_id() + ";");
		script.println("location.href = 'news/eventDetail?commentPage=1&id=' + commentPage;");
		script.println("</script>");
	}else {
		int result = replyDAO.delete(rno);
		if(result == -1){
			script.println("<script>");
			script.println("alert('댓글 삭제에 실패했습니다.')");
			script.println("var commentPage = " + reply.getTarget_id() + ";");
			script.println("location.href = 'news/eventDetail?commentPage=1&id=' + commentPage;");
			script.println("</script>");
		}else{
			script.println("<script>");
			script.println("var commentPage = " + reply.getTarget_id() + ";");
			script.println("location.href = 'news/eventDetail?commentPage=1&id=' + commentPage;");
			script.println("</script>");
		}
	}
	%>
</body>
</html>