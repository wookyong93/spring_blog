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
	.footerlabel{
	font-family:squareRoundEB; 
	}
	#mailImage{
		width: 50px;
	}
	#footerButton{
		border: 0px;
		background-color: transparent;
		border-radius: 25px;
		
	}
	#footerButton:focus {
		outline: none;
	}
	#footerButton:hover {
		background-color: lightblue;
	}
	.list-inline-item{
		margin: 10px;
	}
</style>
<script>
	function fn_map(){
		window.open("${contextPath}/map.do","map","width=500, height=350");
	}
</script>
</head>
<body>
<div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <ul class="list-inline text-center">
            <li class="list-inline-item">
            <h6 class="footerlabel">관리자 GitHUB</h6>
            <button type="button" onclick="location.href='https://github.com/wookyong93/spring_blog'" id="footerButton">
				 <img id="mailImage"src="${contextPath}/resources/image/github.png">
            </button>
			</li>
			<li class="list-inline-item">
			<h6 class="footerlabel">관리자 email</h6>
				<a  title="관리자에게 메일보내기" id="footerButton" href='mailto:dnrud368@gamil.com'>
                  <img id="mailImage"src="${contextPath}/resources/image/email.png">
				</a>
			</li>
			<li class="list-inline-item">
			<h6 class="footerlabel">사무실 주소</h6>
				<button type="button" onclick="fn_map()" id="footerButton"><img id="mailImage" src="${contextPath}/resources/image/map.png"></button>
			</li>
	</ul>
          <p class="copyright text-muted">Copyright 2021 &nbsp; KWON WOO KYEONG All rights reserved</p>
        </div>
      </div>
    </div>
</body>
</html>