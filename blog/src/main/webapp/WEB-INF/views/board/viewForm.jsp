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
</style>
<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<div class="container">
	  <div class="row">
		<div class="col-lg-12 col-md-12 mx-12" style="margin:0 auto;">
		<div class="card" >
				<div class="card-header bg-secondary text-white" style="text-align: center">
					 <img id="card-img" src="${contextPath}/resources/image/logo.png">
					 <font size="16px" > B L O G</font> 
				</div>
	<form id="frm" class="form-group">
	<c:forEach var ="board" items="${boardView}">
	<div class="text-center">
	<table class="table" style="margin-bottom: 40px;" >
		<c:set var="writeid" value="${board.id}"/>
		<tr>
		<td>제목<input type="hidden" name = "contentNO" value="${board.contentNO}"/></td>
		<th colspan="6">${board.title }</th>
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
			<textarea id="content" readonly="readonly" style="resize: none;" readonly="readonly">${board.content}</textarea>
		</div>
		</td>
		</tr>
	</table>
	<c:if test="${loginId != writeid}">
	<div class="form-group">	
		<button type="button"onclick="location.href='${contextPath}/boardmain.do?loginId=${writeid}'" class="form-btn-join" style="border-color: lightgreen; width: 200px;">
			<img src="${contextPath}/resources/image/blog-page.png" id="btn-Icon">
			<span class="btn-span" style="color:lightgreen">${writeid}님 블로그 이동</span>
		</button>
		<button type="button" class="form-btn-cancel" onclick="location.href='${contextPath}/main.do';" style="width: 200px;">
			<img src="${contextPath}/resources/image/cancel.png" id="btn-Icon">
			<span class="btn-span">홈페이지 메인</span>
		</button>
		</div>
	</c:if>	
	<c:if test="${loginId == writeid}">
	<div class="form-group">	
		<button type="button" onclick="btnChange()" class="form-btn-join" style="border-color: orange; width: 150px;">
			<img src="${contextPath}/resources/image/text-edit.png" id="btn-Icon">
			<span class="btn-span" style="color:orange">수정하기</span>
		</button>
		<button type="button" class="form-btn-cancel" onclick="fn_del()" style="width: 150px;">
			<img src="${contextPath}/resources/image/text-delete.png" id="btn-Icon">
			<span class="btn-span">삭제하기</span>
		</button>
		<button type="button" class="form-btn-login" onclick="location.href='${contextPath}/boardmain.do?loginId=${writeid}'" style="width: 200px;">
			<img src="${contextPath}/resources/image/cancel.png" id="btn-Icon">
			<span class="btn-span">내 페이지 메인 이동</span>
		</button>
		</div>
	</c:if>	
	</div>
	</c:forEach>
	</form>
	</div>
</div>
</div>
</div>
	<script>
	
	CKEDITOR.replace( 'content',{
		toolbar:[]
	});
	CKEDITOR.editorConfig = function(config){
		config.resize_enabled=false;
		config.fontSize_defaultLabel='16px';
	}; 
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