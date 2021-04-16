<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        	
        }).open();
    }
    //ID 조건식 충족 여부 확인
    function fn_idchk(){
    	var idRule = /^[A-Za-z0-9]{5,}$/;
    	var idcall = document.getElementById('idcall');
    	if(idRule.test(document.getElementById('id').value)){
    		idcall.innerHTML ="아이디 조건에 맞습니다."
    	}else{
    		idcall.innerHTML ="아이디는 영문 +숫자 조합으로 5글자 이상 사용해야합니다.";
    	}
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
    function fn_passwordCheck(){
    	var password=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
    	var pw = document.getElementById('pw');
    	if(!password.test(document.getElementById('pwd').value)){
    		pw.innerHTML ='영어,숫자,특수문자가 1개씩 포함한 8글자 이상이어야합니다.';
    	}else{
    		
  			pw.innerHTML ="사용가능한 비밀번호입니다";
    	}
    }
    function fn_passwordsame(){
    	var pwd = document.getElementById('pwd');
    	var pwdchk = document.getElementById('pwdchk');
    	var pwsame = document.getElementById('pwsame');
    	if(pwd == ""){
    		alert('PW를 입력해주세요');
    	}else if(pwd.value == pwdchk.value){
    		pwsame.innerHTML = "암호가 동일합니다.";
    	}else{
    		pwsame.innerHTML ="암호가 다릅니다."
    	}
    }
    function fn_address(){
    	var postcode = document.getElementById('postcode').value;
    	var roadAddress = document.getElementById('roadAddress').value;
    	var detailAddress = document.getElementById('detailAddress').value;
    	var extraAddress = document.getElementById('extraAddress').value;
    	var address = document.getElementById('address').value;
    	address = "["+postcode+"]"+roadAddress+", "+detailAddress+extraAddress;
    	console.log(address);
    }
    function fn_email(){
    	var emailRule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	var emailcall = document.getElementById('emailcall');
    	if(emailRule.test(document.getElementById('email').value)){
    		emailcall.innerHTML="사용가능한 이메일 형식입니다.";
    	}else{
    		emailcall.innerHTML="이메일형식이 틀립니다.";
    	}
    }
</script>
</head>
<body>
	<form name="frm">
		<table>
			<tr align="center">
				<td>ID</td>
				<td align="left">
				<c:if test="${okId == null}">
				<%--중복체크된 아이디가 존재하지 않을 경우 --%>
					<input type="text" name="id" id="id" onchange="fn_idchk()"/>
				</c:if>
				<c:if test="${okId != null}">
				<%--중복체크된 아이디가 존재할 경우 --%>
				<input type="text" name="id" id="id" value="${okId}"/>
				<input type="hidden" class="check" value="ok"/>
				</c:if>
				</td>
				
				<td align="left"><input type="button" value="중복체크" id="idcheck" onclick="fn_idCheck()" /></td>
			</tr>
			<tr>
				<td colspan="3"><div id="idcall"></div></td>
			</tr>
			<tr align="center">
				<td>PW</td><td align="left"><input type="password" name="pwd" id="pwd" onchange="fn_passwordCheck()"></td>
			</tr>
				<tr>
					<td colspan="3"><div id="pw"></div></td>
				</tr>
			<tr align="center">
				<td>PW Check</td><td align="left"><input type="password" name="pwdchk" id="pwdchk" onchange="fn_passwordsame()"/></td>
			</tr>
			<tr>
				<td colspan ="3"><div id="pwsame"></div></td>
			</tr>
			<tr align="center">
				<td>이름</td><td align="left"><input type="text" name="name" id="name"/></td>
			</tr>
			<tr>
				<td>E-mail</td><td align="left"><input type="email" name="email" id="email" onchange="fn_email()"/></td>
			</tr>
			<tr>
				<td colspan="3"><div id="emailcall"></div>
			</tr>
			<tr>
				<td>주소</td>
				<td align="left">
				<input type="text" id="postcode" placeholder="우편번호">
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="roadAddress" placeholder="도로명주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="detailAddress" placeholder="상세주소" onchange="fn_address()">
				<input type="text" id="extraAddress" placeholder="참고항목">
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