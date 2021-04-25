<%@ page language="java" contentType="text/html; charset=UTF-8 "
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="loginId" value="${loginId}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
<style>
	.textfield{
		font-size: 20px;
		margin: 3px;
	}
	.nametag{
		text-align:left;
		font-size: 20px;
		font-weight: bold;
	}
	#jointable{
		margin:  auto;
	}
	.tabletitle{
		text-align: center;
		font-size: 32px;
		font-weight: bold;
	}
	.alerter{
		font-size: 8px;
	}

	.form-span,#formIcon{
	margin-bottom: 10px; 
	float: left;
	}
	
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath}/resources/js/member.js" ></script>
<script>
   	window.onload=function(){
   		var id = "${loginId}";
   		if(id != ""){
   			alert('잘못된 접근입니다.');
   			location.href="${contextPath}/main.do";
   		}
   	}
    //ID 조건식 충족 여부 확인
    function fn_idchk(){
    	//ID 입력시 영문 숫자조합 필수
    	var idRule = /^[A-Za-z0-9]{5,}$/;
    	//ID 조건이 맞는지 출력할 div 호출
    	var idcall = document.getElementById('idcall');
    	if(idRule.test(document.getElementById('id').value)){
    		idcall.innerHTML ="아이디 조건에 맞습니다."
    	}else{
    		idcall.innerHTML ="아이디는 영문 +숫자 조합으로 5글자 이상 사용해야합니다.";
    	}
    	//해당태그에 추가 
    }
    //ID 중복체크 
    function fn_idCheck(){
    	//버튼 클릭시 실행
    	var id = document.getElementById('id');
    	var frm=document.frm;
    	if(id.value==""){
    		//id 값 공란 제거
    		alert('id를 입력해주세요');
    		id.focus();
    	}else{
    		//controller 전송하여 검사
    		frm.method="post";
    		frm.action="${contextPath}/idCheck.do"; 
    		frm.submit();
    	}
    }
    
    //회원가입 버튼클릭시 실행
    function fn_join(){
    	var frm = document.frm;
    	var id = document.getElementById('id');
    	var pwd = document.getElementById('pwd');
    	var name = document.getElementById('name');
    	var email = document.getElementById('email');
    	var address = document.getElementById('address').value;
    	var check = document.getElementById('check').value;
    	var checkpwd = document.getElementById('checkpwd').value;
    	var checkpwdchk = document.getElementById('checkpwdchk').value;
    	var checkemail = document.getElementById('checkemail').value;
    	 if(id.value==""){
    		alert('ID는 필수입력입니다');
    	}else if(pwd.value==""){
    		alert('pw는 필수입력입니다');
    	}else if(checkpwd ==""){
    		alert('입력하신 PW 형식이 잘못되었습니다.');
    	}else if(checkpwdchk ==""){
    		alert('입력하신 PWCHECK가 PW와 같은지 확인하세요');
    	}else if(name.value==""){
    		alert('이름은 필수입력입니다');
    	}else if(email.vlaue==""){
    		alert('email은 필수입력입니다');
    	}else if(checkemail==""){
    		alert('email형식을 확인해주세요');	
    	}else if(address ==""){
    		alert('주소는 필수입력입니다');
    	}else if(check !="ok"){
    		alert('중복체크를 해주세요');
    	}else {
    		frm.method="post";
    		frm.action="${contextPath}/addMember.do";
    		frm.submit();
    	}
    	 //해당 조건 맞을시 해당 action 실행;
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
					<h3>회원가입</h3>
				<form name="frm" class="form-group" > 
					<div class="form-group">
						<img src="${contextPath}/resources/image/user.png" id="formIcon">
						<span class="form-span">I D</span>
					</div>
					<div class="input-group">
					<c:if test="${okId == null}">
					<%--중복체크된 아이디가 존재하지 않을 경우 --%> 
						<input class="form-control" type="text" name="id" id="id" onchange="fn_idchk()" placeholder="ID"/>
						<input type="hidden" id="check" value="no"/>
					</c:if>
					<c:if test="${okId != null}">
					<%--중복체크된 아이디가 존재할 경우 --%>
						<input class="form-control" type="text" name="id" id="id" onchange="fn_idchk()" value="${okId}"/>
						<input type="hidden" id="check" value="ok"/>
					</c:if>
						<span class="input-group-btn">
							<button type="button" class="form-btn-check" id="idcheck" onclick="fn_idCheck()" >
							중복체크
							</button>
			      		</span>
					</div>
					<div id="idcall" class="alerter"></div>
					<div class="form-group">
						<img src="${contextPath}/resources/image/padlock.png" id="formIcon"><span class="form-span">PW</span>
						<input class="form-control"  type="password" name="pwd" id="pwd"placeholder="PW"/> 
					</div>
					<div id="pw" class="alerter"></div>
					<div class="form-group">
						<img src="${contextPath}/resources/image/padlock.png" id="formIcon"><span class="form-span">PW</span>
						<input class="form-control"  type="password" name="pwdchk" id="pwdchk" onchange="fn_passwordsame()" placeholder="PW CHECK"/> 
					</div>
					<div id="pwsame" class="alerter"></div>
					<div class="form-group">
						<img src="${contextPath}/resources/image/name.png" id="formIcon"><span class="form-span">이름</span>
						<input class="form-control" type="text" name="name" id="name" placeholder="NAME"/> 
					</div>
					<div class="form-group">
						<img src="${contextPath}/resources/image/name.png" id="formIcon"><span class="form-span">E-mail</span>
						<input class="form-control" type="email" name="email" 
						onchange="fn_email()" placeholder="E-MAIL"/> 
						<input type="hidden" id="checkemail" value=""/>
					</div>
					<div id="emailcall" class="alerter"></div>
					<div class="form-goup" style="margin-bottom: 50px;">
						<img src="${contextPath}/resources/image/home.png" id="formIcon">
						<span class="form-span">주 소</span>
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
						<button onclick="fn_join()" class="form-btn-join" style="border-color: lightgreen">
							<img src="${contextPath}/resources/image/signUp.png" id="btn-Icon">
							<span class="btn-span" style="color:lightgreen">회원가입</span>
						</button>
						<button type="button" onclick="location.href='${contextPath}/main.do';"  class="form-btn-cancel">
							<img src="${contextPath}/resources/image/cancel.png" id="btn-Icon">
							<span class="btn-span">취소</span>
						</button>
					</div>						
				</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>