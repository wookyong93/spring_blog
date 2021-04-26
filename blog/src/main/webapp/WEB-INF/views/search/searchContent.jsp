<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="selector" value="${selector}"/>
    <c:set var="who" value="${who}"/>
    <c:set var="searchList" value="${searchList}"/>
    <c:choose>
    	<c:when test="${selector =='title'}">
    		<c:set var="selector_" value="제목"/>
    	</c:when>
    	<c:when test="${selector =='content'}">
    		<c:set var="selector_" value="내용"/>
    	</c:when>
    	<c:when test="${selector =='content'}">
    		<c:set var="selector_" value="아이디"/>
    	</c:when>
    </c:choose>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 검색 결과</title>
<style>
.table-head-td{
	font-size: 12px;
	font-weight: blod;
}
.table-content-td{
	font-size: 12px;
}
.table{
	border-bottom: 2px solid gray;
}
</style>
</head>
<body>

<div class="container" >
	<div class="row">
	<div class="col-lg-10 col-mg-10 col-mx-10" style="margin:0 auto;">
	<div class="card" >
				<div class="card-header bg-secondary text-white" style="text-align: center">
					 <img id="card-img" src="${contextPath}/resources/image/logo.png">
					 <font size="16px" > B L O G</font> 
				</div>
	<div style="margin-bottom: 20px;">
<font color="red">${selector_}</font> 검색 : <font style="text-decoration: underline;">${who}</font>에(의) 대한 검색 결과입니다.
	</div>
<c:if test="${empty searchList}">
<table class="table">
	<tr>
		<th><h1>검색결과가 없습니다.</h1></th>
	</tr>
</table>
</c:if>

<c:if test="${not empty searchList}">
<table class="table">
	<c:forEach var="board" items="${searchList}">
	<tr>
		<td width="20%" class="table-head-td">조회수</td>
		<td width="20%" class="table-head-td">작성자</td>
		<td width="40%" class="table-head-td">제목</td>
		<td width="40%" class="table-head-td">작성일</td>
	</tr>
	
		<tr>
			<td class="table-content-td">${board.hit}</td>
			<td class="table-content-td">${board.id}</td>
			<td class="table-content-td"><p style="margin: 0;display:block;text-overflow:ellipsis;overflow:hidden;white-space: nowrap;"><a href="${contextPath}/viewForm.do?contentNO=${board.contentNO}">${board.title}</a></p></td>
			<td class="table-content-td">${board.writeDate}</td>
			
		</tr>
	</c:forEach>
</table>

			<div class="col-lg-12 col-mg-12 col-mx-12" id="pagingid">
			<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item">
					<a class="page-link" href="<c:url value='/searchContent.do?selector=${selector}&who=${who}&page=${pageMaker.startPage-1}'/>">prev </a>
				</li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li class="page-item">
					<a class="page-link" href="<c:url value='searchContent.do?selector=${selector}&who=${who}&page=${idx}'/>">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				<li class="page-item">
					<a class="page-link" href="<c:url value='searchContent.do?selector=${selector}&who=${who}&page=${pageMaker.endPage+1}'/>">next </a>
				</li>
			</c:if>
		</ul>
	</div>
</c:if>
</div>
</div>
</div>
</div>
</body>
</html>