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
<div class="container ">
	<div class="col-lg-10 col-md-10 col-mx-10"style="margin:0 auto;">
			<div class="card" >
				<div class="card-header bg-secondary text-white" style="text-align: center">
					 <img id="card-img" src="${contextPath}/resources/image/logo.png">
					 <font size="16px" > B L O G</font> 
				</div>
				<div style="text-align: center;margin: 15px;">
					<h3>로그인</h3>
					<form name="loginFrm" class="form-group" > 
				<div class="form-group">
					<img src="${contextPath}/resources/image/user.png" id="formIcon">
					<span class="form-span">I D</span>
					<input class="input-group" type="text" name="id" id="id" placeholder="ID"/>
				</div>
				<div class="form-group" style="margin-bottom: 50px;">
					<img src="${contextPath}/resources/image/padlock.png" id="formIcon"><span class="form-span">PW</span>
					<input class="input-group" type="password" name="pwd" id="pwd"placeholder="PW"/> 
				</div>
				<div class="form-group">	
					<button type="button" onclick="fn_login()" class="form-btn-login">
					<img src="${contextPath}/resources/image/login.png" id="btn-Icon">
					<span class="btn-span">로그인</span>
					</button>
					<button type="button" onclick="fn_cancel()" class="form-btn-cancel">
					<img src="${contextPath}/resources/image/cancel.png" id="btn-Icon">
					<span class="btn-span">취소</span>
					</button>
					<button type="button" onclick="location.href='${contextPath}/joinForm.do'" class="form-btn-join">
					<img src="${contextPath}/resources/image/signUp.png" id="btn-Icon">
					<span class="btn-span">회원가입</span>
					</button>
				</div>						
				</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>