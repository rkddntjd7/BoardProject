<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, board.MembersDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<jsp:useBean id="mem" class="board.MemberDDL" scope="page" />
<jsp:useBean id="dto" class="board.MembersDTO" scope="page" />
<%!
	int listNum = 10; // 한 페이지당 보여줄 목록 수
	int pageNum = 15; // 한 블럭당 보여줄 페이지 수	
%>



<%

	String pg = request.getParameter("page");
	int mypg = 1;
	try {
		mypg = Integer.parseInt(pg);
		if (mypg < 1) mypg = 1;
	} catch (Exception e) {
		mypg = 1;
	}
	int limitNum = (mypg - 1) * listNum;
	
   Vector data = mem.getSelect(limitNum, listNum);
   
	int maxColumn = mem.getAllSelect();
	int size = data.size();
	
	/*
		1. 전체 페이지 수 2. 전체 블럭수 3. 현재 블록번호 4. 블록당 시작번호 5. 블록당 마지막 번호
	*/
	int totalPage = (int) Math.ceil(maxColumn / (double) listNum);
	int totalBlock = (int) Math.ceil(totalPage / (double) pageNum);
	int nowBlock = (int) Math.ceil(mypg / (double) pageNum);
	int startNum = (nowBlock - 1) * pageNum + 1;
	int endNum = nowBlock * pageNum;
	if (endNum > totalPage) endNum = totalPage;

%>   

<div class="container lmember">
	<h1 class="mt-3 mb-3 text-center">회원목록 (관리자 전용)</h1>
	<div class="text-end">
		총 회원 : <%=maxColumn %>명/<%=totalPage %>페이지
	</div>
	<div class="row">
		<table class="table table-striped memberstbl">
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>가입일</th>
					<th>회원등급</th>
				</tr>
			</thead>
			<tbody>
<%
for(int i=0; i < size; i++){
    MembersDTO dt = (MembersDTO) data.elementAt(i);
    int num = dt.getNum();
    String userid = dt.getUserid();
    String username = dt.getUsername();
    int postcode = dt.getPostcode();
    String addr = dt.getAddr();
    String detailAddr = dt.getDetailaddr();
    String tel = dt.getTel();
    String wdate = dt.getWdate();
    int level = dt.getLevel();
 
%>
	<tr>
		<td><%=num %></td>
		<td><%=userid %></td>
		<td><%=username %></td>
		<td>[<%=postcode %>] <%=addr %> <%=detailAddr %></td>
		<td><%=tel %></td>
		<td><%=wdate %></td>
		<td>
			<%
				if (level == 99) {
			%>
			
			<span class="badge bg-danger px-4 py-2">관리자</span>
			
			<%
				} else {	
			
				String selected1 = "", selected2 = "", selected3 = "", selected4 = "", selected5 = "";
				switch (level) {
				case 0:
					selected1 = "selected";
					break;
				case 1:
					selected2 = "selected";
					break;
				case 2:
					selected3 = "selected";
					break;
				case 3:
					selected4 = "selected";
					break;
				
				}
			%>
			<select name="level" class="level" onchange="memLevel(this, <%=level %>, <%=num %>);">
				<option value="0" <%=selected1 %> >탈퇴회원</option>
				<option value="1" <%=selected2 %> >일반회원</option>
				<option value="2" <%=selected3 %> >유료회원</option>
				<option value="3" <%=selected4 %> >VIP회원</option>
			</select>
		</td>
	
	</tr>
<%
				}
}
%>
			</tbody>
			
		</table>
	</div> <!-- /row -->
	<div class="mt-3 mb-5 row ">
		<ul class="pagination justify-content-center mb-5">
			<%
				//이전페이지
				if (startNum > 1)  {
					int prevPage = startNum -1;
					out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"?fname=member/memberlist&page="+prevPage+"\">이전</a></li>");
				} else {
					out.print("<li class=\"page-item\"><a class=\"page-link text-muted\" href=\"javascript:void(0)\">이전</a></li>");
				}
			
				//페이지 출력
				for(int i = startNum; i <= endNum; i++) {
					String act = "";
					if (mypg == i) act = "active";
				
			%>
				<li class="page-item <%=act %>"> <a href="?fname=member/memberlist&page=<%=i %>" class="page-link"><%=i %></a></li>
			<%
				}
				
				// 다음페이지
				if (endNum < totalPage) {
					int nextPage = endNum + 1;
					out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"?fname=member/memberlist&page="+nextPage+"\">다음</a></li>");
				} else {
					out.print("<li class=\"page-item\"><a class=\"page-link text-muted\" href=\"javascript:void(0)\">다음</a></li>");
				}
			%>
		</ul>
	</div>
</div>