<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.game.member.MemberDAO" %>
<%@page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="com.game.member.Member" scope="page" />
<jsp:setProperty name="member" property="id" />
<jsp:setProperty name="member" property="password" />
<jsp:setProperty name="member" property="name" />
<jsp:setProperty name="member" property="gender" />
<jsp:setProperty name="member" property="nickname" />
<jsp:setProperty name="member" property="phoneNumber" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 로직</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<%
	PrintWriter script = response.getWriter();

	String id = null;
	
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}
	
	if(id != null){
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href = 'index'");
		script.println("</script>");
	}
	
	if(member.getId().indexOf("@") == -1 || member.getId().indexOf(".") == -1){	// 이메일 형식 검사
		script.println("<script>");
		script.println("alert('올바른 이메일 양식으로 입력해주세요.')");
		script.println("history.back()");
		script.println("</script>");
	} else if(member.getPassword().matches("^(?=.*[a-z])(?=.*[0-9]).*$") || member.getPassword().length() > 20 ||
			member.getPassword().length() < 4) {	// 비밀번호 길이 검사
		script.println("<script>");
		script.println("alert('비밀번호는 4~20 글자 사이의 영어 소문자와 숫자로 조합해주세요.')");
		script.println("history.back()");
		script.println("</script>");
	} else if(!member.getName().matches("^[가-힣]+$")) {	// 이름이 한글만 포함하고 있는지 검사
		script.println("<script>");
		script.println("alert('이름은 한글만 입력 가능합니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if(member.getNickname().length() < 2 || member.getNickname().length() > 20) {	// 닉네임 길이 검사
		script.println("<script>");
		script.println("alert('닉네임은 최소 2글자 이상 한글 10자 이하(영어 20자)만 가능합니다.')");
		script.println("history.back()");
		script.println("</script>");	
	} else if(!member.getPhoneNumber().matches("^0[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$")) {	// 전화번호 양식 검사
		script.println("<script>");
		script.println("alert('올바른 전화번호를 입력해주세요.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		
		MemberDAO memberDAO = new MemberDAO();
		
		int result = memberDAO.register(member);
		
		if(result == -1){	// 아이디 존재 여부 검사
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			session.setAttribute("id", member.getId());
			script.println("<script>");
			script.println("location.href = 'index'");
			script.println("</script>");
		}
	}
	%>
</body>
</html>