<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="contentNO" value="${param.contentNO}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 보기창</title>
<style>
	#secondBtn{
		display: none;
	}
	
</style>
<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<form id="frm">
		<table>
			<c:forEach var="board" items="${boardView}">
			<c:set var="writeid" value="${board.id}"/>
				<tr>
					
					<td>제목</td><td colspan="3">
					<input type="text" name="title" id="title" value="${board.title }" disabled="disabled">
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
					<textarea id="content" name="content" disabled="disabled" style="resize: none;">
						 ${board.content}
					</textarea>
					</td>
				</tr>
			</c:forEach>
			<c:if test="${loginId != writeid}">
			<tr id="mainBtn">
				<td colspan ="4"><input type="button" value="${writeid}님 블로그 이동" onclick="location.href='${contextPath}/boardmain.do?loginId=${writeid}'"/></td>
				<td colspan="4"><input type="button" value="홈페이지 메인" onclick="location.href='${contextPath}/main.do'"/></td>
			</tr>
			</c:if>
			<c:if test="${loginId == writeid}">
			<tr id="firstBtn">
				<td colspan ="4"><input type="button" value="수정" onclick="btnChange()"/><input type="button" value="삭제" onclick="fn_del()"/><input type="button" value="내 페이지 이동"  onclick="location.href='${contextPath}/boardmain.do?loginId=${writeid}'"/></td>
			</tr>
			</c:if>
		</table>
	</form>
	<script>
	CKEDITOR.replace( 'content',{
		toolbar:[]
	});
	CKEDITOR.editorConfig = function(config){
		config.resize_enabled=false;
		config.fontSize_defaultLabel='16px';
	}
	
	var frm = document.getElementById('frm');
	var title = document.getElementById('title');
	var content = document.getElementById('content');
	var mainBtn = document.getElementById('mainBtn');
	var firstBtn = document.getElementById("firstBtn");
	var secondBtn = document.getElementById("secondBtn");
	function btnChange(){
		var con = confirm('수정하시겠습니까?');
		if(con==true){
			location.href="${contextPath}/modForm.do?contentNO=${contentNO}";
		}
	}
	function fn_del(){
		var con = confirm('글을 삭제하시겠습니까?');
		if(con == true){
			location.href="${contextPath}/delContent.do?contentNO=${contentNO}";
		} 
	}
	
</script>
</body>
</html>