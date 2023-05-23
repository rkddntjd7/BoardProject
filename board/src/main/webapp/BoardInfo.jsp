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
	
	.num {
		width: 20%;
	}
	
	.subject {
		width: 80%
	}
	
	.writer {
		width: 100px;
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
		height: 100%;
		text-align: left;
	}
	
	input {
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
	int num = Integer.parseInt(request.getParameter("num").trim()); // 공백 제거 후 정수형으로 바뀜

	// 데이터베이스 접근
	BoardDAO bdao = new BoardDAO();

	// boardbean 타입으로 하나의 게시글을 리턴
	BoardBean bean = bdao.getOneBoard(num);
	%>

	<jsp:include page="include/header.jsp"></jsp:include>


	<div class="container">
		<div class="box">
			<div class="d-flex">
				<div class="writer">
					<p><%=bean.getWriter()%></p>
				</div>
				<div class="wdate">
					<p><%=bean.getReg_date()%></p>
				</div>
				<div class="readcount">
					<p>
						<i class="fa-regular fa-eye"></i><%=bean.getReadcount()%></p>
				</div>
			</div>
			<div class="d-flex">
				<div class="num">
					<p><%=bean.getNum()%></p>
				</div>
				<div class="subject">
					<p><%=bean.getSubject()%></p>
				</div>
			</div>
			<div class="content">
				<p><%=bean.getContent()%></p>
			</div>
			<input type="button" value="수정하기"
				onclick="location.href='BoardUpdateForm.jsp?num=<%=bean.getNum()%>'" />
			<input type="button" value="삭제하기"
				onclick="location.href='BoardDeleteForm.jsp?num=<%=bean.getNum()%>'" />
			<input type="button" value="전체 게시글 보기"
				onclick="location.href='BoardList.jsp'" />
		</div>
	</div>


	<jsp:include page="include/footer.jsp"></jsp:include>

</body>
</html>