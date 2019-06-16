<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>KCH</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<script src="/resources/assets/js/jquery.min.js"></script>
		<link rel="stylesheet" href="/resources/assets/css/main2.css" />

	</head>
	<body class="is-preload">

		<!-- Header -->
			<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

		<!-- Heading -->
			<div id="heading" >
				<h1>image</h1>
			</div>
			<div class="login-form">
				<div class="form-group">
					<label>닉네임</label>
				       	<h3>${vo.nicname }</h3>
			    </div>
				<div class="form-group">
					<label>제목</label>
				      	<h3>${vo.title }</h3>
		        </div>
		        <div class="form-group">
					<label>이미지</label>
			            <span class="image fit"><img src="/resources/userImage/${vo.imagName }" alt="" /></span>
		        </div>
		        <div class="form-group">
					<label>내용</label>
			            <h2>${vo.content }</h2>
		        </div>
		        <div class="form-group">
		            <p align="right">
			            <button type="button" id="updateButton" class="btn btn-primary btn-lg">수정하기</button>
			            <button type="button" id="deleteButton" class="btn btn-primary btn-lg">삭제하기</button></p>
		        </div>
			        <p align="center"><a href="/imag/imagpage.do" class="button">목록</a></p>
			</div>
			<div class="login-form">
				<div class="form-group" style="border:2px solid; padding:10px;">
					<form id="formComment" method="post">
					<input type="hidden" name="imageseq" value="${vo.imagseq }">
					<label>댓글등록</label>
					<c:if test="${user == null }">
						<input type="hidden" name="username" value="비회원">
						<input type="hidden" name="userid" value="게스트">
						<h3>비회원님</h3>
					</c:if>
					<c:if test="${user != null }">
						<input type="hidden" name="username"  value="${user.username }">
						<input type="hidden" name="userid"  value="${user.userid }">
						<h3>${user.username }님</h3>
					</c:if>
					<textarea name="comment" required="required" placeholder="댓글을 입력해 주세요!!"></textarea>
					<br><div align="right"><button type="button" id="addcomment" >등록하기</button></div>
					</form>
				</div>
			</div>
			
			
			
			<div class="login-form">
				<div class="form-group" style="border:0px solid; padding:10px;">
				<label>댓글내용</label>
				<h3>
				<c:forEach items="${commentlist }" var="list">
					<c:if test="${list.depth eq '0'}">
						* ${list.username }님 : 
						<a onclick="return commentsec(${list.commentseq}, ${list.imageseq });">${list.comment }</a>
						[${list.regdate }]
					<c:if test="${user.userid eq list.userid}">
						<a onclick="return delcomment(${list.commentseq});" href="#none"><img alt="" src="/resources/images/x.jpeg"></a>
					</c:if>
					<br>
					</c:if>
					<c:if test="${list.depth ne 0}">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img alt="" src="/resources/images/225767fae7a398f.jpg">
						${list.username }님 : ${list.comment }[${list.regdate }]<br>
					</c:if>
					</c:forEach>
				</h3>
				</div>		
			</div>
			
		<!-- Footer -->
			<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>
			
			<script type="text/javascript">
			
				function commentsec(seq, imageseq) {
					var zz;
					zz = window.open('/comment/addcommentsecPage.do?commentseq='+seq+'&imageseq='+imageseq, '_blank', 'width=300, height=250');
					zz.focus();
				}
			
				function delcomment(commentseq) {
					alert("fh" + commentseq);
					var confirm = confirm("정말 삭제하시겠습니까?");
					
					if(confirm == true){
						alert("삭제 완료하였습니다.");
						location.reload();
						}
					}
				
				$("#addcomment").click(function(){
					var params = $("#formComment").serialize();
					$.ajax({
						url : "/commet/addcomment.do",
						type : "post",
						datatype : "text",
						data : params,
						success : function(response) {
							if(response == 1){
								alert("등록 완료되었습니다.");
								location.reload();	
							}
						},
					})
				})
			
				$("#updateButton").click(function() {
					
					$.ajax({
						url : "/img/updatepage.do?imageseq=${vo.imagseq}",
						type: "GET",
						datatype : "text",
						success : function(result) {
							if(result == '0'){
								alert("로그인 후 사용 가능합니다.")
								window.location = "/home/home.do";
							}else if(result == '1'){
								alert("사용 할 수 없는 메뉴입니다.");
							}else if(result == '2'){
								window.location = "/img/updatepage2.do?imageseq=${vo.imagseq}";
							}
						} 
					})
				})
				
				$("#deleteButton").click(function(){
					var con_test = confirm("정말 삭제하시겠습니까?");
					if(con_test == true){
						$.ajax({
							url : "/img/deletepage.do?imageseq=${vo.imagseq}",
							type :"GET",
							datatype : "text",
							success : function(result) {
								if(result == '0'){
									alert("삭제 완료 하였습니다.");
									window.location = "/imag/imagpage.do";
								}else if(result == '1'){
									alert("사용 할 수 없는 메뉴입니다.");
								}else if(result == '2'){
									alert("로그인 후 사용 가능 합니다.")
									window.location = "/user/UserLogin.do";
								}
							}
								
						})
						}
					else if(con_test == false){
						window.location = "/imag/imagpage.do";
						}
				})
			</script>
			
			
		<!-- Scripts -->
			<script src="/resources/assets/js/browser.min.js"></script>
			<script src="/resources/assets/js/breakpoints.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>