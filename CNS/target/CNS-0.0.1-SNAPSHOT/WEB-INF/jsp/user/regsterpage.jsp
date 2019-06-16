<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="/resources/assets/css/main3.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

</head>
<body class="is-preload">

	<!-- Header -->
	<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
	
	<div id="heading" >
		<h1>sign up</h1>
	</div>
	
	<div class="signup-form">
    <form id="formsign" name="formsign">
		<h2>Sign Up</h2>
		<p>Please fill in this form to create an account!</p>
		<hr>
		<div class="form-group">
			<label>ID</label>
        	<input type="text" class="form-control" name="userid" required="required">
        </div>
        <div class="form-group">
			<label>Password</label>
            <input type="password" class="form-control" name="password" required="required">
        </div>
		<div class="form-group">
			<label>Confirm Password</label>
            <input type="password" class="form-control" name="confirm_password" required="required">
        </div>
        <div class="form-group">
			<label>Username</label>
        	<input type="text" class="form-control" name="username" required="required">
        </div>
        <div class="form-group">
			<label>Email Address</label>
        	<input type="email" class="form-control" name="email" required="required">
        </div>
        
		<div class="form-group">
            <p align="right"><button type="button" id="signup" class="btn btn-primary btn-lg">Sign Up</button></p>
        </div>
    </form>
	<div class="text-center">Already have an account? <a href="/user/UserLogin.do">Login here</a></div>
</div>

<!-- Footer -->
	<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>
	
	<script type="text/javascript">
	
		$("#signup").click(function() {
			
			var params = $("#formsign").serialize();
			
			$.ajax({
				type:"POST",
				url:"/user/UserRegster.do",
				data : params,
				dataType : "text",
				success : function(msg) {
					if(msg == 0){
						alert("가입을 축하합니다");
						window.location = "/home/home.do";
					}else if(msg == 1){
						alert("이미 등록된 회원입니다.");
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