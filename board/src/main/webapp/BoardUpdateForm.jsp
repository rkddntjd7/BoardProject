<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>

.box {
	text-align: center;
	width: 1000px;
	height: 100%;
	margin: 0 auto; 
}

.top {
	display: flex;
}

.row {
	display: flex;
}

.row div {
	
}

.num {
	width: 10%;
}

.subject {
	width: 50%;
	position: relative;
}

.subject input {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
}

.password {
	width: 40%;
	padding: 10px;
}

.password input {
	margin-left: 10px;
	border-radius: 5px;
	border-width: 1px;
}

.writer {
	width: 65px;
	border: none;
}

.wdate {
	width: 100px;
}

.readcount {
	width: 60px;
}

.content {
	border: 1px solid #ddd;
	height: 500px;
	text-align: left;
}

textarea {
	width: 100%;
	height: 100%;
}

.buttons input {
	width: 120px;
	height: 30px;
	background: #fff;
	border-radius: 6px;
	border-width: 1px;
	margin: 30px 10px;
}


</style>
<body>
<%
	// 해당 게시글 번호를 통하여 게시글을 수정
	int num = Integer.parseInt(request.getParameter("num").trim());

	// 하나의 게시글에 대한 정보를 리턴
	BoardDAO bdao = new BoardDAO();
	
	BoardBean bean = bdao.getOneUpdateBoard(num);
%>

<jsp:include page="include/header.jsp"></jsp:include>
	
<form action="BoardUpdateProc.jsp" method="post">
	<div class="container">
		<div class="box">
		<h2> -게시글 수정- </h2>
			<div class="top">
				<div class="writer">
					<p><%=bean.getWriter() %></p>
				</div>
				<div class="wdate">
					<p><%=bean.getReg_date() %></p>
				</div>
				<div class="readcount">
					<p><i class="fa-regular fa-eye"></i><%=bean.getReadcount() %></p>
				</div>
			</div>
			<div class="d-flex">
				<div class="num">
					<p><%=bean.getNum() %></p>
				</div>
				<div class="subject">
					<input type="text" name="subject" value="<%=bean.getSubject() %>" />
				</div>
				<div class="password">
					<span>비밀번호 확인</span><input type="password" name="password" />
				</div>
			</div>
			<div class="content">
				<textarea name="content"  cols="30" rows="10"></textarea>
			</div>
			<div class="buttons">
				<input type="hidden" name="num" value="<%=bean.getNum() %>" />
				<input type="submit" value="글 수정" />
				<input type="button" onclick="location.href='BoardList.jsp'" value="전체글보기" />
			</div>
		</div>
	</div>
	</form>

<jsp:include page="include/footer.jsp"></jsp:include>

</body>
</html>