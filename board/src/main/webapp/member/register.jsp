<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h1 class="my-5 text-center">MY BBS 회원가입</h1>
<div class="container mb-5">
	<form name="registerform" class="registerform" action="/board/MembersOk" method="post">
		<div class="mb-3 mt-3">
			<div class="row">
				<label for="userid" class="col-md-2 form-label">아이디 : </label>
				<div class="col-md-5">
					<input type="text" class="form-control" id="userid"
						placeholder="아이디" name="userid" />
				</div>
				<div class="col-md-5">
					<button type="button" class="btn btn-primary">중복확인</button>
				</div>
			</div>
		</div>

		<div class="mb-3 mt-3">
			<div class="row">
				<label for="userpass" class="form-label col-md-2">비밀번호 : </label>

				<div class="col-md-5">
					<input type="password" class="form-control" id="userpass"
						placeholder="비밀번호" name="userpass" />
				</div>
				<div class="col-md-5"></div>
			</div>
		</div>

		<div class="mb-3 mt-3">
			<div class="row">
				<label for="reuserpass" class="form-label col-md-2">비밀번호 확인
					: </label>

				<div class="col-md-5">
					<input type="password" class="form-control" id="reuserpass"
						placeholder="비밀번호 확인" name="reuserpass" />
				</div>
				<div class="col-md-5"></div>
			</div>
		</div>

		<div class="mb-3 mt-3">
			<div class="row">
				<label for="username" class="col-md-2 form-label">이름 : </label>

				<div class="col-md-5">
					<input type="text" class="form-control" id="username"
						placeholder="이름" name="username" />
				</div>
				<div class="col-md-5"></div>
			</div>
		</div>

		<div class="mb-3 mt-3">
			<div class="row">
				<label for="useremail" class="col-md-2 form-label">이메일 : </label>

				<div class="col-md-5">
					<input type="email" class="form-control" id="useremail"
						placeholder="이메일" name="useremail" />
				</div>
				<div class="col-md-5"></div>
			</div>
		</div>

		<div class="mb-3 mt-3">
			<div class="row">
				<label for="postcode" class="col-md-2 form-label">주소 : </label>

				<div class="col-md-5">
					<input type="number" readonly class="form-control" id="postcode"
						placeholder="우편번호" name="postcode" />
				</div>
				<div class="col-md-5">
					<button type="button" class="btn btn-primary" onClick="sPostcode()">우편번호 검색</button>

				</div>
				<div class="col-md-2"></div>
				<div class="col-md-9 mt-3 col-md-offset-1">
					<input type="text" name="addr" id="addr" readonly
						class="form-control" />
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-9 mt-3 col-md-offset-1">
					<input type="text" name="detailaddr" id="detailaddr" 
						class="form-control" placeholder="상세주소" />
				</div>
			</div>
		</div>
		
			<input type="hidden" name="useridok" id="useridok" />

		<div class="mb-3 mt-3">
			<div class="row">
				<label for="tel" class="col-md-2 form-label">전화번호 : </label>

				<div class="col-md-3">
					<input type="number" class="form-control" id="tel1" name="tel1" />
				</div>
				<div class="col-md-3">
					<input type="number" class="form-control" id="tel2" name="tel2" />
				</div>
				<div class="col-md-3">
					<input type="number" class="form-control" id="tel3" name="tel3" />
				</div>
			</div>
		</div>
		
		<input type="hidden" name="tel" id="tel" />
		
		<div class="form-btn py-4 text-center">
			<button type="reset" class="btn btn-warning mx-3 px-4">취 소</button>
			<button type="button" class="btn btn-primary mx-3 px-4" onClick="register();">전 송</button>
		</div>
		
	
	</form>
</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src=js/form.js></script>
	