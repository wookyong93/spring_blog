<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
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
	
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath}/resources/js/member.js" ></script>
<script>
   
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
	<form name="frm">
		<table id="jointable">
			<tr class="jointr">
				<td colspan="3"  class="tabletitle">회원가입</td>
			</tr>
			<tr align="center">
				<td width="20%" class="nametag">ID</td>
				<td width="50%">
				<c:if test="${okId == null}">
				<%--중복체크된 아이디가 존재하지 않을 경우 --%> 
					<input type="text"  class="textfield" name="id" id="id" onchange="fn_idchk()"/>
					<input type="hidden" id="check" value="no"/>
				</c:if>
				<c:if test="${okId != null}">
				<%--중복체크된 아이디가 존재할 경우 --%>
				<input type="text"  class="textfield" name="id" id="id" value="${okId}"/>
				<input type="hidden" id="check" value="ok"/>
				</c:if>
				</td>
				
				<td width="20%"><input type="button" value="중복체크" id="idcheck" onclick="fn_idCheck()" /></td>
			</tr>
			<tr>
				<td colspan="3"><div id="idcall" class="alerter"></div></td>
			</tr>
			<tr>
				<td class="nametag">PW</td><td><input class="textfield" type="password" name="pwd" id="pwd" onchange="fn_passwordCheck()"></td>
			</tr>
				<tr>
					<td colspan="3"><div id="pw" class="alerter"></div><input type="hidden" id="checkpwd" value=""/></td>
				</tr>
			<tr>
				<td class="nametag">PW Check</td><td><input  class="textfield" type="password" name="pwdchk" id="pwdchk" onchange="fn_passwordsame()"/></td>
			</tr>
			<tr>
				<td colspan ="3"><div id="pwsame" class="alerter"></div><input type="hidden" id="checkpwdchk" value=""/></td>
			</tr>
			<tr>
				<td class="nametag">이름</td><td><input  class="textfield" type="text" name="name" id="name"/></td>
			</tr>
			<tr>
				<td class="nametag">E-mail</td>
				<td>
					<input type="email" name="email" class="textfield"  id="email" onchange="fn_email()"/>
					<input type="hidden" id="checkemail" value=""/>
				</td>
			</tr>
			<tr>
				<td colspan="3"><div id="emailcall" class="alerter"></div>
			</tr>
			<tr>
				<td class="nametag">주소</td>
				<td align="left" colspan="2">
				<input type="text" class="addrfield" id="postcode" placeholder="우편번호">
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" class="addrfield" id="roadAddress" placeholder="도로명주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" class="addrfield" id="detailAddress" placeholder="상세주소" onchange="fn_address()"><br>
				<input type="text" class="addrfield" id="extraAddress" placeholder="참고항목">
				<input type="hidden" id="address" name="address"/>
				</td>
			</tr>
			<tr>
			<td colspan ="3">
				<input type="button" value="가입" onclick="fn_join()"/>
				<input type="button" value="취소" onclick="location.href='${contextPath}/main.do';"/>
			</td>
			</tr> 
		</table>
	</form>
</body>
</html>