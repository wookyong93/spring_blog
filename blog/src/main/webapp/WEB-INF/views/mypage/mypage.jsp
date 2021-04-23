<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script>
window.onload=function(){
		var id = "${loginId}";
		if(id != ""){
			alert('잘못된 접근입니다.');
			location.href="${contextPath}/main.do";
		}
	}
	function fn_pwdmod(){
		var check = confirm('회원정보를 변경하시겠습니까 ?');
		if(check == true){
			location.href="${contextPath}/pwdcheck.do";
		}
	}
</script>
</head>
<body>
	<table>
		<tr>
			<th colspan ="2">${loginId}님 회원정보 </th>
		</tr>
		<c:forEach var ="member" items="${memberInfo}">
		<tr>
			<td>ID</td>
			<td>
				${member.id}
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				${member.name}
			</td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td>
				${member.email}
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				${member.address}
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="2"><input type="button" value="회원정보 변경" onclick="fn_pwdmod()"/> | <input type="button" value="뒤로가기" onclick="location.href='${contextPath}/main.do'" /></td>
		</tr>
	</table>
</body>
</html>