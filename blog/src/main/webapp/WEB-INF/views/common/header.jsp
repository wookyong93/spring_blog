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
	a{
		text-decoration: none;
	}
	a:hover{
		text-decoration: none;
	}
</style>
<script>
	function fn_logout(){
		var logout = confirm('정말 로그아웃하시겠습니까 ?')
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
		<td width="15%"><h3>blog</h3></td>
		<td width="65%"><h1>블로그페이지</h1></td>
		<c:if test="${loginId == null}">
		<td width="25%"><input type="button" value="로그인" onclick="location.href='${contextPath}/login.do'">
		 | 
		<input type="button" value="회원가입" onclick="location.href='${contextPath}/joinForm.do'"/></td>
		</c:if>
		<c:if test="${loginId != null}">
		<td width="25%"><input type="button" value="로그아웃" onclick="fn_logout()"/> | <a href="#">마이페이지</a></td>
		</c:if>
		</tr>
	</table>
</body>
</html>