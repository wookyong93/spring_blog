<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="selector" value="${selector}"/>
    <c:set var="who" value="${who}"/>
    <c:set var="searchList" value="${searchList}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 검색 결과</title>
</head>
<body>
<table>
	<tr>
		<th>검색유형 : <font color="red">${selector}</font> <font style="text-decoration: underline;">${who}</font>에(의) 대한 검색 결과입니다.</th>
	</tr>
</table>
<table>
<c:if test="${empty searchList}">
	<tr>
		<td>검색결과가 없습니다.</td>
	<tr>
</c:if>
<c:if test="${not empty searchList}">
	<c:forEach var="board" items="${searchList}">
		<c:if test="${selector == 'id' }">
		<tr>
			<td>${board.id}</td>
		</tr>
		</c:if>
		<c:if test="${selector == 'content' }">
		<tr>
			<td>${board.content}</td>
		</tr>
		</c:if>
		<c:if test="${selector == 'title' }">
		<tr>
			<td>${board.title}</td>
		</tr>
		</c:if>
	</c:forEach>
</c:if>
</table>
</body>
</html>