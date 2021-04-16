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
</head>
<body>
	<table width="100%">
		<tr align="center">
		<td width="15%"><h3>blog</h3></td>
		<td width="65%"><h1>블로그페이지</h1></td>
		<c:if test="${loginId == null}">
		<td width="25%"><a href="${contextPath}/login.do">로그인</a>|<a href="#">회원가입</a></td>
		</c:if>
		<c:if test="${loginId != null}">
		<td width="25%"><a href="#">로그아웃</a> | <a href="#">마이페이지</a></td>
		</c:if>
		</tr>
	</table>
</body>
</html>