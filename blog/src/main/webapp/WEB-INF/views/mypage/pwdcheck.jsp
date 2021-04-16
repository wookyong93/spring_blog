<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<form name="frm" id="frm">
		현재 비밀빈호 : <input type="password" name="pwd" id="pwd"/> <input type="button" value="확인" onclick="fn_pwdChk()"/>
		<input type="hidden" value="${loginId}" name="id"/>
	</form>
	<script>
	
	function fn_pwdChk(){
		var frm = document.getElementById('frm');
		var pwd = document.getElementById('pwd');
		
		if(pwd.value == ""){
			alert('암호를 입력해주세요');
			pwd.focus();
		}else{
			frm.method="post";
			frm.action = "${contextPath}/pwdchk.do";
			frm.submit();
		}
	}
</script>
</body>
</html>