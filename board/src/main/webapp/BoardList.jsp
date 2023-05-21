<%@page import="board.BoardBean"%>
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
	Vector<BoardBean> vec = bdao.getAllBoard();
%>

<jsp:include page="/include/header.jsp"></jsp:include>

	<div class="hero">
        <div class="container">
            <h1>리움박물관 문의</h1>
        </div>
    </div>
        <section class="qa">
            <div class="title">
                <h1 class="txt-align">Q&A</h1>
            </div>
            <div class="list-title txt-align">
                <p>번호</p>
                <p>제목</p>
                <p>작성자</p>
                <p>조회수</p>
            </div>
            
<%
	for (int i = 0; i < vec.size(); i++) {
		BoardBean bean = vec.get(i); // 백터에 저장되어있는 빈클래스를 하나씩 추출
	
%>
            <ul class="lbox list-style-none">
                <li class="list">
                    <div class="tbox">
                        <h1><%=bean.getNum() %></h1>
                        <p><a href="BoardInfo.jsp?num=<%=bean.getNum()%>"><%=bean.getSubject() %></a></p>
                    </div>
                    <div class="pbox">
                        <p><%=bean.getWriter() %></p>
                        <p><%=bean.getReadcount() %></p>
                    </div>
                </li>
            </ul>
            
 <%
	}
 %>
            <div class="page txt-align">
                <div class="btn">
                    <span class="prv">
                        <i class="fa-solid fa-angle-left"></i>
                    </span>
                    <div class="number">
                        <span class="active">1</span>
                        <span>2</span>
                        <span>3</span>
                        <span>4</span>
                        <span>5</span>
                    </div>
                    <span class="nxt">
                        <i class="fa-solid fa-angle-right"></i>
                    </span>
                </div>
            </div>
            <div class="srch-wrt">
	            <form name=form action="leeumSearchList" method=post>
	                <div class="srch">
	                	<select class="select-no" name=field>
						 	<option value=title>제목</option>
						 	<option value=content>내용</option>
						 	<option value=write_name>작성자</option>
					 	</select>
	                    <input onmouseover="this.focus()" type="search" id="srch-no" placeholder="검색어를 입력하세요" class="srch_btn">
	                    <div onclick="srchDataCheck()" >
	                    	<i class="fa-solid fa-magnifying-glass"></i>
	                    </div>
	                </div>
                </form>
                <a href="BoardWriteForm.jsp"><input type="button" value="글쓰기" class="wrt"></a>
            </div>
        </section>

<jsp:include page="/include/footer.jsp"></jsp:include>


</body>
</html>