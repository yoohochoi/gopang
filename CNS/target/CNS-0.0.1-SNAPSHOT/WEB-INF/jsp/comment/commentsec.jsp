<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
</head>

<body>

	<form id="formComment">
		<input type="hidden" name="parent" value="${commentseq }">
		<input type="hidden" name="imageseq" value="${imageseq }">
		
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
		<h3>내용 : <input type="text" name="comment"></h3>
		<p align="right">
			<!-- <button type="submit" class="btn">등록</button> -->
 			<button type="button" id="addcomment">등록</button>
		</p>
	</form>
</body>
<script type="text/javascript">
$("#addcomment").click(function(){
	var params = $("#formComment").serialize();
	$.ajax({
		url : "/comment/addcommentsec.do",
		type : "GET",
		datatype : "text",
		data : params,
		success : function(response) {
			if(response == 1){
				alert("등록 완료되었습니다.");
				window.close();
			}
		},
	})
})
</script>

</html>