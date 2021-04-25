<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
<style>
#card-img{
	width: 40px; 
	margin-bottom: 20px; 
}
#formIcon{
	width: 25px;
	margin: 5px;
}
#btn-Icon{
	float:left;
	width: 25px;
	padding: 0px;
	margin: 2px 4px 2px 4px;    
} 
.form-span{
	margin : 5px;
	font-family: squareRoundEB;
	font-weight: bold;
}
.form-btn-login{
	width: 100px;
	padding: 2px;
	margin:1px 4px 1px 4px; 
	border-radius: 5px;
	color: lightgreen;  
	border:4px solid lightgreen;  
	background-color: transparent;
	outline: 0;
} 
.form-btn-cancel{
	width: 100px;
	padding: 2px;
	margin:1px 4px 1px 4px; 
	border-radius: 5px;
	color: red;  
	border:4px solid red; 
	background-color: transparent;
	outline: 0;
} 
.form-btn-join{
	width: 100px;
	padding: 2px;
	margin:1px 4px 1px 4px; 
	border-radius: 5px; 
	color: lightblue;   
	border:4px solid lightblue; 
	background-color: transparent;
} 
.btn-span{
	font-size: 14px;  
	font-family: squareRoundEB;
}
.form-btn-join:focus,.form-btn-cancel:focus,.form-btn-login:focus {
	outline: none;
}
.form-group>input{
	outline: none; 
	font-family: squareRoundEB;
}

</style>
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
					<input class="form-group" type="text" name="id" id="id" placeholder="ID"/>
				</div>
				<div class="form-group">
					<img src="${contextPath}/resources/image/padlock.png" id="formIcon"><span class="form-span">PW</span>
					<input class="form-group" type="password" name="pwd" id="pwd"placeholder="PW"/> 
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
					<button onclick="location.href='${contextPath}/joinForm.do'" class="form-btn-join">
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