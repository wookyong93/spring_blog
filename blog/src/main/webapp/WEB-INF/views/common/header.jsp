<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	.header_text{
		padding: 100px 0px 100px;
		text-align: center;
		color: white;
		
	}
	.header_text h1{
		font-family:squareRoundEB,monospace;
		font-weight:bold;
		font-size:50px;
		margin-top:0
	}
</style>
<script>
	//로그아웃 컴펌 받고 트루일경우 /logout.do 로 이동
	function fn_logout(){
		var logout = confirm('정말 로그아웃하시겠습니까 ?');
		if(logout==true){
			location.href="${contextPath}/logout.do";
		}else{
			location.href="${contextPath}/main.do";
		}
	}
	
</script>
</head>
<body>

<div class="container">
<div class="overlay"></div>
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="header_text">

		<h1>B L O G</h1>

		</div>
        </div>
      </div>
    </div>
	<script>
		function fn_mypage(){
			var frm = document.frm;
			frm.action="${contextPath}/mypage.do";
			frm.method="post";
			frm.submit();
	}</script>
</body>
</html>