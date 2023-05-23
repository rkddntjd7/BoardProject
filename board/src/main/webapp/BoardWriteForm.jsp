<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.container {
	width: 1000px;
	margin: 0 auto;
}

.row {
	display: flex;
	padding-bottom: 20px;
	justify-content: center;
}

input {
	height: 25px;
	border-radius: 6px;
	margin-right: 20px;
	border-width: 1px;
}

textarea {
	border-radius: 10px;
}

h1 {
	text-align: center;
	margin-bottom: 100px;
}

.formbox {
	text-align: center;
}

.button {
	width: 1000px;
	height: 100%;
	margin-top: 20px;
}

.button input {
	width: 80px;
	height: 30px;
	background: #fff;
	border-width: 1px;
}

button {
	width: 120px;
	height: 30px;
	background: #fff;
	border-radius: 6px;
	border-width: 1px;
}

#subject {
	width: 700px;
}

#password, #writer {
	width: 290px;
}
</style>
<html>
<body>


	<div class="container">
		<h1>-게시글 쓰기-</h1>
		<form action="BoardWriteProc.jsp" method="post">
			<div class="formbox">
				<div class="row">

					<div>
						<label for=""> 제목 </label> <input type="text" name="subject"
							id="subject" />
					</div>
				</div>
				<div class="row">
					<div>
						<label for=""> 작성자 </label> <input type="text" name="writer" id="writer"/>
					</div>
					<div>
						<label for=""> 비밀번호 </label> <input type="password"
							name="password" id="password"/>
					</div>
				</div>
				<div>
					<textarea name="content" cols="100" rows="50" placeholder="글 내용"></textarea>
				</div>
				<div class="button">
					<input type="submit" value="글쓰기" /> &nbsp; &nbsp; <input
						type="reset" value="다시작성" /> &nbsp; &nbsp;
					<button onclick="location.href='BoardList.jsp'">전체 게시글 보기</button>
				</div>
			</div>
		</form>
	</div>

	
</body>
</html>