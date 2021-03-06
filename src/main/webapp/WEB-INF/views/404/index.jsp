<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>404</title>
    <link href="${pageContext.request.contextPath}/resources/user/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/user/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/user/css/prettyPhoto.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/user/css/price-range.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/user/css/animate.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/user/css/main.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/user/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/resources/user/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/resources/user/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/resources/user/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/user/images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<div class="container text-center">
		<div class="logo-404">
			<a href="index.html"><img src="${pageContext.request.contextPath}/resources/user/images/home/logo.png" alt="" /></a>
		</div>
		<div class="content-404">
			<img src="${pageContext.request.contextPath}/resources/user/images/404/404.png" class="img-responsive" alt="" />
			<h1><b>OPPS!</b> We Couldn???t Find this Page</h1>
			<p>Uh... So it looks like you brock something. The page you are looking for has up and Vanished.</p>
			<h2><a href="${pageContext.request.contextPath}/user/home">Bring me back Home</a></h2>
		</div>
	</div>

  
    <script src="${pageContext.request.contextPath}/resources/user/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/user/js/price-range.js"></script>
    <script src="${pageContext.request.contextPath}/resources/user/js/jquery.scrollUp.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/user/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/user/js/jquery.prettyPhoto.js"></script>
    <script src="${pageContext.request.contextPath}/resources/user/js/main.js"></script>
</body>
</html>