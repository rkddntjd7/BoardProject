<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 게시글에 저장한 데이터를 한번에 읽어드림 -->
<jsp:useBean id="boardbean" class="board.BoardBean">
	<jsp:setProperty name="boardbean" property="*"/>
</jsp:useBean>

<%
	// 데이터베이스 쪽으로 빈클래스 넘겨줌
	BoardDAO bdao = new BoardDAO();

	// 데이터 저장용 메소드 호출
	bdao.insertBoard(boardbean);
	
	// 게시글 저장 후 전체게시글 보기
	response.sendRedirect("BoardList.jsp");
%>
</body>
</html>