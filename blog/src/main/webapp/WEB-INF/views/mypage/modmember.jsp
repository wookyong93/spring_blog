<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 변경 페이지</title>
<script src="${contextPath}/resources/js/member.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//페스워드가 형식에 맞는지 확인하는 함수
function fn_passwordCheck(){
	//패스워드 형식 지정
	var password=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
	var pw = document.getElementById('pw');
	var checkpwd = document.getElementById('checkpwd');
	if(!password.test(document.getElementById('pwd').value)){
		pw.innerHTML ="<img src='${contextPath}/resources/image/close.png' style='width:20px;'>영어,숫자,특수문자가 1개씩 포함한 8글자 이상이어야합니다.";
	
	}else{
		
			pw.innerHTML ="<img src='${contextPath}/resources/image/check.png' style='width:20px;'>사용가능한 비밀번호입니다";
	
			checkpwd.value ="ok";
	}
	//패스워드 확인 결과 출력
	}
	//PW 와 PWCHECK 가 같은지 화인하는 함수
	function fn_passwordsame(){
		var pwd = document.getElementById('pwd');
		var pwdchk = document.getElementById('pwdchk');
		var pwsame = document.getElementById('pwsame');
		var checkpwdchk = document.getElementById('checkpwdchk');
		if(pwd == ""){
			alert('PW를 입력해주세요');
		}else if(pwd.value == pwdchk.value){
			pwsame.innerHTML = "<img src='${contextPath}/resources/image/check.png' style='width:20px;'>암호가 동일합니다.";
		
			checkpwdchk.value ="ok";
		}else{
			pwsame.innerHTML ="<img src='${contextPath}/resources/image/close.png' style='width:20px;'>암호가 다릅니다."
			
		}
	}
	//주소 입력해주는 함수
	function fn_address(){
		var postcode = document.getElementById('postcode').value;
		var roadAddress = document.getElementById('roadAddress').value;
		var detailAddress = document.getElementById('detailAddress').value;
		var extraAddress = document.getElementById('extraAddress').value;
		var address = document.getElementById('address');
		address.value = "["+postcode+"]"+roadAddress+", "+detailAddress+extraAddress;
		console.log(address);
	}
	//이메일 형식 확인하는 함수
	function fn_email(){
		var emailRule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var emailcall = document.getElementById('emailcall');
		var checkemail = document.getElementById('checkemail');
		if(emailRule.test(document.getElementById('email').value)){
			emailcall.innerHTML="<img src='${contextPath}/resources/image/check.png' style='width:20px;'>사용가능한 이메일 형식입니다.";
			
			checkemail.value ="ok";
		}else{
			emailcall.innerHTML="<img src='${contextPath}/resources/image/close.png' style='width:20px;'>이메일형식이 틀립니다.";
			
		}
}
	function fn_modMember(){
		var frm = document.frmMod;
		var pwd = document.getElementById('pwd');
    	var name = document.getElementById('name');
    	var email = document.getElementById('email');
    	var address = document.getElementById('address').value;
    	var checkpwd = document.getElementById('checkpwd').value;
    	var checkpwdchk = document.getElementById('checkpwdchk').value;
    	var checkemail = document.getElementById('checkemail').value;
		if(pwd.value==""){
			alert('pw는 필수입력입니다');
		}else if(checkpwd ==""){
			alert('입력하신 PW 형식이 잘못되었습니다.');
		}else if(checkpwdchk ==""){
			alert('입력하신 PWCHECK가 PW와 같은지 확인하세요');
		}else if(name.value==""){
			alert('이름은 필수입력입니다');
		}else if(email.vlaue==""){
			alert('email은 필수입력입니다');
		}else if(address ==""){
			alert('주소는 필수입력입니다');
		}else{
			frm.method="post";
			frm.action="${contextPath}/modMember.do";
			frm.submit();
		}
	}
	
	function fn_memberDel(){
		var frm = document.frmMod;
		var con = confirm('회원 탈퇴하시겠습니까?');
		if(con==true){
			var command = prompt('회원가입을 원할시 동일한 문구를 쳐주세요\n(회원탈퇴에 동의합니다.)');
			if(command == '회원탈퇴에 동의합니다.'){
			frm.method="post";
			frm.action="${contextPath}/delMember.do";
			frm.submit();
			}
		}
	}
