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
	#selectBox{
		width: 20%;
		height:40px;
		border-radius: 5px;
		font-size: 20px;
		padding:5px;
		margin: 0;
	}
	#selectBox:focus{
		outline: none;
	}
	#who{
		width: 50%;
		border-radius: 5px 0 0 5px;;
		border:1px solid white;
		font-size: 20px;
		padding:5px;
		margin: 0;
	}
	#who:focus{
		outline: none;
	}
	#searchBtn{
		width:20%;
		margin: 0;
		font-size: 20px;
		padding: 5px;
		border: 0px;
		border-radius: 0 3px 3px 0;
		background-color: #00CCFF;
		border: 1px solid white;
		color:white;
		font-weight: bold;
	}
	.form-group{
		font-family: squareRoundR;
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

<nav class="navbar navbar-expand-lg navbar-light" style="text-align:center;padding-top: 30px">
	<div class="container" >
		<form id="searchFrm" class="col-lg-12 col-md-12 mx-12">
			<div class="form-group" >
			<select name="selector" id="selectBox">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="id">아이디</option>
			</select>
			<input type="search" name="who" id="who" placeholder="게시글 검색"><button type="button" onclick="fn_search()" id="searchBtn"><img src="${contextPath}/resources/image/search.png" id="btnIcon"> 검색</button>
			</div>
		</form> 
	</div>
</nav>
	
</body>
</html>