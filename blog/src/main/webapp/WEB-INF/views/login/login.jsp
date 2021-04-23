<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
<script>
window.onload=function(){
		var id = "${loginId}";
		if(id != ""){
			alert('잘못된 접근입니다.');
			location.href="${contextPath}/main.do";
		}
	}
	function fn_login(){
		var frm = document.loginFrm
		var id = document.getElementById("id");
		var pwd = document.getElementById("pwd");
		
		if(id.value==""){
			alert('ID 를 입력해주세요');
			id.focus();
		}else if(pwd.value==""){
			alert('PWD를 입력해주세요');
			pwd.focus();
		}else{
			frm.action="${contextPath}/loginCheck.do";
			frm.method="post";
			frm.submit();
		}
	}
	function fn_cancel(){
		location.href="${contextPath}/home.do";
	}
</script>
</head>
<body>
	<form name="loginFrm" >
		<table align="center">
			<tr align="center">
				<td > ID : </td><td><input type="text" name="id" id="id"/></td>
			</tr>
			<tr>
				<td> PW : </td><td><input type="password" name="pwd" id="pwd"/></td>
			</tr>
			<tr align="center">
				<td><br></td>
			</tr>
			<tr align="center">
			<td><input type="button" value="Login" onclick="fn_login()"/></td>
			<td><input type="button" value="cancel" onclick="fn_cancel()"/></td>
			<td><button onclick="location.href='${contextPath}/joinForm.do'">회원가입</button></td>
			</tr>
		</table>
			
	</form>
</body>
</html>