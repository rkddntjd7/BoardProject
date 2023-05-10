//정규식
//아이디, 비밀번호 영문 대소문자 , 숫자, 최소3자 이상 8자 이하
const uidPw = /^[a-zA-Z0-9]{4,8}$/;

//이름
const uname = /^[가-힣a-zA-Z]{2,15}$/;

//이메일
const uemail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

//전화번호
const utel = /^01([0|1|6|7|8|9/])-?([0-9]{3,4})-?([0-9]{4})$/;


window.onload = function() {
	if (getCookie("user")) {
		document.getElementById("userid").value = getCookie("user");
		document.loginform.huid.checked = true;
	}
}

function sPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			var address = ''; // 주소 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				address = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				address = data.jibunAddress;
			}
			var extraRoadAddr = ""; //참고항목 
			//도로명에 동,로,가가 있는 경우 추가
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			//건물명, 공동주택 추가
			if (data.bname !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ',' + data.buildingName : data.buildingName);
			}
			//표시할 참고항목이 있을 경우
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("addr").value = address;
			document.getElementById("addr").value += extraRoadAddr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("detailaddr").focus();
		}
	}).open();
}


function register() {
	//변수 정의
	const userid = document.getElementById("userid");
	const userpass = document.getElementById("userpass");
	const reuserpass = document.getElementById("reuserpass");
	const username = document.getElementById("username");
	const useremail = document.getElementById("useremail");
	const postcode = document.getElementById("postcode");
	const addr = document.getElementById("addr");
	const detailaddr = document.getElementById("detailaddr");
	const tel1 = document.getElementById("tel1");
	const tel2 = document.getElementById("tel2");
	const tel3 = document.getElementById("tel3");
	const tel = tel1.value + "-" + tel2.value + "-" + tel3.value;
	const useridok = document.getElementById("useridok");

	//아이디 확인
	if (userid.value == "") {
		alert("아이디를 입력하세요.");
		userid.focus();
		return false;
	}
	else if (!uidPw.test(userid.value)) {
		alert("아이디는 영문,숫자 4자 이상 8자 이하 입니다.");
		userid.value = "";
		userid.focus();
		return false;
	}
	/*
	else if(useridok.value==""){
	   alert("아이디 중복 확인을 하세요.");
	   userid.focus();
	   return false;
	}
	*/
	else if (userpass.value == "") {
		alert("비밀번호를 입력 하세요.");
		userpass.focus();
		return false;
	}
	else if (!uidPw.test(userpass.value)) {
		alert("비밀번호는 영문,숫자 4자 이상 8자 이하 입니다.");
		userpass.value = "";
		userpass.focus();
		return false;
	}
	else if (userpass.value != reuserpass.value) {
		alert("비밀번호가 다릅니다. 비밀번호를 다시 확인하세요.");
		reuserpass.value = "";
		reuserpass.focus();
		return false;
	}
	else if (username.value == "") {
		alert("이름을 입력 하세요.");
		username.focus();
		return false;
	}
	else if (!uname.test(username.value)) {
		alert("이름은 한글 또는 영문으로 2자 이상 적어 주세요.");
		username.focus();
		return false;
	}
	else if (useremail.value == "") {
		alert("이메일을 입력 하세요.");
		useremail.focus();
		return false;
	}
	else if (!uemail.test(useremail.value)) {
		alert("이메일 형식이 아닙니다. 다시 입력하세요.");
		useremail.focus();
		return false;
	}
	else if (postcode.value == "") {
		alert("주소를 입력하세요.");
		postcode.focus();
		return false;
	}
	else if (detailaddr.value == "") {
		alert("상세주소를 입력하세요.");
		detailaddr.focus();
		return false;
	}
	else if (tel1.value == "") {
		alert("전화번호를 입력하세요.");
		tel1.focus();
		return false;
	}
	else if (tel2.value == "") {
		alert("전화번호를 입력하세요.");
		tel2.focus();
		return false;
	}
	else if (tel3.value == "") {
		alert("전화번호를 입력하세요.");
		tel3.focus();
		return false;
	}
	else if (!utel.test(tel)) {
		alert("전화번호 형식이 아닙니다. 다시 입력하세요.");
		tel1.focus();
		return false;
	}
	document.getElementById("tel").value = tel;

	// 이상이 없을 경우 submit
	document.registerform.submit();
}

