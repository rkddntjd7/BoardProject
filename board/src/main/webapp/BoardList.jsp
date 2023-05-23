<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
	.box {
		width: 1200px;
		height: 100%;
		margin: 0 auto;
	}

</style>
</head>
<body>

<%
	// 전체 게시글의 내용을 jsp 쪽으로 가져옴
	BoardDAO bdao  = new BoardDAO();

	// 전체 게시글을 리턴 받는 메소드
	Vector<BoardBean> vec = bdao.getAllBoard();
%>
	<jsp:include page="include/header.jsp"></jsp:include>
		
		
		<div class="box">
		<div class="d-flex justify-content-end">
			<a href="BoardWriteForm.jsp"><i class="fa-solid fa-pen-to-square"></i></a> &nbsp;&nbsp;&nbsp;
			<a href="BoardList.jsp"><i class="fa-solid fa-list"></i></a>
		</div>
			<div class="d-flex">
				<div class="num col-1 text-center">번호</div>
				<div class="subject col-7 text-center">제목</div>
				<div class="writer col-2 text-center">글쓴이</div>
				<div class="readcount col-1 text-center">조회수</div>
				<div class="date col-1 text-center">날짜</div>
			</div>
			
			<hr/>
<%
	for (int i = 0; i < vec.size(); i++) {
		BoardBean bean = vec.get(i); // 벡터에 저장되어있는 빈클래스를 하나씩 추출	
	
%>			
			<div class="d-flex">
				<div class="num col-1 text-center"> <%=i+1 %></div>
				<div class="subject col-7 text-center"><a href="BoardInfo.jsp?num=<%=bean.getNum()%>"><%=bean.getSubject() %></a></div>
				<div class="writer col-2 text-center"><%=bean.getWriter() %></div>
				<div class="readcount col-1 text-center"><%=bean.getReadcount() %></div>
				<div class="date col-1 text-center"><%=bean.getReg_date() %></div>
			</div>
			
			<hr />
	
		
<%
	}
%>
		</div>
		
		
	
	
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>