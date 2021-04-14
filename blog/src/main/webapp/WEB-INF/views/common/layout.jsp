<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"/></title>
<style>
 #container{
 	width: 100%;
 	margin: 0 auto;
 	text-align: center;
 }
 #header{
 	padding: 5px;
 	margin-bottom: 5px;
 }
 #sidebar-left{
 	width:15%;
 	padding:5px;
 	float:left;
 }
 #content{
 	width: 75%;
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
	<aside id="sidebar-left">
		<tiles:insertAttribute name="side"/>
	</aside>
	<section id="content">
		<tiles:insertAttribute name="body"/>
	</section>
	<footer id="footer">
		<tiles:insertAttribute name="footer"/>
	</footer>
</div>

</body>
</html>