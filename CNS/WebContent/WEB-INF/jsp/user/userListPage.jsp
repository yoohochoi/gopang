<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>KCH</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main4.css" />
		<link rel="stylesheet" href="/resources/assets/css/main2.css" />
		<script src="/resources/assets/js/jquery.min.js"></script>
		
	</head>
	<body class="is-preload">

		<!-- Header -->
			<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

		<!-- Heading -->
			<div id="heading" >
				<h1>회원 정보</h1>
			</div>
			<div class="login-form">
				<c:if test="${user.userid eq 'admin' }">
				<p align="right"><a href="/user/excelDowm.do" class="button">엑셀 다운로드</a>
				<a href="/user/uploadExcelPage.do" class="button">엑셀 업로드</a></p>
				</c:if>
				<table>
					<tr>
						<td>번호</td>
						<td>아이디</td>
						<td>이름</td>
						<td>이메일</td>
						<td>등록 날짜</td>
						<td>포인트</td>
						<td>실패횟수</td>
						<c:if test="${user.userid eq 'admin' }">
						<td>초기화</td>
						</c:if>
					</tr>
					<c:forEach items="${list }" var="list" varStatus="sts">
						<tr>
							<td align="center">${sts.count }</td>
							<td>${list.userid }</td>
							<c:if test="${user.userid eq 'admin' or user.userid eq list.userid}">
							<td><a href="/user/regsterpage.do?userid=${list.userid }">${list.username }</a></td>
							</c:if>
							<c:if test="${user.userid ne 'admin' and user.userid ne list.userid}">
							<td>${list.username }</td>
							</c:if>
							<td>${list.email }</td> 
							<td>${list.regdate }</td>
							<td>${list.point }</td>
							<td align="center">${list.login_cnt }</td>
							<c:if test="${user.userid eq 'admin' }">
							<td><a class="btn" href="#none" >초기화</a></td>
							</c:if>
						</tr>
					</c:forEach>
					
					
				</table>
			
			
			
				<p align="center"><a href="/home/home.do" class="button">목록</a></p>
			</div>
			
			
			
		<!-- Footer -->
			<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>
			
		<!-- Scripts -->
			<script src="/resources/assets/js/browser.min.js"></script>
			<script src="/resources/assets/js/breakpoints.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>