function loginSubmit() {
	const form = document.loginform;
	const is_checked = form.huid.checked;

	if (form.userid.value == "") {
		alert("아이디를 입력하세요.");
		form.userid.focue();
		return false;
	} else if (form.userpass.value == "") {
		alert("비밀번호를 입력하세요.");
		from.userpass.focus();
		return false;
	}
	if (is_checked) { // 체크박스에 체크 되어 있으면 쿠키를 굽는다. 맛있게!
		setCookie('user', form.userid.value, '3');
	} else {
		// 체크가 되어 있지 않다면 쿠키를 삭제한다.
		delCookie('user', '');
	}

	form.submit();
}




function register2() {
	//변수 정의
	const userid = document.getElementById("userid");
	const userpass = document.getElementById("userpass");
	const reuserpass = document.getElementById("reuserpass");
	const username = document.getElementById("username");
	const useremail = document.getElementById("useremail");
	const postcode = document.getElementById("postcode");
	const addr = document.getElementById("addr");
	const detailaddr = document.getElementById("detailaddr");
	const tel1 = document.getElementById("tel1");
	const tel2 = document.getElementById("tel2");
	const tel3 = document.getElementById("tel3");
	const tel = tel1.value + "-" + tel2.value + "-" + tel3.value;
	const useridok = document.getElementById("useridok");

	//아이디 확인
	if (userid.value == "") {
		alert("아이디를 입력하세요.");
		userid.focus();
		return false;
	}
	else if (!uidPw.test(userid.value)) {
		alert("아이디는 영문,숫자 4자 이상 8자 이하 입니다.");
		userid.value = "";
		userid.focus();
		return false;
	}
	/*
	else if(useridok.value==""){
	   alert("아이디 중복 확인을 하세요.");
	   userid.focus();
	   return false;
	}
	
	else if (userpass.value == "") {
		alert("비밀번호를 입력 하세요.");
		userpass.focus();
		return false;
	}
	*/
	else if (userpass.value != "" && !uidPw.test(userpass.value)) {
		alert("비밀번호는 영문,숫자 4자 이상 8자 이하 입니다.");
		userpass.value = "";
		userpass.focus();
		return false;
	}
	else if (userpass.value != reuserpass.value) {
		alert("비밀번호가 다릅니다. 비밀번호를 다시 확인하세요.");
		reuserpass.value = "";
		reuserpass.focus();
		return false;
	}
	else if (username.value == "") {
		alert("이름을 입력 하세요.");
		username.focus();
		return false;
	}
	else if (!uname.test(username.value)) {
		alert("이름은 한글 또는 영문으로 2자 이상 적어 주세요.");
		username.focus();
		return false;
	}
	else if (useremail.value == "") {
		alert("이메일을 입력 하세요.");
		useremail.focus();
		return false;
	}
	else if (!uemail.test(useremail.value)) {
		alert("이메일 형식이 아닙니다. 다시 입력하세요.");
		useremail.focus();
		return false;
	}
	else if (postcode.value == "") {
		alert("주소를 입력하세요.");
		postcode.focus();
		return false;
	}
	else if (detailaddr.value == "") {
		alert("상세주소를 입력하세요.");
		detailaddr.focus();
		return false;
	}
	else if (tel1.value == "") {
		alert("전화번호를 입력하세요.");
		tel1.focus();
		return false;
	}
	else if (tel2.value == "") {
		alert("전화번호를 입력하세요.");
		tel2.focus();
		return false;
	}
	else if (tel3.value == "") {
		alert("전화번호를 입력하세요.");
		tel3.focus();
		return false;
	}
	else if (!utel.test(tel)) {
		alert("전화번호 형식이 아닙니다. 다시 입력하세요.");
		tel1.focus();
		return false;
	}
	document.getElementById("tel").value = tel;

	// 이상이 없을 경우 submit
	document.edtregisterform.submit();
}





function isChecked() {
	const chk = document.loginform.huid;
	const is_checked = chk.checked;
	if (is_checked) {
		let y = confirm("아이디를 저장하시겠습니까? \n 공공장소에서는 추천하지 않습니다.")
		if (y == false) {
			chk.checked = false;
		}
	}
}
