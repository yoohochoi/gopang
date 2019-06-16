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
		<h1>Forgot Password?</h1>
	</div>
	<div class="login-form">
		<form name="loginForm" id="loginForm">
			<h2 class="text-center">비밀번호 찾기</h2>
			<div class="form-group">
				<input type="text" name="email" id="email" class="form-control" placeholder="email" required="required">
			</div>
			<div class="form-group">
				<button type="button" id="login" class="btn btn-primary btn-block">인증</button>
			</div>
			<div class="clearfix">
				<label class="pull-left checkbox-inline"> 
				<input type="checkbox"> Remember me
				</label><a href="#none" class="pull-right">다른방법</a>
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
				url : "/user/emailAuth.do",
				dataType : "text",
				data : params,
				success : function(args) {
					if (args == 1) {
						alert("임시 비밀번호가 메일로 보내드렸습니다.");
						window.location = "/user/UserLogin.do";
					}else if(args == 2){
						alert("해당 이메일은 존재하지 않습니다.");
						location.reload();
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