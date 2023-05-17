<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
	.container {
		width: 1200px;
		margin: 0 auto;
	}
	
	.row {
		display: flex;
		padding-left: 230px;
		padding-bottom: 20px;
	}
	
	input {
		height: 25px;
		border-radius: 10px;
		margin-right: 20px;
	}	
	
	textarea {
		border-radius: 10px;
	}
	
	h1 {
		text-align: center;
	}
	
	.formbox {
		text-align: center;
	}
	
	.button {
		margin-top: 20px;
	}
	
	.button input {
		width: 80px;
		height: 30px;
		background: #fff;
	}
	
	button {
		width: 120px;
		height: 30px;
		background: #fff;
		border-radius: 10px;
	}
	
</style>
<html>
<body>
	<div class="container">
	<h1>게시글 쓰기</h1>
		<form action="BoardWriteProc.jsp" method="post">
			<div class="formbox">
				<div class="row">
					<div>
						<label for=""> 작성자 </label>
						<input type="text" name="writer" />
					</div>
					<div>
						<label for=""> 제목 </label> 
						<input type="text" name="subject" size="60"/>
					</div>
			</div>
			<div class="row">
				<div>
					<label for=""> 이메일 </label> 
					<input type="email" name="email" size="30"/>
				</div>
				<div>
					<label for=""> 비밀번호 </label>
					<input type="password" name="password" />
				</div>
			</div>
			<div>
				<textarea name="content" cols="100" rows="50" placeholder="글 내용"></textarea>
			</div>
			<div class="button">
				<input type="submit" value="글쓰기" /> &nbsp; &nbsp;
				<input type="reset" value="다시작성" /> &nbsp; &nbsp;
				<button onclick="location.href='BoardList.jsp'">전체 게시글 보기</button>
			</div>
			</div>
		</form>
	</div>
</body>
</html>