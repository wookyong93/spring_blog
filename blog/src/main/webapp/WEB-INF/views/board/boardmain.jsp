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
<style>
	textarea{
		font-size:20px;
		text-align:left;
	}
	table#bList{
		margin:0 auto; 
	}
</style>
</head>
<body>

	<article>
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
		<th>${board.title }</th>
		</tr>
		<tr>
		<td>${board.id}</td><td>${board.writeDate}</td>
		<tr>
		<td colspan="2">
			<textarea rows="15" cols="50" style="resize:none;" readonly="readonly">${board.content}
			</textarea>
			
		</td>
		</tr>
		</c:forEach>
	</c:if>
	</table>
	</article>

<section>	
	<table id="bList">
		<c:forEach var="bList" items="${bList}" varStatus="loop">
		<tr>
			<td><a href="${contextPath}/viewForm.do?contentNO=${bList.contentNO}">${bList.title}</a></td><td>${bList.writeDate}</td><td>${bList.id}</td>
		</tr>
		</c:forEach>
	</table>
	<table id="bList">
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
</section>	
</body>
</html>