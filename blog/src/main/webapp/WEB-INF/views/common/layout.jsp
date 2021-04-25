<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title><tiles:insertAttribute name="title"/></title>
<!-- 부트스트랩 코어 css -->
<link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!-- fonts -->
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
  <link href="${contextPath}/resources/css/clean-blog.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
	body{
		font-family:squareRoundEB;
	}
	.post-title , .post-subtitle, .post-meta{
		font-family:squareRoundEB;
	}
	header.masthead{
		margin-bottom:0;
	}
	@font-face {
	font-family: squareRoundEB;
	src:url("/blog/resources/fonts/NanumSquareRoundEB.ttf");
	/*제일 두꺼운 폰트체*/
	}
	@font-face {
	font-family: squareRoundB;
	src:url("/blog/resources/fonts/NanumSquareRoundB.ttf");
	/* 두꺼운 폰트체*/
	}
	@font-face {
	font-family: squareRoundR;
	src:url("/blog/resources/fonts/NanumSquareRoundR.ttf");
	/*제일 두꺼운 폰트체*/
	}
	#mainNav{
		padding-top :50px;
		padding-left: 5px;
		padding-right: 5px;
		
	}
	#main-text{
	text-align: center;
}
#contentbody{
	padding: 30px;
}

@media only screen and (min-width: 992px){
#mainNav.is-visible {
 transform: translate3d(0,0,0);
}
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
		<tiles:insertAttribute name="mainNav"/>
	</nav>
	<header class="masthead">
		<tiles:insertAttribute name="header"/>
	</header>
	<nav id="nav" style="background-color: #868e96;">
		<tiles:insertAttribute name="nav"/>
	</nav>
			<section id="contentbody">
				<tiles:insertAttribute name="body" ignore="true"/>
			</section>
	<footer id="footer">
		<tiles:insertAttribute name="footer"/>
	</footer>
	
  <!-- Bootstrap core JavaScript -->
  <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${contextPath}/resources/js/clean-blog.min.js"></script>
</body>
</html>