<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="hitBoard" value="${hitList}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.latelytable tr td{
	text-align: center;
	font-size: 18px;
	background-color: white;
}
</style>
</head>
<body>
<c:if test="${ empty hitBoard }">
		<h1>최근 작성된 게시물이 없습니다!.<br>
			 가입 후 첫 게시글의 주인공이 되어주세요!</h1>

</c:if>
<c:if test="${ not empty hitBoard }">
<ul>
	<c:forEach var="board" items="${hitList}">
	<li style="float:left;margin:10px;list-style:none;">
		<table border="1" width="300px" class="latelytable">
				<tr>
					<td colspan="4">제목</td>
				</tr>
				<tr>
					<td colspan="4"><a href="${contextPath}/viewForm.do?contentNO=${board.contentNO}">${board.title }</a></td>
				</tr>
				<tr>
					<td>작성자</td><td>작성일</td><td>조회수</td>
				</tr>
				<tr>
					<td>${board.id }</td>
					<td>${board.writeDate}</td>
					<td>${board.hit }</td>
				</tr>
				<tr>
					<td colspan="4">${board.content}</td>
				</tr>
		</table>
	</li>
	</c:forEach>
</ul>	
</c:if>
</body>
</html>