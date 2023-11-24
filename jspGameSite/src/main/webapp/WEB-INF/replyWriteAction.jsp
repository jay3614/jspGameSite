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
	
		Long target_id = 0L;
		
		if(request.getParameter("id") != null) {
			target_id = Long.parseLong(request.getParameter("id"));
		}
		
		String replyer = null;
		
		if(session.getAttribute("id") != null){
			replyer = (String)session.getAttribute("id");
		}
		
		if(replyer == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login'");
			script.println("</script>");
		}else {
			if(reply.getComment() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('댓글 입력이 안 되어 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				ReplyDAO ReplyDAO = new ReplyDAO();
				
				int result = ReplyDAO.write(reply.getReplyer(), reply.getTarget_id(), reply.getComment());
				
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글 작성에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("var commentPage = " + reply.getTarget_id() + ";");
					script.println("location.href = 'news/eventDetail?commentPage=1&id=' + commentPage;");
					script.println("</script>");
				}
			}			
		}
		
	%>
</body>
</html>