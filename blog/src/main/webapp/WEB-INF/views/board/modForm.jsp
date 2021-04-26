<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
</style>
<title>글쓰기 창</title>
<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function fn_mod(){
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
			frm.action="${contextPath}/modContent.do";
			frm.submit();
		}
	}
</script>
</head>
<body>
	<div class="container ">
		<div class="col-lg-10 col-md-10 col-mx-10"style="margin:0 auto;">
			<div class="card" >
				<div class="card-header bg-secondary text-white" style="text-align: center">
					 <img id="card-img" src="${contextPath}/resources/image/logo.png">
					 <font size="16px" > B L O G</font> 
				</div>
				<div style="text-align: center;margin: 15px;">
					<h3>글 수정하기</h3>
					<c:forEach var="board" items="${boardView}">
					<c:set var="writeid" value="${board.id}"/>
				<form id="frm" class="form-group" > 
					<div class="form-group">
						<span class="form-span">제목</span>
						<input type="hidden" name = "contentNO" value="${board.contentNO}"/>
					</div>
					<div class="form-group">
					<input class="form-control" type="text" name="title" id="title" value="${board.title }"/>
					</div>
					
					<div class="form-group"style="margin-bottom: 60px;">
					<span class="form-span">내용</span>
					</div>
					<div class="form-group">
						<textarea class="form-control" style="resize:none" rows="30" cols="50" id="content" name="content">
						${board.content}
						</textarea>
					</div>
					<div class="form-group" style="margin-top: 50px;">	
						<button type="button" onclick="fn_mod()" class="form-btn-join" style="width:150px;border-color: lightgreen">
							<img src="${contextPath}/resources/image/text-edit.png" id="btn-Icon">
							<span class="btn-span" style="color:lightgreen">수정하기</span>
						</button>
						<button type="button" style="width:150px;" class="form-btn-cancel" onclick="location.href='${contextPath}/boardmain.do?loginId=${loginId}'">
							<img src="${contextPath}/resources/image/cancel.png" id="btn-Icon">
							<span class="btn-span">취소</span>
						</button>
					</div>						
				</form>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
			CKEDITOR.replace( 'content',{

			});
			
	</script>
</body>
</html>