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
<form id="frm">
	<table width="80%">
		<c:forEach var="board" items="${boardView}">
			<c:set var="writeid" value="${board.id}"/>
				<tr>
					
					<td>제목</td><td colspan="3">
					<input type="text" name="title" id="title" value="${board.title }">
					<input type="hidden" name = "contentNO" value="${board.contentNO}"/>
					</td>
				</tr>
				<tr>
					<td>작성일</td><td><input type="text"  name="writeDate" value="${board.writeDate}" readonly="readonly"></td>
					<td>작성자</td><td><input type="text"  name="id" value="${board.id}" readonly="readonly"></td>
					<td>조회수</td><td>${board.hit}</td>
				</tr>
				<tr>
					<td colspan="4">내용</td>
				</tr>
				<tr>
					<td colspan="4">
					<textarea id="content" name="content">
						 ${board.content}
					</textarea>
					</td>
				</tr>
			</c:forEach>
		<tr>
			<td colspan ="4">
				<input type="button" value="수정하기" onclick="fn_mod()">
				<input type="button" value="취소" onclick="location.href='${contextPath}/boardmain.do?loginId=${loginId}'"/>
			</td>
		</tr>
	</table>
</form>
	<script type="text/javascript">
	
			CKEDITOR.replace( 'content',{
				width:'600',
				height:'300'
			});
			CKEDITOR.editorConfig = function(config){
				config.resize_enabled=false;
			}
			
	</script>
</body>
</html>