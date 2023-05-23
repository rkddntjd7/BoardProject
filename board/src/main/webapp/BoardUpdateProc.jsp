<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<jsp:useBean id="boardbean" class="board.BoardBean">
	<jsp:setProperty name="boardbean" property="*" />
</jsp:useBean>

<%
	// 데이터베이스 연결	
	BoardDAO bdao = new BoardDAO();
	
	// 해당 게시글의 패스워드값을 받아옴
	String pass = bdao.getPass(boardbean.getNum());
	
	// 기존 패스워드값과 update시 작성했던 password 값이 같은지 비교
	if (pass.equals(boardbean.getPassword())) {
		
		// 데이터 수정
		bdao.updateBoard(boardbean);
		//수정이 완료되면 전체 게시글 보기
		response.sendRedirect("BoardList.jsp");
	} else { // 패스워드가 다르다면
%>
<script>
	alert("패스워드가 일치하지 않습니다. 다시 확인해주세요");
	history.go(-1);
</script>
<%
	}
%>
	
</body>
</html>