</script>
</head>
<body>
	<div class="container ">
		<div class="col-lg-10 col-md-10 col-mx-10"style="margin:0 auto;">
			<div class="card" >
				<div class="card-header bg-secondary text-white" style="text-align: center">
					 <img id="card-img" src="${contextPath}/resources/image/logo.png">
					 <font size="16px" > B L O G</font> 
				</div>
				<div style="text-align: center;margin: 15px;">
					<h3>회원정보 수정</h3>
				<c:forEach var="member" items="${memberInfo}">
				<form name="frmMod" class="form-group" > 
					<div class="form-group">
						<img src="${contextPath}/resources/image/user.png" id="formIcon">
						<span class="form-span">I D</span>
					</div>
					<div class="form-group">
						<input class="form-control" type="text" name="id" id="id" value="${member.id}" disabled="disabled"/>
						<input type="hidden" name="id" value="${member.id}"/>
					</div>
					<div class="form-group">
						<img src="${contextPath}/resources/image/padlock.png" id="formIcon"><span class="form-span">PW</span>
						<input class="form-control"  type="password" name="pwd" id="pwd" placeholder="PW"onchange="fn_passwordCheck()"/> 
					</div>
					<input type="hidden" id="checkpwd" value=""/>
					<div id="pw" class="alerter"></div>
					<div class="form-group">
						<img src="${contextPath}/resources/image/padlock.png" id="formIcon"><span class="form-span">PW</span>
						<input class="form-control"  type="password" name="pwdchk" id="pwdchk" onchange="fn_passwordsame()" placeholder="PW CHECK"/> 
					</div>
					<input type="hidden" id="checkpwdchk" value=""/>
					<div id="pwsame" class="alerter"></div>
					<div class="form-group">
						<img src="${contextPath}/resources/image/name.png" id="formIcon"><span class="form-span">이름</span>
						<input class="form-control" type="text" name="name" id="name" value="${member.name}" /> 
					</div>
					<div class="form-group">
						<img src="${contextPath}/resources/image/name.png" id="formIcon"><span class="form-span">E-mail</span>
						<input class="form-control" type="email" name="email"  id="email"
						onchange="fn_email()" value="${member.email}"/> 
						<input type="hidden" id="checkemail" value=""/>
					</div>
					<div id="emailcall" class="alerter"></div>
					<div class="form-goup" style="margin-bottom: 50px;">
						<img src="${contextPath}/resources/image/home.png" id="formIcon">
						<span class="form-span">현 재 주 소</span>
					<div class="from-group">
					<input type="text" class="form-control" id="address" name="address" value="${member.address}"/>
					</div>
					<div class="form-group">
						<img src="${contextPath}/resources/image/home.png" id="formIcon">
						<span class="form-span">주 소</span>
					</div>
					<div class="input-group">
						<input type="text" class="form-control" style="margin-bottom:10px;" id="postcode" placeholder="우편번호">
						<input type="button"class="form-btn-check" style="width: 120px;" onclick="execDaumPostcode()" value="우편번호 찾기">
					</div>
						<input type="text" class="form-control" style="margin-bottom:10px;" id="roadAddress" placeholder="도로명주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" class="form-control" style="margin-bottom:10px;" id="detailAddress" placeholder="상세주소" onchange="fn_address()">
						<input type="text" class="form-control" style="margin-bottom:10px;" id="extraAddress" placeholder="참고항목">
						<input type="hidden" id="address" name="address"/>
					</div>
					<div class="form-group">	
						<button type="button" onclick="fn_modMember()" class="form-btn-join" style="border-color: lightgreen;width: 150px;" >
							<img src="${contextPath}/resources/image/modmember.png" id="btn-Icon">
							<span class="btn-span" style="color:lightgreen">회원정보 변경</span>
						</button>
						<button type="button" style="width: 150px;" onclick="location.href='${contextPath}/mypage.do?loginId=${loginId}'"  class="form-btn-join">
							<img src="${contextPath}/resources/image/cancel.png" id="btn-Icon">
							<span class="btn-span">정보 변경 취소</span>
						</button>
						<button type="button" onclick="fn_memberDel()" class="form-btn-cancel" style="width: 150px;">
							<img src="${contextPath}/resources/image/remove-user.png" id="btn-Icon">
							<span class="btn-span">회원 탈퇴</span>
						</button>
					</div>						
				</form>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>