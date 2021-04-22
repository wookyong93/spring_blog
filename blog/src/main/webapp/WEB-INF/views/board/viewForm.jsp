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
	#fistBtn{
		display: none; 
	}
	#secondBtn{
		display: none;
	}
	
</style>
<script>
function fn_contentval(){
	var content = document.getElementById('content');
	var bcon = document.getElementById('bcon');
	
	bcon.value= content.value;
	}

function modContent(){
	var frm = document.getElementById('frm');
	var title = document.getElementById('title');
	var content = document.getElementById('content');
	
	
	if(title.value==""){
		alert('재목을 입력해주세요');
	}else if(content.value==""){
		alert('내용을 입력해주세요');
	}else{
		frm.action="${contextPath}/modContent.do";
		frm.method="post";
		frm.submit();
	}
	

}
</script>
</head>
<body>
	<form id="frm">
		<table>
			<c:forEach var="board" items="${boardView}">
			<c:set var="orignTitle" value="${board.title}"/>
			<c:set var="orignContent" value="${board.content}"/>
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
						<textarea rows="25" cols="50" name="content" id="content" style="resize:none;" disabled > ${board.content} </textarea>
					</td>
				</tr>
			</c:forEach>
			<tr id="mainBtn">
				<td colspan ="4"><input type="button" value="${writeid}님 블로그 이동" onclick="location.href='${contextPath}/boardmain.do?loginId=${writeid}'"/></td>
				<td colspan="4"><input type="button" value="홈페이지 메인" onclick="location.href='${contextPath}/main.do'"/></td>
			</tr>
			<tr id="firstBtn">
				<td colspan ="4"><input type="button" value="수정" onclick="btnChange()"/><input type="button" value="삭제" onclick="fn_del()"/><input type="button" value="내 페이지 이동"  onclick="location.href='${contextPath}/boardmain.do?loginId=${writeid}'"/></td>
			</tr>
			<tr id="secondBtn">
				<td colspan ="4"><input type="button" value="수정반영" onclick="modContent()"/><input type="reset" value="작성내용 전체 지우기"/><input type="button" value="취소" onclick="fn_page()"/></td>
			</tr>
		</table>
	</form>
	<script>
	
	var frm = document.getElementById('frm');
	var title = document.getElementById('title');
	var content = document.getElementById('content');
	var mainBtn = document.getElementById('mainBtn');
	var firstBtn = document.getElementById("firstBtn");
	var secondBtn = document.getElementById("secondBtn");
	
	window.onload = function(){
		if('${loginId}' != '${writeid}'){
			mainBtn.style.display="block";
			firstBtn.style.display="none";
		}else{
			firstBtn.style.display="block";
			mainBtn.style.display="none";
		}
	}
	function btnChange(){
		var con = confirm('수정하시겠습니까?');
		if(con==true){
			
			firstBtn.style.display="none";
			secondBtn.style.display="block";
			title.disabled = false;
			content.disabled = false; 
			
		}
	}
	function fn_page(){
		
		firstBtn.style.display="block";
		secondBtn.style.display="none";
		title.value="${orignTitle}";
		content.value="${orignContent}";
		title.disabled = true;
		content.disabled = true;
		
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