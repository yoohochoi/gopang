<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>KCH</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
	</head>
	<body class="is-preload">
		
		<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
		
		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<h1>Industrious</h1>
					<p>A responsive business oriented template with a video background<br />
					designed by <a href="https://templated.co/">TEMPLATED</a> and released under the Creative Commons License.</p>
				</div>
				<video autoplay loop muted playsinline src="/resources/images/banner.mp4"></video>
			</section>

		<!-- Highlights -->
			<section class="wrapper">
				<div class="inner">
					<header class="special">
						<h2>Sem turpis amet semper</h2>
						<p>In arcu accumsan arcu adipiscing accumsan orci ac. Felis id enim aliquet. Accumsan ac integer lobortis commodo ornare aliquet accumsan erat tempus amet porttitor.</p>
					</header>
					<div class="highlights">
						<section>
							<div class="content">
								<header>
									<a href="/imag/imagpage.do" class="icon fa-vcard-o"><span class="label">Icon</span></a>
									<h3>회원 사진</h3>
								</header>
								<p>회원 사진 등록</p>
							</div>
						</section>
						<section>
							<div class="content">
								<header>
									<a href="/user/userList.do" class="icon fa-files-o"><span class="label">Icon</span></a>
									<h3>회원 정보</h3>
								</header>
								<p>회원 정보 공개</p>
							</div>
						</section>
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						<section>
							<div class="content">
								<header>
									<a href="#" class="icon fa-floppy-o"><span class="label">Icon</span></a>
									<h3>Ipsum consequat</h3>
								</header>
								<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
							</div>
						</section>
						<section>
							<div class="content">
								<header>
									<a href="#" class="icon fa-line-chart"><span class="label">Icon</span></a>
									<h3>Interdum gravida</h3>
								</header>
								<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
							</div>
						</section>
						<section>
							<div class="content">
								<header>
									<a href="#" class="icon fa-paper-plane-o"><span class="label">Icon</span></a>
									<h3>Faucibus consequat</h3>
								</header>
								<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
							</div>
						</section>
						<section>
							<div class="content">
								<header>
									<a href="#" class="icon fa-qrcode"><span class="label">Icon</span></a>
									<h3>Accumsan viverra</h3>
								</header>
								<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
							</div>
						</section>
					</div>
				</div>
			</section>

		<!-- CTA -->
			<section id="cta" class="wrapper">
				<div class="inner">
					<h2>Curabitur ullamcorper ultricies</h2>
					<p>Nunc lacinia ante nunc ac lobortis. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus ornare mi ut ante amet placerat aliquet. Volutpat eu sed ante lacinia sapien lorem accumsan varius montes viverra nibh in adipiscing. Lorem ipsum dolor vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing sed feugiat eu faucibus. Integer ac sed amet praesent. Nunc lacinia ante nunc ac gravida.</p>
				</div>
			</section>

		<!-- Testimonials -->
			<section class="wrapper">
				<div class="inner">
					<header class="special">
						<h2>Faucibus consequat lorem</h2>
						<p>In arcu accumsan arcu adipiscing accumsan orci ac. Felis id enim aliquet. Accumsan ac integer lobortis commodo ornare aliquet accumsan erat tempus amet porttitor.</p>
					</header>
					<div class="testimonials">
						<section>
							<div class="content">
								<blockquote>
									<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
								</blockquote>
								<div class="author">
									<div class="image">
										<img src="/resources/images/pic01.jpg" alt="" />
									</div>
									<p class="credit">- <strong>Jane Doe</strong> <span>CEO - ABC Inc.</span></p>
								</div>
							</div>
						</section>
						<section>
							<div class="content">
								<blockquote>
									<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
								</blockquote>
								<div class="author">
									<div class="image">
										<img src="/resources/images/pic03.jpg" alt="" />
									</div>
									<p class="credit">- <strong>John Doe</strong> <span>CEO - ABC Inc.</span></p>
								</div>
							</div>
						</section>
						<section>
							<div class="content">
								<blockquote>
									<p>Nunc lacinia ante nunc ac lobortis ipsum. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus.</p>
								</blockquote>
								<div class="author">
									<div class="image">
										<img src="/resources/images/pic02.jpg" alt="" />
									</div>
									<p class="credit">- <strong>Janet Smith</strong> <span>CEO - ABC Inc.</span></p>
								</div>
							</div>
						</section>
					</div>
				</div>
			</section>
				
		<!-- Footer -->
			<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>

		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/browser.min.js"></script>
			<script src="/resources/assets/js/breakpoints.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>