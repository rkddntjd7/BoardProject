<%@page import="java.util.Vector"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>


<%
	// 전체 게시글의 내용을 jsp 쪽으로 가져와야함
	BoardDAO bdao = new BoardDAO();

	// 전체 게시글을 리턴 받아주는 소스
	Vector<Boardbean> vec = bdao.getAllVBoard();
%>
</body>
</html>