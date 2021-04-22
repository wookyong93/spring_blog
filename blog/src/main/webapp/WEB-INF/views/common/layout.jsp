<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"/></title>
<style>
body{
	padding: 0px;
	margin: 0px;
}
 #container{
 	width: 100%;
	height: 100%;
	position: relative;
 }
 body::before{
 	background:url("/blog/resources/image/backgroundimg.jpg");
 	background-size:cover;
 	width:100%;
 	height:100%;
 	content:"";
 	position: absolute;
    top: 0;
	left: 0;
	z-index: -1;
	opacity: 0.8;
 }
 #header{
 	padding-top:20px;
 	padding-left:5px;
 	padding-right:5px;
 	padding-bottom:30px;
 	
 }
 #navi{
 	padding: 5px; 
 	width: 99%;
 	height: 50px;
 	background-color:white;
 	margin: 2px; 
 }
 #sidebar-left{
 	clear:both;
 	width:20%;
 	height:600px;
 	padding:5px; 
 	float:left;
 	background-color: white;
 	margin: 2px;
 }
 #contentbody{
 	width: 70%;
 	height:80%;
 	padding:5px;
 	float:left;
 	background-color: white;
 	margin: 2px;
 }
 #footer{
 	clear:both;
 	padding:5px;
 	margin: 2px;
 }
 
</style>
</head>
<body>
<div id="container">
	<header id="header">
		<tiles:insertAttribute name="header"/>
	</header>
	<nav id="navi">
		<tiles:insertAttribute name="navi"/>
	</nav>
	<aside id="sidebar-left">
		<tiles:insertAttribute name="side"/>
	</aside>
	<section id="contentbody">
		<tiles:insertAttribute name="body" ignore="true"/>
	</section>
	<footer id="footer">
		<tiles:insertAttribute name="footer"/>
	</footer>
</div>

</body>
</html>