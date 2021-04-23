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
<form id="frm">
	<table width="80%">
		<tr>
			<th>새글 작성하기</th>
		</tr>
		<tr>
			<th>제목</th>
		</tr>
		<tr>
			<td><input type="text" name="title" id="title"/></td>
		</tr>
		<tr>
			<th>글 내용</th>
		<tr>
		<tr align="center">
			<td>
				<textarea style="resize:none" rows="30" cols="50" id="content" name="content">
				</textarea>
				
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="글 저장하기" onclick="fn_insert()">
				<input type="reset" value="초기화"/>
				<input type="button" value="목록 돌아기기" onclick="location.href='${contextPath}/boardmain.do?loginId=${loginId}'"/>
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