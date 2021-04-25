<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="_boardLately" value="${latelyList}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.latelytable tr td{
	text-align: center;
	font-size: 18px;
}

#oneform{
	padding:5px;
	margin-bottom: 5px;
	border-bottom: 1px solid #aaaaaa;
}
</style>
</head>
<body>
	<div class="container">
	  <div class="row">
		<div class="col-lg-12 col-md-12 mx-12" id="main-text">
		<div class="post-preview" id="oneform">
			<h1  class="post-title"> WELCOME BLOG PAGE!!!</h1>
			<h3 class="post-subtitle">당신 만을 위한 공간 <br>
				당신의 일기, 생각, 메모 등 <br>
				다양한 텍스트 들을 <br>
				 저장하고 공유할 수 있는 <br>
				이곳에 오신것을 환영합니다!
			</h3>
			<h6 class="post-meta">회원가입은 상단 버튼에있습니다!<br>
			 가입후 당신만의 글을 작성할수 있습니다.</h6>
		 </div>

	<c:if test="${ empty _boardLately }">
		<h1 class="post-title">
		최근 작성된 게시물이 없습니다!.<br>
		가입 후 첫 게시글의 주인공이 되어주세요!</h1>
	</c:if>
	<c:if test="${not empty _boardLately}">
	<div class="post-preview" id="oneform">
			<h1 class="post-title">최근 게시글 목록</h1>
	</div>	
	<c:forEach var="board" items="${latelyList}">
	<div class="post-preview" id="oneform">
		<a href="${contextPath}/viewForm.do?contentNO=${board.contentNO}">
			<h1 class="post-title">${board.title}</h1>
		</a>
		<br>
			<h5 class="post-subtitle">작성자 : ${board.id}<span style="word-spacing: 30px;"> / </span> 조회수 : ${board.hit}</h5>
		<br>
			<h2 class="post-meta">${board.content}</h2>

	</div>
	</c:forEach>

</c:if>	
</div>
</div>
</div>
</body>
</html>