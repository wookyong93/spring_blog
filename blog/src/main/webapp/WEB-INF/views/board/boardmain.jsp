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
	#pagingid{
		margin-top: 10px;
	}
</style>
<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div class="container">
	  <div class="row">
		<div class="col-lg-12 col-md-12 mx-12" id="main-text">
	<article>
	
	<table class="table" >
		<tr>
			<th colspan="6">최근 개시물</th>
		</tr>
	<c:if test="${empty boardMain}">
		<tr>
			<td>
			<h1>최근 작성된 게시물이 없습니다!.</h1>
			</td>
		</tr>
	</c:if>
	<c:if test="${not empty boardMain }">
		<c:forEach var ="board" items="${boardMain}">
		<c:set var="writeid" value="${board.id}"/>
		<tr>
		<td>제목</td>
		<th colspan="5">${board.title }</th>
		</tr>
		<tr>
		<td>작성자</td>
		<td>${board.id}</td>
		<td>작성일</td>
		<td>${board.writeDate}</td>
		<td>조회수</td>
		<td>${board.hit}</td>
		<tr>
		<td colspan="6">
		<div class="text-center">
			<textarea id="content" readonly="readonly" style="resize: none;">${board.content}</textarea>
		</div>
		</td>
		</tr>
		</c:forEach>
		<script>
			
			CKEDITOR.replace( 'content',{
				toolbar:[]
			});
			CKEDITOR.editorConfig = function(config){
				config.resize_enabled=false;
				config.fontSize_defaultLabel='16px';
			}
			
		</script>
	</c:if>
	</table>
	
	</article>

<article>
<div class="container">
	  <div class="row">
	<table class="table">
	<tr>
		<td class="">조회수</td>
		<td class="">작성자</td>
		<td class="">제목</td>
		<td class="">작성일</td>
		
		
	</tr>
		<c:forEach var="bList" items="${bList}" varStatus="loop">
		<c:set var="bId" value="${bList.id}"/>
		<tr>
			<td>${bList.hit}</td>
			<td>${bList.id}</td>
			<td><a href="${contextPath}/viewForm.do?contentNO=${bList.contentNO}">${bList.title}</a></td>
			<td>${bList.writeDate}</td>
			
			
		</tr>
		</c:forEach>
	</table>
	<br>
	<c:if test="${loginId eq bId}">
	<div class="col-lg-12 col-mg-12 col-mx-12" id="pagingid">
			<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item">
					<a class="page-link" href="<c:url value='/baordmain.do?loginId=${bId}&page=${pageMaker.startPage-1}'/>">prev </a>
				</li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li class="page-item">
					<a class="page-link" href="<c:url value='/boardmain.do?loginId=${bId}&page=${idx}'/>">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				<li class="page-item">
					<a class="page-link" href="<c:url value='/boardmain.do?loginId=${bId}&page=${pageMaker.endPage+1}'/>">next </a>
				</li>
			</c:if>
		</ul>
	</div>
	</c:if>
	<br>
	<c:if test="${loginId ne bId}">
	<div class="col-lg-12 col-mg-12 col-mx-12"  id="pagingid">
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item">
					<a class="page-link" href="<c:url value='/baordmain.do?loginId=${bId}&page=${pageMaker.startPage-1}'/>" aria-label="Previous">&laquo; </a>
				</li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li class="page-item">
					<a class="page-link" href="<c:url value='/boardmain.do?loginId=${bId}&page=${idx}'/>">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				<li class="page-item">
					<a class="page-link" href="<c:url value='/boardmain.do?loginId=${bId}&page=${pageMaker.endPage+1}'/>"aria-label="next" >&raquo; </a>
				</li>
			</c:if>
		</ul>
	</div>
	</c:if>
	</div>
</div>
</article>	
</div>
</div>
</div>
</body>
</html>