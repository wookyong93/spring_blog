<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
<div class="col-lg-10 col-md-10 col-mx-10"style="margin:0 auto;">
			<div class="card" >
				<div class="card-header bg-secondary text-white" style="text-align: center">
					 <img id="card-img" src="${contextPath}/resources/image/logo.png">
					 <font size="16px" > B L O G</font> 
				</div>
				<div style="text-align: center;margin: 15px;">
					<h3>비밀번호 확인</h3>
				<form name="frm" id="frm" class="form-group" > 
					<div class="form-group">
						<img src="${contextPath}/resources/image/padlock.png" id="formIcon">
						<span class="form-span">현재 비밀번호</span>
						<input type="hidden" value="${loginId}" name="id"/>
					</div>
					<div class="input-group">
						<input class="form-control" type="password" name="pwd" id="pwd"/>
						<span class="input-group-btn">
							<button type="button" class="form-btn-login" onclick="fn_pwdChk()" >
							확인
							</button>
			      		</span>
					</div>
					<div class="form-group" style="margin-top: 30px;">
						<button type="button" onclick="location.href='${contextPath}/main.do';"  class="form-btn-cancel"style="width: 150px;">
							<img src="${contextPath}/resources/image/cancel.png" id="btn-Icon">
							<span class="btn-span">메인페이지 이동</span>
						</button>
					</div>						
				</form>
				</div>
			</div>
		</div>
</body>
</html>