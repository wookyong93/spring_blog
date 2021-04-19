<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="boardMain" value="${boardMain}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 보드 메인</title>
</head>
<body>
	<c:if test="${empty boardMain}">
		<h1>아직 작성된 글이 없습니다.</h1>
	</c:if>
	<c:if test="${not empty boardMain }">
	<c:forEach var ="board" items="${boardMain}">
		${board.id}<br>
		${board.title }<br>
		${board.content }<br>
		${board.writeDate }<br>
		${board.contentNO }<br>
	</c:forEach>
	</c:if>
</body>
</html>