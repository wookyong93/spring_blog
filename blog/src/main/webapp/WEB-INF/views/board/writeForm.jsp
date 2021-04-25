<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.form-group{
		font-family:squareRoundEB;
	}
	.btn{
		border-radius: 7px;
	}
</style>
<title>글쓰기 창</title>
<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
window.onload=function(){
		var id = "${loginId}";
		if(id == ""){
			alert('잘못된 접근입니다.');
			location.href="${contextPath}/main.do";
		}
	}
	function fn_insert(){
		var frm = document.getElementById('frm');
		var title = document.getElementById('title');
		var content = document.getElementById('content');
		
		if(title.value==""){
			alert('제목을 입력해주세요');
			title.focus();
		}else if(content.value == ""){
			alert('내용을 입력해주세요');
			content.focus();
		}else{
			frm.method="post";
			frm.action="${contextPath}/insertContent.do";
			frm.submit();
		}
	}
</script>
</head>
<body>

<div class="container">
	<form id="frm" class="container">
	<div class="form-group">
	<div class="text-center">
		<h1 class="form-group">글 쓰 기</h1>
		<label>제 목</label>
		<input class="form-control" type="text" name="title" id="title"/><br>
		<label>내 용</label>
		<textarea class="form-control" style="resize:none" rows="30" cols="50" id="content" name="content">
		</textarea>
		</div>
		<br>
		<div class="col text-center">
			<input class="btn btn-outline-success" type="button" value="글 저장하기" onclick="fn_insert()">
			<input class="btn" type="reset" value="초기화"/>
			<input class="btn" type="button" value="목록 돌아기기" onclick="location.href='${contextPath}/boardmain.do?loginId=${loginId}'"/>
		</div>
	</div>
	</form>
	</div>

	<script type="text/javascript">
	
			CKEDITOR.replace( 'content',{

			});
			
	</script>
</body>
</html>