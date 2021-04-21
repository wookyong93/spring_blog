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
	a#logo{
		text-decoration: none;
		font-size:32px;
		font-weight:bold;
		background-color:lightblue;
		padding:10px;
		color:white;
		border-radius: 5px;
	}
	a#logo:hover{
		text-decoration: none;
	}
	.headerTitle{
		font-size: 32px;
		font-style: italic;
		font-weight: bold;
			}
	
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
	#headerBtn:hover{
		border:0px;
		color:blue;
	}
</style>
<script>
	//로그아웃 컴펌 받고 트루일경우 /logout.do 로 이동
	function fn_logout(){
		var logout = confirm('정말 로그아웃하시겠습니까 ?');
		if(logout==true){
			location.href="${contextPath}/logout.do";
		}else{
			location.href="${contextPath}/main.do";
		}
	}
	
</script>
</head>
<body>
	<table width="100%">
		<tr>
		<td width="15%" align="left"><a id="logo" href="${contextPath}/main.do">Blog</a></td>
		
		<c:if test="${loginId == null}">
		<td width="50%" class="headerTitle" align="center">B L O G</td>
		<td width="40%" align="right">
		<button id="headerBtn" onclick="location.href='${contextPath}/login.do'">
			<img id ="btnIcon" src="${contextPath}/resources/image/login.png">로그인</button>
		 | 
		<button id="headerBtn" onclick="location.href='${contextPath}/joinForm.do'">
			<img id ="btnIcon" src="${contextPath}/resources/image/signUp.png">회원가입</button>
		</c:if>
		<c:if test="${loginId != null}">
			<td width="50%" class="headerTitle" align="center">${loginId}'s B L O G</td>
			<td align="right">
			<form name="frm">
				<input type="hidden" value="${loginId}" name="loginId"/>
			</form>
		<button id="headerBtn" onclick="fn_logout()">
			<img id ="btnIcon" src="${contextPath}/resources/image/logout.png">로그아웃</button>
		 | 
		 
		 <button id="headerBtn" onclick ="fn_mypage()">
			<img id ="btnIcon" src="${contextPath}/resources/image/mypage.png">마이페이지</button>
		</td>
		<script>
		function fn_mypage(){
			var frm = document.frm;
			frm.action="${contextPath}/mypage.do";
			frm.method="post";
			frm.submit();
			}</script>
		</c:if>
		</tr>
	</table>
</body>
</html>