<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>

	#headerBtn{
		width: 120px;
		height:40px;
		font-size: 16px;
		background-color: transparent;
		border: 0px;
		outline: none;
	}
	#btnIcon{
		width:20px;
		height: 20px;
	}
	#logoImg{
		margin-bottom: 20px;
		width: 60px;
		background-color: white;
	}
	#mainNav .navbar-nav>li.nav-item>a{
		font-size: 15px; 
	}
	#mainNav .navbar-nav>li.nav-item>a{
		padding:5px 10px;
		margin-top: 0px;
		
	}
</style>
<script>
		function fn_mypage(){
			var frm = document.frm
			frm.action="${contextPath}/mypage.do";
			frm.method="post";
			frm.submit();
	}</script>
</head>
<body>
	 
    <div class="container">
      <a class="navbar-brand" href="${contextPath}/main.do"><img id="logoImg" src="${contextPath}/resources/image/logo.png"><font size="30px"> B L O G</font></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav ml-auto">
			
			<li class="nav-item">
			<a class="nav-link" href='${contextPath}/latelyBoard.do'>최근 글</a>
			</li>
			<li class="nav-item"> 
			<a class="nav-link" href='${contextPath}/hitBoard.do'>최 다 조회수</a>
			</li>
			<c:if test="${loginId == null}">
			<li class="nav-item">
			<a class="nav-link" href='${contextPath}/login.do'>
			<img id ="btnIcon" src="${contextPath}/resources/image/login.png">로그인</a>
			</li>
			<li class="nav-item">
			<a class="nav-link" href='${contextPath}/joinForm.do'>
			<img id ="btnIcon" src="${contextPath}/resources/image/signUp.png">회원가입</a>
			</li>
		</c:if>
			<c:if test="${loginId != null}">
			<li class="nav-item">
				<a class="nav-link" href="${contextPath}/boardmain.do?loginId=${loginId}">내 게시글</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${contextPath}/writeForm.do">글쓰기</a>
			</li>
			<li class="nav-item">
			<a href="javascript:void(0);" class="nav-link" onclick="fn_logout()">
			<img id ="btnIcon" src="${contextPath}/resources/image/logout.png">로그아웃</a>
			</li>
			<li class="nav-item">
		 	<a href="javascript:void(0);" class="nav-link" onclick="fn_mypage()">
			<img id ="btnIcon" src="${contextPath}/resources/image/mypage.png">마이페이지</a>
			</li>
			</c:if>
		</ul>
		</div>
	</div>
	<form name="frm" style="display: none;">
	<input type="hidden" name="loginId"value="${loginId}"/>
	</form>
</body>
</html>