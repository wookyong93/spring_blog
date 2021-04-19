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
</script>
</head>
<body>
	<form name="frmMod">
		<table>
			<tr>
				<th>
					<h1>회원정보 변경</h1>
				</th>
			</tr>
			<c:forEach var="member" items="${memberInfo}">
			<tr>
				<td>ID</td>					
				<td>
					<input type="text" value="${member.id}" disabled="disabled"/>
					<input type="hidden" name="id" value="${member.id}"/>		
				</td>
			</tr>
			<tr align="center">
				<td>PW</td><td><input type="password" name="pwd" id="pwd" onchange="fn_passwordCheck()"></td>
			</tr>
				<tr>
					<td colspan="3"><div id="pw"></div><input type="hidden" id="checkpwd" value=""/></td>
				</tr>
			<tr align="center">
				<td>PW Check</td><td><input type="password" name="pwdchk" id="pwdchk" onchange="fn_passwordsame()"/></td>
			</tr>
			<tr>
				<td colspan ="3"><div id="pwsame"></div><input type="hidden" id="checkpwdchk" value=""/></td>
			</tr>
			<tr>
				<td>이름</td>					
				<td>
					<input type="text" name="name" id="name"value="${member.name}"/>		
				</td>
			</tr>
			<tr>
				<td>이메일</td>					
				<td>
					<input type="email" name="email" id="email" value="${member.email}" onchange="fn_email()"/>		
					<input type="hidden" id="checkemail" value=""/>
				</td>
			</tr>
			<tr>
				<td colspan="3"><div id="emailcall"></div>
			</tr>
			<tr>
				<td>주소</td>
				<td align="left" colspan="2">
				현재주소<input type="text" size="80" id="address" name="address" value="${member.address}"/><br>
				<input type="text" id="postcode" placeholder="우편번호">
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="roadAddress" placeholder="도로명주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="detailAddress" placeholder="상세주소" onchange="fn_address()">
				<input type="text" id="extraAddress" placeholder="참고항목">

				</td>
			</tr>
			</c:forEach>
			<tr>
			<td colspan="2">
				<input type="button" value="회원정보 수정" onclick="fn_modMember()" />
				<input type="button" value="취소" onclick="location.href='${contextPath}/mypage.do?loginId=${loginId}'"/>
			</td>
			</tr>
		</table>
	</form>
</body>
</html>