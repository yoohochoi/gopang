<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<!-- Header -->
			<header id="header">
				<c:if test="${user.userid != null }"><a class="logo" href="/home/home.do">${user.username }님 환영합니다.</a></c:if>
				<c:if test="${user.userid == null }"><a class="logo" href="/user/UserLogin.do">[로그인]</a></c:if>
				
				<nav>
					<a href="#menu">Menu</a>
				</nav>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="/home/home.do">Home</a></li>
					<c:if test="${user.userid == null }"><li><a href="/user/UserLogin.do">login</a></li></c:if>
					<c:if test="${user.userid != null }"><li><a href="/user/logout.do">logout</a></li></c:if>
					<li><a href="/imag/imagpage.do">회원사진</a></li>
					<li><a href="/user/userList.do">회원정보</a></li>
				</ul>
			</nav>
</body>
</html>