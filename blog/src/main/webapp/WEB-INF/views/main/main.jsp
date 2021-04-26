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
		<div class="col-lg-10 col-md-10 mx-10" id="main-text" style="margin: 0 auto;">
		
		<div class="post-preview" id="oneform">
			<h1  class="post-title"> WELCOME BLOG PAGE!!!</h1>
			<h3 class="post-subtitle">당신 만을 위한 공간 <br>
				당신의 일기, 생각, 메모 등 <br>
				다양한 텍스트 들을 <br>
				 저장하고 공유할 수 있는 <br>
				이곳에 오신것을 환영합니다!
			</h3>
			<c:if test="${loginId == null}">
			<h6 class="post-meta">가입후 당신만의 글을 작성할수 있습니다.</h6>
			<a href="${contextPath}/joinForm.do"><img id ="btnIcon" src="${contextPath}/resources/image/signUp.png">회원가입바로가기</a>
			</c:if>
		 </div>
	<div class="card" >
				<div class="card-header bg-secondary text-white" style="text-align: center">
					 <img id="card-img" src="${contextPath}/resources/image/logo.png">
					 <font size="16px" > B L O G</font> 
				</div>
	<c:if test="${ empty _boardLately }">
		<h1 class="post-title">
		최근 작성된 게시물이 없습니다!.<br>
		가입 후 첫 게시글의 주인공이 되어주세요!</h1>
	</c:if>
	<c:if test="${not empty _boardLately}">
	<div class="post-preview" id="oneform" style="margin-bottom: 20px;">
			<h1 class="post-title">최근 게시글 목록</h1>
	</div>
	
	<c:forEach var ="board" items="${latelyList}">
		<table class="table" style="margin-bottom: 30px;">
		<c:set var="writeid" value="${board.id}"/>
		<tr>
		<td width="15%" class="table-head-td">조회수</td>
		<td width="20%" class="table-head-td">작성자</td>
		<td width="40%" class="table-head-td">제목</td>
		<td width="40%" class="table-head-td">작성일</td>
		</tr>
		<tr>
		<td class="table-content-td">${board.hit}</td>
			<td class="table-content-td">${board.id}</td>
			<td class="table-content-td"><a href="${contextPath}/viewForm.do?contentNO=${board.contentNO}">${board.title}</a></td>
			<td class="table-content-td">${board.writeDate}</td>
		<tr>
			<td colspan="6" class="table-head-td">
			내용
			</td>
		</tr>
		<tr>
		<td colspan="6"  class="table-content-td" id="tableContent">
			${board.content}
		</td>
		</tr>
			</table>
		</c:forEach>
	</c:if>
</div>
</div>
</div>
</div>
</body>
</html>