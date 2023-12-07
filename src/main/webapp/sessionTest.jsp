<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 테스트</title>
</head>
<body>
	세션 유효시간 기본 값:<br>
	<% 
		int sessionTime = session.getMaxInactiveInterval(); // 세션유효시간
		out.println("세션의 유효시간 : " + sessionTime + "<br>");
	%>
	세션 유효시간 변경 후 값 : <br>
	<% 
		session.setMaxInactiveInterval(300); // 300초 후에 세션 자동 삭제
		sessionTime = session.getMaxInactiveInterval(); // 세션유효시간
		out.println("세션의 유효시간 : " + sessionTime + "<br>");
	%>
	<hr>
	<% 
		String session_id = session.getId();
		long lastTime = session.getLastAccessedTime(); // 마지막 세션 사용했던 시점의 시간
		long firstTime = session.getCreationTime();// 세션이 생성된 시점의 시간
		long keepTime = (lastTime - firstTime)/60; // 사이트에서 유지했던 시간을 분단위로 반환
		
		out.println("세션 고유 아이디 : " + session_id + "<br>");
		out.println("사이트 접속 시간 : " + keepTime +"분<br>");
		out.println("lastTime : " + lastTime +"<br>");
		out.println("firstTime : " + firstTime +"<br>");
	%>
</body>
</html>