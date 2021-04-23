<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.navLi{
	margin:0 auto;
	padding :3px;
	list-style: none;
	float: left;
}
#searchBox{
	width:600px;
	padding: 5px;
	float:right;

}
</style>
<script>
	function fn_search(){
		var frm = document.getElementById('searchFrm');
		var who = document.getElementById('who');
		
		if(who.value == ""){
			alert('검색어를 입력해주세요');
			who.focus();
		} else{
		frm.method="get";
		frm.action="${contextPath}/searchContent.do";
		frm.submit();
		}
	}
</script>
</head>
<body>
		<ul >
			<li class="navLi">
			<button onclick="location.href='${contextPath}/latelyBoard.do'">최신 게시글</button>
			</li>
			<li class="navLi">
			<button onclick="location.href='${contextPath}/hitBoard.do'">최다 조회수 게시글</button>
			</li>
		</ul>

		<table id="searchBox">
		<tr>
			<td>
				<form id="searchFrm">
						<select name="selector">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="id">아이디</option>
						</select>
						<input type="search"name="who" id="who" placeholder="게시글 검색"><button class="btn btn-info" type="button" onclick="fn_search()">검색</button>
				</form> 
			</td>
		</tr>
	    </table>

	
</body>
</html>