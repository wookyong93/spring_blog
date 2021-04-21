<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function fn_search(){
		var frm = document.getElementById('searchFrm');
		frm.method="get";
		frm.action="${contextPath}/searchContent.do";
		frm.submit();
	}
</script>
</head>
<body>
	<form id="searchFrm">
		<label>검색</label>
		<select name="selector">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="id">아이디</option>
		</select><input type="text"name="who"><button onclick="fn_search()">검색</button>
		<button>최신글 보러가기</button> | <button>작성글 보러가기</button>
	</form> 
	
</body>
</html>