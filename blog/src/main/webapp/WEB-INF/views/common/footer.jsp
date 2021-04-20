<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>
	function fn_map(){
		window.open("${contextPath}/map.do","map","width=500, height=350");
	}
</script>
</head>
<body>
	<table width="100%">
		<tr align="center">
			<td>
				회사명 : xxxx
				연락처 : xxxx
				오시는길 : <input type="button" value="지도 보기" onclick="fn_map()">
			</td>
		</tr>
	</table>
</body>
</html>