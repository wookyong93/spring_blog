<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script> 
window.onload=function(){
		var id = "${loginId}";
		if(id == ""){
			alert('잘못된 접근입니다.');
			location.href="${contextPath}/main.do";
		}
	}
	function fn_pwdmod(){
		var check = confirm('회원정보를 변경하시겠습니까 ?');
		if(check == true){
			location.href="${contextPath}/pwdcheck.do";
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
					<h3>내 정 보</h3>
				<c:forEach var ="member" items="${memberInfo}">
					<div class="form-group">
						<img src="${contextPath}/resources/image/user.png" id="formIcon">
						<span class="form-span">I D</span>
					</div>
					<div class="form-group">
					<%--중복체크된 아이디가 존재하지 않을 경우 --%> 
						<input class="form-control" type="text" name="id" id="id" value="${member.id}" readonly="readonly"/>
					</div>
					<div class="form-group">
						<img src="${contextPath}/resources/image/name.png" id="formIcon"><span class="form-span">이름</span>
						<input class="form-control" type="text" name="name" id="name" value="${member.name}" readonly="readonly"/> 
					</div>
					<div class="form-group">
						<img src="${contextPath}/resources/image/name.png" id="formIcon"><span class="form-span">E-mail</span>
						<input class="form-control" type="email" name="email" value="${member.email}" readonly="readonly"/> 
						<input type="hidden" id="checkemail" value=""/>
					</div>
					<div class="form-goup" style="margin-bottom: 50px;">
						<img src="${contextPath}/resources/image/home.png" id="formIcon">
						<span class="form-span">주 소</span>
					<div class="input-group">
						<input type="text" class="form-control" name="address" value="${member.address}"readonly="readonly">
					</div>
					
					</div>
					<div class="form-group">	
						<button onclick="fn_pwdmod()" class="form-btn-join" style="width: 150px;">
							<img src="${contextPath}/resources/image/modmember.png" id="btn-Icon">
							<span class="btn-span">회원정보 변경</span>
						</button>
						<button type="button" onclick="location.href='${contextPath}/main.do';"  class="form-btn-cancel"style="width: 150px;">
							<img src="${contextPath}/resources/image/cancel.png" id="btn-Icon">
							<span class="btn-span">메인페이지 이동</span>
						</button>
					</div>						
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>