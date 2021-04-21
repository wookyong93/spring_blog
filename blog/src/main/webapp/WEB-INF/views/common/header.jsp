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
		color:black;
	}
	a#logo:hover{
		text-decoration: none;
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
		<tr align="center">
		<td width="15%"><a id="logo" href="${contextPath}/main.do"><h3>blog</h3></a></td>
		<td width="65%"><h1>블로그페이지</h1></td>
		<c:if test="${loginId == null}">
		<td width="25%"><input type="button" value="로그인" onclick="location.href='${contextPath}/login.do'">
		 | 
		<input type="button" value="회원가입" onclick="location.href='${contextPath}/joinForm.do'"/></td>
		</c:if>
		<c:if test="${loginId != null}">
			<td><form name="frm">
				<input type="hidden" value="${loginId}" name="loginId"/>
			</form>
		<td width="25%"><input type="button" value="로그아웃" onclick="fn_logout()"/> | <input type="button" value="마이페이지" onclick ="fn_mypage()"/></td>
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