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
			<div class="card" >
				<div class="card-header bg-secondary text-white" style="text-align: center">
					 <img id="card-img" src="${contextPath}/resources/image/logo.png">
					 <font size="16px" > B L O G</font> 
				</div>
	<article>
	
	<table class="table" >
		<tr>
			<th colspan="7">최근 게시물</th>
		</tr>
	<c:if test="${empty boardMain}">
		<tr>
			<td colspan="7">
			<h1>최근 작성된 게시물이 없습니다!.</h1>
			</td>
		</tr>
	</c:if>
	<c:if test="${not empty boardMain }">
		<c:forEach var ="board" items="${boardMain}">
		<c:set var="writeid" value="${board.id}"/>
		<tr>
		<td class="table-head-td">제목</td>
		<th class="table-content-td" colspan="6">${board.title }</th>
		</tr>
		<tr>
		<td class="table-head-td" style="padding-left: 2px; padding-right: 0px;">조회수</td>
		<td class="table-content-td" style="padding-left: 2px; padding-right: 0px;">${board.hit}</td>
		<td class="table-head-td" style="padding-left: 2px; padding-right: 0px;">작성자</td>
		<td class="table-content-td" style="padding-left: 2px; padding-right: 0px;">${board.id}</td>
		<td class="table-head-td" style="padding-left: 2px; padding-right: 0px;">작성일</td>
		<td colspan="2"  class="table-content-td" style="padding-left: 2px; padding-right: 0px;">${board.writeDate}</td>
		
		<tr>
		<td colspan="7">
		<div class="text-center">
			<textarea id="content" readonly="readonly" style="resize: none;">${board.content}</textarea>
		</div>
		</td>
		</tr> 
		</c:forEach>
		
	</c:if>
	</table>
	<script>
	CKEDITOR.replace( 'content',{
		toolbar:[]
	});
	CKEDITOR.editorConfig = function(config){
		config.resize_enabled=false;
		config.fontSize_defaultLabel='16px';
	}; 
	</script>
	</article>

<article>
<div class="container">
	  <div class="row">
	<table class="table">
	<tr>
		<td width="15%" class="table-head-td">조회수</td>
		<td width="20%" class="table-head-td">작성자</td>
		<td width="40%" class="table-head-td">제목</td>
		<td width="40%" class="table-head-td">작성일</td>
	</tr>
	<c:forEach var="bList" items="${bList}" varStatus="loop">
		<c:set var="bId" value="${bList.id}"/>
		<tr>
			<td class="table-content-td">${bList.hit}</td>
			<td class="table-content-td">${bList.id}</td>
			<td class="table-content-td"><p style="margin: 0;display:block;text-overflow:ellipsis;overflow:hidden;white-space: nowrap;"><a href="${contextPath}/viewForm.do?contentNO=${bList.contentNO}">${bList.title}</a></p></td>
			<td class="table-content-td">${bList.writeDate}</td>	
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
<c:if test="${(loginId != wrtieid) || (loginId==null) }">
<div class="form-group" style="margin-top: 50px;float: right;">	
	<c:if test="${loginId !=null && writeid==null }">
			<button type="button" onclick='location.href="${contextPath}/writeForm.do"' class="form-btn-join" style="width:150px;border-color: lightgreen">
			<img src="${contextPath}/resources/image/text-add.png" id="btn-Icon">
			<span class="btn-span" style="color:lightgreen">새 글쓰기</span>
		</button>
		</c:if>
<button type="button" style="width:150px;" class="form-btn-cancel" onclick="location.href='${contextPath}/main.do'">
			<img src="${contextPath}/resources/image/cancel.png" id="btn-Icon">
			<span class="btn-span">메인페이지이동</span>
		</button>
		
		</div>
</c:if>
<c:if test="${(loginId == writeid)}">
<div class="form-group" style="margin-top: 50px;float: right;">	
		<button type="button" onclick='location.href="${contextPath}/writeForm.do"' class="form-btn-join" style="width:150px;border-color: lightgreen">
			<img src="${contextPath}/resources/image/text-add.png" id="btn-Icon">
			<span class="btn-span" style="color:lightgreen">새 글쓰기</span>
		</button>
		</div>
</c:if>
</div>
</div>
</div>
</body>
</html>