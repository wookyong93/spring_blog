<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	
	table#side{
		margin:0 auto;
	}
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
	<c:if test="${loginId != ''}">
	<table align="center" width="80%" id="side">
		<tr>
			<th> 나의 정보 </th>
		</tr>
		<tr>
			<td>${loginId}</td>
	</table>
	</c:if>
	<div>
	<P>
		<button onclick="fn_baordmain()">게시글 보러가기</button>
	</P>
	<P>	
		<button onclick="fn_insertContent()">새 글쓰기</button>
	</P>
	</div>
</body>
</html>