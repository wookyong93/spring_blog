<%@page import="com.spring.blog.board.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <c:set var="loginId" value="${loginId}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	
</style>
<script type="text/javascript">
	function fn_baordmain(){
		var loginId = "${loginId}";
		if(loginId==""){
			alert('로그인 후 이용해주세요');
		}else{
			location.href="${contextPath}/boardmain.do?loginId=${loginId}";
		}
	}
	function fn_insertContent(){
		var loginId = "${loginId}";
		if(loginId==""){
			alert('로그인 후 이용해주세요'); 
		}else{
			location.href="${contextPath}/writeForm.do";
		}
	}
</script>
</head>
<body>
	<c:if test="${loginId eq null}">
	 <ul style="list-style: none">
	 	<li>
	 		더 많은 기능을 사용하고 싶으신가요 ?
	 	</li>
	 	<li>
	 		회원가입시 나만의 페이지 , <br>
	 		나만의 글을 작성할수 있습니다!
	 	</li>
	 	<li>
	 		회원가입 상단 우측 버튼을 클릭하세요!!
	 	</li>
	 </ul>
	</c:if>
	<c:if test="${loginId ne null}">
	<table align="center" width="80%" id="side">
		<tr>
			<th> MY INFO </th> 
		</tr>
		<tr>
			<td> 아 이 디 </td>
		</tr>
		<tr>
			<td>${loginId}</td>
		<tr>
		<tr>
		<td>
		<button onclick="fn_baordmain()">내 게시글 보러가기</button>
		</td>
		</tr>
		<tr>
		<td>
		<button onclick="fn_insertContent()">새 글쓰기</button>
		</td>
		</tr>
	</table>
	</c:if>
	
</body>
</html>