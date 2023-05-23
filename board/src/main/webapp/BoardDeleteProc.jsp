<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
	String pass = request.getParameter("password");
	int num = Integer.parseInt(request.getParameter("num"));
	
	// 데이터베이스 연결
	BoardDAO bdao = new BoardDAO();
	
	String password = bdao.getPass(num);
	
	// 기존 패스워드값과 delete form에서 작성한 패스워드 값을 비교
	if (pass.equals(password)) {
		
		// 패스워드가 같다면
		bdao.deleteBoard(num);
		
		response.sendRedirect("BoardList.jsp");
	} else {
%>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
		history.go(-1);
	</script>
<%
	}
%>

</body>
</html>