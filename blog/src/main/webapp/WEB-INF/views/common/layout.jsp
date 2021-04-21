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
 #container::before{
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
 	margin-bottom: 20px;
 	border-bottom: 3px solid #4d4d4d;
 	
 }
 #sidebar-left{
 	width:20%;
 	height:620px;
 	padding:5px; 
 	float:left;
 }
 #contentbody{
 	width: 70%;
 	height:80%;
 	padding:5px;
 	float:left;
 }
 #footer{
 	clear:both;
 	padding:5px;
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