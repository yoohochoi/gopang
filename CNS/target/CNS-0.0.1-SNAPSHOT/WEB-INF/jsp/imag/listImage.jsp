<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Industrious by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>KCH</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	</head>
	<body class="is-preload">

		<!-- Header -->
			<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

		<!-- Heading -->
			<div id="heading" >
				<h1>회원 사진</h1>
			</div>
			<section id="three" class="main style1 special">
				<div class="container">
				<br>
					<p align="center"><button type="button" id="addimage" value="등록하기">등록하기</button></p>
					<div class="row gtr-150">
					<c:forEach items="${list }" var="list">
						<div class="col-4 col-12-medium">
							<span class="image fit"><img src="/resources/userImage/${list.imagName }" alt="" /></span>
							<h3 align="center">${list.nicname }</h3>
							${list.title }
							<ul class="actions special">
								<li><a href="/img/detailimage.do?imagseq=${list.imagseq }" class="button">More</a></li>
							</ul>
						</div>
					</c:forEach>
					</div>
				</div>
				<%@ include file="/WEB-INF/jsp/layout/paging.jsp" %>
			</section>
			
		<!-- Footer -->
			<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>
			
		<script type="text/javascript">
			$("#addimage").click(function(){
				$.ajax({
					url : "/imag/addimagpage.do",
					type : "get",
					dataType : 'text',
					success : function(result) {
						if(result == '0'){
							alert("로그인 후 사용 가능합니다.");
							window.location = "/user/UserLogin.do";
						}else if(result == '1'){
							window.location = "/imag/imagpage2.do";
						}
					},
					error : function(err) {
						alert(err.responseText);
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