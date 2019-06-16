<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>KCH</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/main2.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="is-preload">

	<!-- Header -->
	<%@ include file="/WEB-INF/jsp/layout/header.jsp"%>
	<div id="heading">
		<h1>login</h1>
	</div>
	<div class="login-form">
		<form name="loginForm" id="loginForm">
			<h2 class="text-center">Log in</h2>
			<div class="form-group">
				<input type="text" name="userid" id="userid" class="form-control" placeholder="ID" required="required">
			</div>
			<div class="form-group">
				<input type="password" name="pw" id='pw' class="form-control" placeholder="Password" required="required">
			</div>
			<div class="form-group">
				<button type="button" id="login" class="btn btn-primary btn-block">Log in</button>
			</div>
			<div class="clearfix">
				<label class="pull-left checkbox-inline"> 
				<input type="checkbox"> Remember me
				</label><a href="/user/findPassword.do" class="pull-right">Forgot Password?</a>
			</div>
		</form>
		<p class="text-center">
			<a href="/user/regsterpage.do">Create an Account</a>
		</p>
	</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/jsp/layout/footer.jsp"%>

	<script type="text/javascript">
		$("#login").click(function() {

			var params = $("#loginForm").serialize();

			$.ajax({
				type : "POST",
				url : "/user/login.do",
				dataType : "text",
				data : params,
				success : function(args) {
					if (args == 0) {
						alert("환영합니다.");
						window.location = "/home/home.do";
					} else if (args == 1) {
						alert("ID/PW가 일치하지 않습니다.");
					} else {
						alert("Error 관리자에 문의하세요.")
					}
				},
				error : function(e) {
					alert(e.responseText);
				}
			})
		})
	</script>

	<!-- Scripts -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>

</body>

</html>