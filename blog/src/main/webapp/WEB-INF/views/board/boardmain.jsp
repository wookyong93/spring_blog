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
	<c:if test="${not empty boardName}">
	</c:if>
	<table>
		<c:forEach var="bList" items="${bList}" varStatus="loop">
		<tr>
			<td>${bList.contentNO}</td><td>${bList.title}</td><td>${bList.writeDate}</td><td>${bList.id}</td>
		</tr>
		</c:forEach>
	</table>
	<table>
		<tr>
			<c:if test="${pageMaker.prev}">
				<td>
					<a href="<c:url value='/baordmain.do?loginId=${loginId}&page=${pageMaker.startPage-1}'/>">prev </a>
				<td>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<td>
					<a href="<c:url value='/boardmain.do?loginId=${loginId}&page=${idx}'/>">${idx}</a>
				</td>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				<td>
					<a href="<c:url value='/boardmain.do?loginId=${logiId}&page=${pageMaker.endPage+1}'/>">next </a>
				</td>
			</c:if>
	</table>
	
	<table align="center">
		<tr>
			<th colspan="2">최근 개시물</th>
		</tr>
	<c:if test="${empty boardMain}">
	<tr>
		<td>
		<h1>아직 작성된 글이 없습니다.</h1>
		</td>
	</tr>
	</c:if>
	<c:if test="${not empty boardMain }">
	<c:forEach var ="board" items="${boardMain}">
	<tr>
	<td>${board.contentNO }</td>
	<td>${board.title }</td>
	</tr>
	<tr>
	<td>${board.id}</td><td>${board.writeDate}</td>
	<tr>
	<td colspan="2">
		${board.content }
	</td>
	</tr>
	</c:forEach>
	</c:if>
	</table>
</body>
</html>